// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import '../store/hive_store.dart';
// import '../utils/common_logics.dart';
// import '../utils/models/error_response_model.dart';
import 'app_exception.dart';
import 'endpoints.dart';

class HttpService {
  BuildContext? context;

  static bool isShowing = true;

  //Singleton Class
  static final HttpService _default = HttpService._internal();

  factory HttpService() {
    return _default;
  }

  HttpService._internal();

  static getInstance() {
    return _default;
  }

  ///need to make it static
  Future apiService(
      {GlobalKey? key,
      header,
      body,
      bool multiPart = false,
      params,
      METHOD method = METHOD.post,
      SSL ssl = SSL.https,
      baseURL = Endpoints.baseUrl,
      commonPoint = Endpoints.commonUrl,
      endpoint,
      filePath,
      String fileKey = 'attachments',
      attachmentList,
      nextFileKey}) async {
    if (await networkCheck()) {
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          if (isShowing) {
            isShowing = false;
            return AlertDialog(
              title: Text("No Network Found".tr),
              content: Text("Please check your internet connection".tr),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    isShowing = true;
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          } else {
            isShowing = false;
            Navigator.pop(context);
            return AlertDialog(
              title: Text("No Network Found".tr),
              content: Text("Please check your internet connection".tr),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                TextButton(
                  child: const Text("AppString.close.tr"),
                  onPressed: () {
                    isShowing = true;
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
        },
      );
    } else {
      dynamic param;
      if (multiPart) {
        // param = {
        //   'uploadType': params.toString(),
        // };
      } else {
        param = params;
      }
      var endPoint = commonPoint + endpoint;
      dynamic uri;

      if (ssl == SSL.http) {
        uri =
            Uri.http(Uri.encodeFull(baseURL), Uri.encodeFull(endPoint), param);
      } else {
        if (Endpoints.isDevelopment) {
          uri = Uri.http(
              Uri.encodeFull(baseURL), Uri.encodeFull(endPoint), param);
        } else {
          uri = Uri.https(
              Uri.encodeFull(baseURL), Uri.encodeFull(endPoint), param);
        }
      }

      final token = HiveStore().get(Keys.token);

      Map<String, String> requestHeaders = method == METHOD.multipart
          ? {
              'Content-type': 'multipart/form-data',
              HttpHeaders.acceptHeader: 'application/json',
              "X-Requested-With": "XMLHttpRequest",
              if (token != null)
                HttpHeaders.authorizationHeader: "Bearer $token",
            }
          : {
              'Content-Type': 'application/json',
              HttpHeaders.acceptHeader: 'application/json',
              "X-Requested-With": "XMLHttpRequest",
              if (token != null)
                HttpHeaders.authorizationHeader: "Bearer $token",
            };
      if (header != null) {
        requestHeaders.addAll(header);
      }
      if (body != null && method != METHOD.multipart) {
        body = json.encode(body);
      }
      debugPrint("Header :  $requestHeaders");
      debugPrint("Body :  $body");
      debugPrint("Params :  $params");
      debugPrint("URL :  $uri");
      debugPrint("Method :  $method");

      switch (method) {
        case METHOD.get:
          {
            dynamic responseJson;
            try {
              final response = await http.get(uri, headers: requestHeaders);
              // responseJson = _returnResponse(response);
              printResponse(response);

              return checkResponse(response: response);
            } catch (error) {
              log(error.toString());
            }
            return responseJson;
          }
        case METHOD.post:
          {
            try {
              final response =
                  await http.post(uri, headers: requestHeaders, body: body);
              debugPrint("response: ${response.body}");
              // return _returnResponse(response);
              printResponse(response);

              return checkResponse(response: response);
            } on Exception catch (exception) {
              debugPrint(exception.toString());
              throw UnknownException(exception.toString());
            }
          }
        case METHOD.put:
          {
            dynamic responseJson;
            try {
              final response =
                  await http.put(uri, headers: requestHeaders, body: body);
              printResponse(response);
              return checkResponse(response: response);
              // responseJson = _returnResponse(response);
            } catch (error) {
              log(error.toString());
            }
            return responseJson;
          }
        case METHOD.delete:
          {
            dynamic responseJson;
            try {
              final response = await http.delete(uri, headers: requestHeaders);
              // responseJson = _returnResponse(response);
              printResponse(response);
              return checkResponse(response: response);
            } catch (error) {
              log(error.toString());
            }
            return responseJson;
          }
        case METHOD.patch:
          {
            dynamic responseJson;
            try {
              final response =
                  await http.patch(uri, headers: requestHeaders, body: body);
              // responseJson = _returnResponse(response);
              printResponse(response);
              return checkResponse(response: response);
            } catch (error) {
              debugPrint(error.toString());
            }
            return responseJson;
          }

        case METHOD.multipart:
          {
            dynamic responseJson;

            try {
              var request = http.MultipartRequest(
                'POST',
                uri,
              );
              request.headers.addAll(requestHeaders);
              // request.headers.addAll(requestHeaders);
              if (body != null) {
                request.fields.addAll(body);
              }
              if (filePath is List<File?>?) {
                List<http.MultipartFile> data = <http.MultipartFile>[];
                for (int i = 0; i < filePath!.length; i++) {
                  final mimeTypeData = lookupMimeType(filePath[i]!.path,
                          headerBytes: [0xFF, 0xD8])!
                      .split('/');
                  data.add(await http.MultipartFile.fromPath(
                      '$fileKey[$i]', filePath[i]!.path,
                      contentType:
                          MediaType(mimeTypeData[0], mimeTypeData[1])));
                  log('Attachment data : ${filePath[i]!.path}');
                }
                request.files.addAll(data);
              } else if (filePath != null && filePath.isNotEmpty) {
                final mimeTypeData =
                    lookupMimeType(filePath, headerBytes: [0xFF, 0xD8])!
                        .split('/');
                request.files.add(await http.MultipartFile.fromPath(
                    fileKey, filePath,
                    contentType: MediaType(mimeTypeData[0], mimeTypeData[1])));
                debugPrint("Request : $request");
              }
              /*if (attachmentList != null && nextFileKey != null) {
                if (attachmentList is List<File?>?) {
                  if (attachmentList!.isNotEmpty) {
                    List<http.MultipartFile> data = <http.MultipartFile>[];
                    for (int i = 0; i < filePath.length; i++) {
                      final mimeTypeData = lookupMimeType(filePath[i].path,
                              headerBytes: [0xFF, 0xD8])!
                          .split('/');
                      data.add(await http.MultipartFile.fromPath(
                          '$nextFileKey[$i]', attachmentList[i]!.path,
                          contentType:
                              MediaType(mimeTypeData[0], mimeTypeData[1])));
                    }
                    request.files.addAll(data);
                  }
                } else {
                  final mimeTypeData =
                      lookupMimeType(filePath, headerBytes: [0xFF, 0xD8])!
                          .split('/');
                  request.files.add(await http.MultipartFile.fromPath(
                      nextFileKey, attachmentList,
                      contentType:
                          MediaType(mimeTypeData[0], mimeTypeData[1])));
                  debugPrint("Request : $request");
                }
              }*/
              debugPrint("Request : $request");
              final http.StreamedResponse response = await request.send();
              debugPrint("API_Status: ${response.reasonPhrase}");
              responseJson = await http.Response.fromStream(response);
              /*responseJson = _returnResponse(responseJson);*/
            } catch (error) {
              debugPrint(error.toString());
            }

            ///todo change implementation
            return checkResponse(response: responseJson);
          }
        default:
          {
            dynamic responseJson;
            try {
              final response =
                  await http.post(uri, headers: requestHeaders, body: body);
              responseJson = _returnResponse(response);
            } catch (error) {
              debugPrint(error.toString());
            }
            return responseJson;
          }
      }
    }
  }

  checkResponse({required http.Response response}) {
    if (response.statusCode == 401) {
      // logout();
      return response;
    }
    return response;
  }

  dynamic _returnResponse(http.Response response) {
    var responseJson = json.decode(response.body.toString());

    switch (response.statusCode) {
      case 200:
        log(responseJson.toString());
        return responseJson;

      case 400:
        // throw UnknownException(ErrorResponseModel.fromJson(responseJson).error);

      case 401:
        throw UnauthorisedException(
            // ErrorEmptyResponseModel.fromJson(responseJson).error
            );

      case 500:
        throw UnknownException(
            // ErrorEmptyResponseModel.fromJson(responseJson).error
            );

      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<bool> networkCheck() async {
    try {
      final result = await InternetAddress.lookup(Endpoints.googleUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return false;
      } else {
        return true;
      }
    } on SocketException catch (_) {
      return true;
    }
  }

  void printResponse(http.Response response) {
    var responseJson = json.decode(response.body.toString());
    log(responseJson.toString());
  }
}

enum METHOD {
  get,
  put,
  post,
  delete,
  patch,
  multipart,
}

enum SSL {
  http,
  https,
}
