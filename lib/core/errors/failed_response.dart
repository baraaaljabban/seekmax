import 'dart:convert';

class FailedResponse {
  int status;
  String message;
  bool success;
  FailedResponse({
    required this.status,
    required this.message,
    required this.success,
  });

  factory FailedResponse.fromMap(Map<String, dynamic> map) {
    return FailedResponse(
      status: int.tryParse(map['status_code'].toString()) ?? 7,
      message: map.containsKey('status_message') ? map['status_message'].toString() : '',
      success: map.containsKey('success') ? map['success'] as bool : false,
    );
  }

  factory FailedResponse.fromJson(String source) => FailedResponse.fromMap(json.decode(source));
}
