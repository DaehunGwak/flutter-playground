class ErrorResponse {
  final String? status;
  final String? code;
  final String? message;

  ErrorResponse({
    this.status = 'UNKNOWN ERROR',
    this.code = '0500',
    this.message = '',
  });
}
