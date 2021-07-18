import 'package:troglo_test/shared/res/app_http.dart';
import 'package:dio/dio.dart';
import 'package:troglo_test/shared/res/app_strings.dart';

class BaseHttpExceptions {
  String? error;
  String? errorMessage;
  BaseHttpExceptions({this.error, this.errorMessage});
  static BaseHttpExceptions handleException(DioError? error) {
    switch (error?.response?.statusCode) {
      case 400:
        return NotFoundException(
          error: 'Entity Error',
          errorMessage: 'One or more parameters are empty!',
        );
      case 404:
        return NotFoundException(
          error: AppStrings.notFoundError,
          errorMessage: error?.response?.statusMessage ?? AppStrings.genericMessage,
        );
      default:
        if (error!.message.contains(AppHttp.networkErrorCode))
          return NetWorkException(
            error: AppStrings.networkError,
            errorMessage: AppStrings.networkMessage,
          );
        return GenericException(
          error: AppStrings.genericError,
          errorMessage: AppStrings.genericMessage,
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
