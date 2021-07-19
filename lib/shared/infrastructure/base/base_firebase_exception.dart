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

  static const _errorlInvalidEmail = 'invalid-email';
  static const _errorWrongPassword = 'wrong-password';
  static const _errorUserNotFound = 'user-not-found';
  static const _errorUserDisabled = 'user-disabled';
  static const _errorTooManyRequests = 'too-many-requests';
  static const _errorOperationNotAllowed = 'operation-not-allowed';

  static AppFirebaseEmailAuthException getErrorEmailAuthMessage(String code) {
    print(code);
    switch (code) {
      case _errorlInvalidEmail:
        {
          return AppFirebaseEmailAuthException(errorMessage: 'Invalid email');
        }
      case _errorWrongPassword:
        {
          return AppFirebaseEmailAuthException(errorMessage: 'Wrong password');
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
