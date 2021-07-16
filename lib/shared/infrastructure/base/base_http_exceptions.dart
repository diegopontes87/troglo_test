import 'package:troglo_test/shared/res/app_http.dart';
import 'package:troglo_test/shared/res/app_res.dart';
import 'package:dio/dio.dart';

class BaseHttpExceptions {
  String? error;
  String? errorMessage;
  BaseHttpExceptions({this.error, this.errorMessage});
  static BaseHttpExceptions handleException(DioError? error) {
    switch (error?.response?.statusCode) {
      case 404:
        return NotFoundException(
          error: '404',
          errorMessage: AppRes.appText.notFoundError,
        );
      default:
        if (error!.message.contains(AppHttp.networkErrorCode))
          return NetWorkException(
            error: AppRes.appText.networkConnectionError,
            errorMessage: AppRes.appText.networkConnectionMessage,
          );
        return GenericException(
          error: '500',
          errorMessage: AppRes.appText.genericErrorMessage,
        );
    }
  }
}

class ValidationException extends BaseHttpExceptions {
  String? error;
  String? errorMessage;
  ValidationException({this.error, this.errorMessage}) : super(error: error, errorMessage: errorMessage);
}

class ForbiddenException extends BaseHttpExceptions {
  String? error;
  String? errorMessage;
  ForbiddenException({this.error, this.errorMessage}) : super(error: error, errorMessage: errorMessage);
}

class NotFoundException extends BaseHttpExceptions {
  String? error;
  String? errorMessage;
  NotFoundException({this.error, this.errorMessage}) : super(error: error, errorMessage: errorMessage);
}

class GenericException extends BaseHttpExceptions {
  String? error;
  String? errorMessage;
  GenericException({this.error, this.errorMessage}) : super(error: error, errorMessage: errorMessage);
}

class NetWorkException extends BaseHttpExceptions {
  String? error;
  String? errorMessage;
  NetWorkException({this.error, this.errorMessage}) : super(error: error, errorMessage: errorMessage);
}
