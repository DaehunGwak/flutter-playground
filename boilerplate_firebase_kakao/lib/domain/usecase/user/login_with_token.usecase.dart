import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../core/utils/exception/common_exception.dart';
import '../../../core/utils/logger.dart';
import '../../repository/user.repository.dart';
import '../base/remote.usecase.dart';

class LoginWithTokenUsecase extends RemoteUsecase<UserRepository> {
  @override
  Future<User?> call(UserRepository repository) async {
    if (await AuthApi.instance.hasToken()) {
      try {
        await UserApi.instance.accessTokenInfo();
      } catch (error) {
        CustomLogger.logger.e('Error during access token with KakaoAccount: $error');
        throw CommonException.setError(error);
      }
    } else {
      return null;
    }

    return await UserApi.instance.me();
  }
}
