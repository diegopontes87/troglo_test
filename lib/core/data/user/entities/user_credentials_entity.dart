import 'package:troglo_test/core/data/user/models/user_credentials_model.dart';

class UserCredentialsEntity {
  String? email;
  String? password;

  UserCredentialsEntity({
    required this.email,
    required this.password,
  });
}

extension Mapper on UserCredentialsEntity {
  UserCredentialsModel toEntity() {
    return UserCredentialsModel(
      email: this.email,
      password: this.password,
    );
  }
}
