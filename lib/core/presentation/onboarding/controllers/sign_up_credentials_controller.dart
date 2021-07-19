import 'package:flutter/material.dart';
import 'package:troglo_test/core/data/user/entities/user_credentials_entity.dart';
import 'package:troglo_test/core/data/user/entities/user_info_entity.dart';
import 'package:troglo_test/core/domain/user/usecases/save_user_info_usecase.dart';
import 'package:troglo_test/core/domain/user/usecases/sign_up_with_email_usecase.dart';
import 'package:troglo_test/shared/infrastructure/base/base_controller.dart';
import 'package:get/utils.dart';
import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:troglo_test/shared/res/app_routes.dart';

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

  String? emailFieldValidator(String? email) {
    if (email == null || email.isEmpty) {
      getErrorSnackBar('Missed Field:', "Email field can't be empty");
      return '';
    } else if (!email.isEmail) {
      getErrorSnackBar('Error', 'Please insert a valid email');
      return '';
    } else {
      return null;
    }
  }

  String? confirmEmailFieldValidator(String? confirmEmail) {
    if (confirmEmail == null || confirmEmail.isEmpty) {
      getErrorSnackBar('Missed Field:', "Confirm email field can't be empty");
      return '';
    } else if (emailTextFieldController.text != confirmEmail) {
      getErrorSnackBar('Different arguments:', "You must use the same e-mail address to continue");
      return '';
    } else {
      return null;
    }
  }

  String? passwordFieldValidator(String? password) {
    if (password == null || password.isEmpty) {
      getErrorSnackBar('Missed Field:', "Password field can't be empty");
      return '';
    } else {
      return null;
    }
  }

  String? confirmPasswordFieldValidator(
    String? confirmPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      getErrorSnackBar('Missed Field:', "Confirm password field can't be empty");
      return '';
    } else if (passwordTextFieldController.text != confirmPassword) {
      getErrorSnackBar('Different arguments:', "You must confirm the same password to continue.");
      return '';
    } else {
      return null;
    }
  }

  Future fieldValidator() async {
    if (formKey.currentState!.validate()) {
      changeScreenState(ScreenState.loadingState);
      await createUserWithEmail(userInfoEntity!);
      await saveUserInfo(userInfoEntity!);
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
        goToPage(AppRoutes.homePage);
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
      firebaseExceptionHandler(exception);
    }, (success) async {
      print('Created');
    });
  }
}
