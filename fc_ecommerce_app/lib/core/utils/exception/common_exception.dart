import 'package:dio/dio.dart';

import '../error/error_response.dart';

class CommonException {
  const CommonException();

  static ErrorResponse setError(error) {
    if (error is Exception) {
      if (error.runtimeType == DioException) {
        final dioError = error as DioException;
        final code = dioError.response?.statusCode ?? 9999;

        return ErrorResponse(
          status: 'network error',
          code: code.toString(),
          message: '접속하신 네트워크 환경이 불안정합니다.\n잠시 후에 다시 시도해주세요.',
        );
      }

      return ErrorResponse(
        status: 'unExpected error',
        code: '8888',
        message: '서비스에 일시적인 오류가 발생했습니다.\n잠시 후에 다시 시도해주세요.',
      );
    }

    return ErrorResponse(
      status: 'unKnown error',
      code: '7777',
      message: '서비스에 일시적인 오류가 발생했습니다.\n잠시 후에 다시 시도해주세요.',
    );
  }
}
