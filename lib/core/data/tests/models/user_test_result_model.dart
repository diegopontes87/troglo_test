import 'package:troglo_test/core/data/tests/entities/user_test_result_entity.dart';

class UserTestResultModel {
  String? orderId;
  String? orderDate;
  int? sickHours;
  String? result;
  String? testInfo;
  String? test;

  UserTestResultModel({
    this.orderId,
    this.orderDate,
    this.sickHours,
    this.result,
    this.testInfo,
    this.test,
  });

  UserTestResultModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderDate = json['orderDate'];
    sickHours = json['sickHours'];
    result = json['result'];
    testInfo = json['testInfo'];
    test = json['test'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['orderDate'] = this.orderDate;
    data['sickHours'] = this.sickHours;
    data['result'] = this.result;
    data['testInfo'] = this.testInfo;
    data['test'] = this.test;
    return data;
  }
}

extension Mapper on UserTestResultModel {
  UserTestResultEntity toEntity() {
    return UserTestResultEntity(
      orderId: this.orderId,
      orderDate: this.orderDate,
      sickHours: this.sickHours,
      result: this.result,
      testInfo: this.testInfo,
      test: this.test,
    );
  }
}
