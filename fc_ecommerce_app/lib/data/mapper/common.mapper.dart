import '../dto/common/response_wrapper.dart';

extension ResponseMapperX on ResponseWrapper {
  ResponseWrapper<T> toModel<T>(T data) {
    return ResponseWrapper<T>(
      status: status,
      code: code,
      message: message,
      data: data,
    );
  }
}
