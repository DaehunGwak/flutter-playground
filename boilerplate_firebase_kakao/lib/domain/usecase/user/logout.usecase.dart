import 'package:boilerplate_firebase_kakao/domain/repository/user.repository.dart';
import 'package:boilerplate_firebase_kakao/domain/usecase/base/remote.usecase.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../core/utils/exception/common_exception.dart';
import '../../../core/utils/logger.dart';

class LogoutUsecase extends RemoteUsecase<UserRepository> {
  @override
  Future<void> call(UserRepository repository) async {
    try {
      await UserApi.instance.logout();
    } catch (error) {
      CustomLogger.logger.e('Error during logout with KakaoAccount: $error');
      throw CommonException.setError(error);
    }
  }
}
