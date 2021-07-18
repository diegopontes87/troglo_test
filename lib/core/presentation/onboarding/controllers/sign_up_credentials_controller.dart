import 'package:flutter/material.dart';
import 'package:troglo_test/core/data/user/entities/user_credentials_entity.dart';
import 'package:troglo_test/core/data/user/entities/user_info_entity.dart';
import 'package:troglo_test/core/domain/user/usecases/save_user_info_usecase.dart';
import 'package:troglo_test/core/domain/user/usecases/sign_up_with_email_usecase.dart';
import 'package:troglo_test/shared/infrastructure/base/base_controller.dart';
import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:get/utils.dart';

class SignUpCredentialsController extends BaseController {
  UserInfoEntity? userInfoEntity;
  TextEditingController emailTextFieldController = TextEditingController();
  TextEditingController confirmEmailTextFieldController = TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();
  TextEditingController confirmPasswordTextFieldController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpWithEmailUsecase _signUpWithEmailUsecase;
  SaveUserInfoUsecase _saveUserInfoUsecase;

  SignUpCredentialsController(
    this._signUpWithEmailUsecase,
    this._saveUserInfoUsecase,
  );

  String? emailFieldValidator(String? email, Function callbackError) {
    if (email == null || email.isEmpty) {
      callbackError('Missed Field:', "Email field can't be empty");
    } else if (!email.isEmail) {
      callbackError('Error', 'Please insert a valid email');
    } else {
      return '';
    }
  }

  String? confirmEmailFieldValidator(String? confirmEmail, Function callbackError) {
    if (confirmEmail == null || confirmEmail.isEmpty) {
      callbackError('Missed Field:', "Confirm email field can't be empty");
    } else if (confirmEmail != confirmEmail) {
      callbackError('Different arguments:', "You must use the same e-mail address to continue");
    } else {
      return '';
    }
  }

  String? passwordFieldValidator(String? password, Function callbackError) {
    if (password == null || password.isEmpty) {
      callbackError('Missed Field:', "Password field can't be empty");
    } else {
      return '';
    }
  }

  String? confirmPasswordFieldValidator(String? confirmPassword, Function callbackError) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      callbackError('Missed Field:', "Confirm password field can't be empty");
    } else if (confirmPassword != confirmPassword) {
      callbackError('Different arguments:', "You must confirm the same password to continue.");
    } else {
      return '';
    }
  }

  Future fieldValidator() async {
    if (!formKey.currentState!.validate()) {
      changeScreenState(ScreenState.loadingState);
      await createUserWithEmail(userInfoEntity!);
      changeScreenState(ScreenState.doneState);
    }
  }

  Future saveUserInfo(UserInfoEntity userInfoEntity) async {
    var result = await _saveUserInfoUsecase(userInfoEntity);
    result.when((exception) {
      print('teste');
      exceptionHandler(exception);
    }, (isSaved) {
      if (isSaved) {
        goToPage('');
      }
    });
  }

  Future createUserWithEmail(UserInfoEntity userInfoEntity) async {
    var result = await _signUpWithEmailUsecase(
      UserCredentialsEntity(
        email: emailTextFieldController.text,
        password: passwordTextFieldController.text,
      ),
    );
    result.when((exception) {
      print('teste');

      firebaseExceptionHandler(exception);
    }, (success) async {
      await saveUserInfo(userInfoEntity);
    });
  }
}
