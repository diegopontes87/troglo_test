import 'package:troglo_test/shared/res/app_strings.dart';

class BaseFirebaseException {
  String? error;
  String? errorMessage;

  BaseFirebaseException({
    this.error = AppStrings.error,
    this.errorMessage,
  });
}

class AppFirebaseEmailAuthException extends BaseFirebaseException {
  String? errorMessage;
  AppFirebaseEmailAuthException({this.errorMessage});

  static const _errorlInvalidEmail = 'ERROR_INVALID_EMAIL';
  static const _errorWrongPassword = 'ERROR_WRONG_PASSWORD';
  static const _errorUserNotFound = 'ERROR_USER_NOT_FOUND';
  static const _errorUserDisabled = 'ERROR_USER_DISABLED';
  static const _errorTooManyRequests = 'ERROR_TOO_MANY_REQUESTS';
  static const _errorOperationNotAllowed = 'ERROR_OPERATION_NOT_ALLOWED';

  static AppFirebaseEmailAuthException getErrorEmailAuthMessage(String code) {
    switch (code) {
      case _errorlInvalidEmail:
        {
          return AppFirebaseEmailAuthException(errorMessage: 'Invalid email');
        }
      case _errorWrongPassword:
        {
          return AppFirebaseEmailAuthException(errorMessage: 'Invalid password');
        }
      case _errorUserNotFound:
        {
          return AppFirebaseEmailAuthException(errorMessage: 'User not found!');
        }
      case _errorUserDisabled:
        {
          return AppFirebaseEmailAuthException(errorMessage: 'User disabled!');
        }
      case _errorTooManyRequests:
        {
          return AppFirebaseEmailAuthException(errorMessage: 'To many requests. Wait and try again.');
        }
      case _errorOperationNotAllowed:
        {
          return AppFirebaseEmailAuthException(errorMessage: 'Not allowed operation.');
        }
      default:
        {
          return AppFirebaseEmailAuthException(errorMessage: AppStrings.genericMessage);
        }
    }
  }
}
