import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:troglo_test/core/data/user/entities/user_credentials_entity.dart';
import 'package:troglo_test/core/domain/user/usecases/login_with_mail_usecase.dart';
import 'package:troglo_test/shared/infrastructure/base/base_controller.dart';
import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:troglo_test/shared/res/app_routes.dart';

class LoginController extends BaseController {
  LoginWithEmailUsecase _loginWithEmailUsecase;
  TextEditingController emailTextFieldController = TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginController(this._loginWithEmailUsecase);

  String? emailFieldValidator(String? email, Function callbackError) {
    if (email == null || email.isEmpty) {
      callbackError('Missed Field:', "Email field can't be empty.");
    } else if (!email.isEmail) {
      callbackError('Error', 'Please insert a valid email address');
    } else {
      return '';
    }
  }

  String? passwordFieldValidator(String? password, Function callbackError) {
    if (password == null || password.isEmpty) {
      callbackError('Missed Field:', "Password field can't be empty.");
    } else {
      return '';
    }
  }

  Future fieldsValidator() async {
    if (!formKey.currentState!.validate()) {
      changeScreenState(ScreenState.loadingState);
      await loginWithEmail();
      changeScreenState(ScreenState.doneState);
    }
  }

  Future loginWithEmail() async {
    final entity = UserCredentialsEntity(email: emailTextFieldController.text, password: passwordTextFieldController.text);
    var result = await _loginWithEmailUsecase(entity);
    result.when((exception) {
      firebaseExceptionHandler(exception);
    }, (success) {
      goToPage(AppRoutes.homePage);
    });
  }
}
