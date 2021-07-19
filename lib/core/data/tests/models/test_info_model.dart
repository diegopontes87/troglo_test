import 'package:troglo_test/core/data/tests/entities/test_info_entity.dart';

class TestInfoModel {
  int? hoursToExpire;
  String? genitalia;
  String? info;
  String? test;

  TestInfoModel({
    this.hoursToExpire,
    this.genitalia,
    this.info,
    this.test,
  });

  TestInfoModel.fromJson(Map<String, dynamic> json) {
    hoursToExpire = json['hoursToExpire'];
    genitalia = json['genitalia'];
    info = json['info'];
    test = json['test'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hoursToExpire'] = this.hoursToExpire;
    data['genitalia'] = this.genitalia;
    data['info'] = this.info;
    data['test'] = this.test;
    return data;
  }
}

extension Mapper on TestInfoModel {
  TestInfoEntity toEntity() {
    return TestInfoEntity(
      hoursToExpire: this.hoursToExpire,
      genitalia: this.genitalia,
      info: this.info,
      test: this.test,
    );
  }
}
