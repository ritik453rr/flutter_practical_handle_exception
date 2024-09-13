class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);
  
  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication");
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, "Invalid Requesst");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, "Anauthorised Request");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, "Invalid Input");
}

