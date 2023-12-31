class AppException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message])
      : super(message, "Invalid Request. Try again. ");
}

class UnknownException extends AppException {
  UnknownException([message]) : super(message, "");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message])
      : super(message, "Unauthorised request. Try again. ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, "Invalid Input. Try again. ");
}

class InValidCredentialException extends AppException {
  InValidCredentialException([message]) : super(message, "");
}
