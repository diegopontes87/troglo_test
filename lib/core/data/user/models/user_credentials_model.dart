class UserCredentialsModel {
  String? email;
  String? password;

  UserCredentialsModel({
    required this.email,
    required this.password,
  });

  @override
  UserCredentialsModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
