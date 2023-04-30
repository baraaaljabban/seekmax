import 'dart:convert';

class LoginResponse {
  final String auth;

  LoginResponse({required this.auth});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'auth': auth});

    return result;
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      auth: map['auth'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) => LoginResponse.fromMap(json.decode(source));
}
