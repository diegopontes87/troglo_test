import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:troglo_test/core/data/user/entities/user_credentials_entity.dart';
import 'package:troglo_test/core/domain/user/usecases/login_with_mail_usecase.dart';
import 'package:troglo_test/shared/infrastructure/base/base_controller.dart';
import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';

class LoginController extends BaseController {
  LoginWithEmailUsecase _loginWithEmailUsecase;
  TextEditingController emailTextFieldController = TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginController(this._loginWithEmailUsecase);

  String? emailFieldValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "Email can't be null";
    } else if (!email.isEmail) {
      return "Email is not valid!";
    } else {
      return '';
    }
  }

  String? passwordFieldValidator(String? password) {
    if (password == null || password.isEmpty) {
      return "Password can't be null";
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
      print('success');
    });
  }
}
