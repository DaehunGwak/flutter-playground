class ErrorResponse {
  final String? status;
  final String? code;
  final String? message;

  const ErrorResponse({
    this.status = 'UNKNOWN ERROR',
    this.code = '0500',
    this.message = '',
  });

  @override
  String toString() {
    return 'ErrorResponse{status: $status, code: $code, message: $message}';
  }
}
