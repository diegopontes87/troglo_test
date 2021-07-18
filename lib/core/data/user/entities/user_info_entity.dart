import 'package:troglo_test/core/data/user/models/user_info_model.dart';

class UserInfoEntity {
  String? firstName;
  String? lastName;
  String? gender;
  String? genitalia;
  String? dateOfBirth;
  String? userId;

  UserInfoEntity({
    this.firstName,
    this.lastName,
    this.gender,
    this.genitalia,
    this.dateOfBirth,
    this.userId,
  });
}

extension Mapper on UserInfoEntity {
  UserInfoModel toModel() {
    return UserInfoModel(
      firstName: this.firstName,
      lastName: this.lastName,
      gender: this.gender,
      genitalia: this.genitalia,
      dateOfBirth: this.dateOfBirth,
      userId: userId,
    );
  }
}
