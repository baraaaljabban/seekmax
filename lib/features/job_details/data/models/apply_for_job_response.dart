class ApplyForJobResponse {
  bool apply;

  ApplyForJobResponse({
    required this.apply,
  });

  factory ApplyForJobResponse.fromMap(Map<String, dynamic> map) {
    return ApplyForJobResponse(
      apply: map['apply'] ?? false,
    );
  }
}
