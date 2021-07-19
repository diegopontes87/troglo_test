import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/tests/entities/test_info_entity.dart';
import 'package:troglo_test/core/data/tests/entities/tests_result_entity.dart';
import 'package:troglo_test/core/data/tests/models/test_info_model.dart';
import 'package:troglo_test/core/data/tests/models/tests_result_model.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';
import 'package:troglo_test/shared/infrastructure/base/base_remote_datasource.dart';
import 'package:troglo_test/shared/res/app_http.dart';

class TestRemoteDataSource extends BaseRemoteDataSource {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Result<BaseHttpExceptions, TestsResultEntity>> getUserTestsResults() async {
    try {
      var userId = _auth.currentUser?.uid;
      var result = await client.post('${AppHttp.testsResults}/$userId');
      return Success(TestsResultModel.fromJson(json.decode(result.data)).toEntity());
    } on PlatformException catch (error, stacktrace) {
      print('IO Exception Error while trying get user tests results: $error');
      print('Error stacktrace: $stacktrace');
      return Error(BaseHttpExceptions(error: 'Error', errorMessage: 'Could not get user tests results!'));
    }
  }

  Future<Result<BaseHttpExceptions, List<TestInfoEntity>>> getTestsInfo() async {
    try {
      var result = await client.post('${AppHttp.testsKit}');
      List<TestInfoEntity> testsInfoList = List<TestInfoEntity>.from(result.data
          .map(
            (apiData) => TestInfoModel.fromJson(Map<String, dynamic>.from(apiData)).toEntity(),
          )
          .toList());
      return Success(testsInfoList);
    } on PlatformException catch (error, stacktrace) {
      print('IO Exception Error while trying get user tests results: $error');
      print('Error stacktrace: $stacktrace');
      return Error(BaseHttpExceptions(error: 'Error', errorMessage: 'Could not get user tests results!'));
    }
  }
}
