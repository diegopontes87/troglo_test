import 'package:troglo_test/core/data/tests/entities/tests_result_entity.dart';
import 'package:troglo_test/core/data/tests/entities/user_test_result_entity.dart';
import 'package:troglo_test/core/data/tests/models/user_test_result_model.dart';

class TestsResultModel {
  List<UserTestResultModel>? userTestResult;

  TestsResultModel({this.userTestResult});

  TestsResultModel.fromJson(Map<String, dynamic> json) {
    if (json['userTestResults'] != null) {
      userTestResult = [];
      json['userTestResults'].forEach((v) {
        userTestResult?.add(new UserTestResultModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userTestResult != null) {
      data['userTestResults'] = this.userTestResult?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

extension Mapper on TestsResultModel {
  TestsResultEntity toEntity() {
    return TestsResultEntity(
      userTestResultEntity: this.userTestResult.toEntityList(),
    );
  }
}

extension ListMapper on List<UserTestResultModel>? {
  List<UserTestResultEntity>? toEntityList() {
    List<UserTestResultEntity>? entityList = [];
    this?.forEach((element) {
      entityList.add(
        element.toEntity(),
      );
    });
    return entityList;
  }
}
