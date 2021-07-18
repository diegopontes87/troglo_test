import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/user/entities/user_credentials_entity.dart';
import 'package:troglo_test/core/data/user/entities/user_info_entity.dart';
import 'package:troglo_test/core/data/user/models/user_info_model.dart';
import 'package:troglo_test/shared/infrastructure/base/base_firebase_exception.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';
import 'package:troglo_test/shared/infrastructure/base/base_remote_datasource.dart';
import 'package:troglo_test/shared/res/app_http.dart';

class UserRemoteDataSource extends BaseRemoteDataSource {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Result<AppFirebaseEmailAuthException, bool>> loginWithEmail(UserCredentialsEntity userCredentials) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(email: userCredentials.email!, password: userCredentials.password!);
      return Success(_auth.currentUser != null);
    } on PlatformException catch (error) {
      print('Error while trying to login with email: ${error.message}');
      return Error(AppFirebaseEmailAuthException.getErrorEmailAuthMessage(error.code));
    }
  }

  Future<Result<AppFirebaseEmailAuthException, bool>> signUpWithEmail(UserCredentialsEntity userInfo) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(email: userInfo.email!, password: userInfo.password!);
      return Success(_auth.currentUser != null);
    } on PlatformException catch (error) {
      print('Error while trying to login with email: ${error.message}');
      return Error(AppFirebaseEmailAuthException.getErrorEmailAuthMessage(error.code));
    }
  }

  Future<Result<AppFirebaseEmailAuthException, bool>> signOut() async {
    try {
      await _auth.signOut();
      return Success(true);
    } on PlatformException catch (error) {
      print('Error while trying to login with email: ${error.message}');
      return Error(AppFirebaseEmailAuthException.getErrorEmailAuthMessage(error.code));
    }
  }

  Future<Result<BaseHttpExceptions, bool>> saveUserInfo(UserInfoEntity userInfoModel) async {
    try {
      userInfoModel.userId = _auth.currentUser?.uid;
      print(userInfoModel.toModel().toJson());

      var result = await client.post(AppHttp.userInfo, data: json.encode(userInfoModel.toModel().toJson()));
      if (result.statusCode == 201) {
        return Success(true);
      }
      return Error(BaseHttpExceptions(error: 'Error', errorMessage: 'Could not save information on database! Please try again!'));
    } on PlatformException catch (error, stacktrace) {
      print('IO Exception Error while trying to save user information sales: $error');
      print('Error stacktrace: $stacktrace');
      return Error(BaseHttpExceptions(error: 'Error', errorMessage: 'Could not save information on database! Please try again!'));
    }
  }

  Future<Result<BaseHttpExceptions, UserInfoEntity>> getUserInfo() async {
    try {
      var userId = _auth.currentUser?.uid;
      var result = await client.post('${AppHttp.userInfo}/$userId');
      return Success(UserInfoModel.fromJson(json.decode(result.data)).toEntity());
    } on PlatformException catch (error, stacktrace) {
      print('IO Exception Error while trying to save user information sales: $error');
      print('Error stacktrace: $stacktrace');
      return Error(BaseHttpExceptions(error: 'Error', errorMessage: 'Could not save information on database! Please try again!'));
    }
  }
}
