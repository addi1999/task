// ignore_for_file: empty_catches

import 'dart:convert';
// import 'dart:math';

import 'package:task1/feature/home/model/home_model.dart';
import 'package:http/http.dart' as http;



class HomeService {
  Future<Menus?> fetchmenu({required Map<String, dynamic> params}) async {
    try {
      http.Response result =await http.get(Uri.parse("https://mumbaimillionaires.in/mmApi/api/show/menu-list?customer_id=1&hotel_id=2"));
      // http.Response result = await HttpService().apiService(
      //     method: METHOD.get, endpoint: Endpoints.homeUrl, params: params);
      if (result.statusCode == 200) {
        final menus =Menus.fromJson(jsonDecode(result.body));
        return menus;
      }
      // return null;
    } catch (e) {
    }
    return null;
    // return null;
  }
}
