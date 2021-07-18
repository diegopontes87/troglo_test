import 'package:troglo_test/core/data/user/entities/user_info_entity.dart';

class UserInfoModel {
  String? firstName;
  String? lastName;
  String? gender;
  String? genitalia;
  String? dateOfBirth;
  String? userId;

  UserInfoModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.genitalia,
    this.dateOfBirth,
    this.userId,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    genitalia = json['genitalia'];
    dateOfBirth = json['dateOfBirth'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['genitalia'] = this.genitalia;
    data['dateOfBirth'] = this.dateOfBirth;
    data['userId'] = this.userId;
    return data;
  }
}

extension Mapper on UserInfoModel {
  UserInfoEntity toEntity() {
    return UserInfoEntity(
      firstName: this.firstName,
      lastName: this.lastName,
      gender: this.gender,
      genitalia: this.genitalia,
      dateOfBirth: this.dateOfBirth,
      userId: userId,
    );
  }
}
