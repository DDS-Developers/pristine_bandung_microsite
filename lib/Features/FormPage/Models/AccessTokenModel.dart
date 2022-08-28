class AccessTokenModel {
  String token;
  int statusCode;
  AccessTokenModel({required this.token, required this.statusCode});

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) {
    return AccessTokenModel(
      token: json['token'],
      statusCode: json['code'],
    );
  }
}
