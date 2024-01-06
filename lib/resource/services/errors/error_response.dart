class ErrorResponse implements Exception {
  final int status;
  final String message;

  ErrorResponse({required this.status, required this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      status: json['status'] ?? 500,
      message: json['message'] ?? 'Unknown error',
    );
  }

  @override
  String toString() => 'ErrorResponse: $status - $message';
}
