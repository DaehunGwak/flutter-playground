import '../../repository/user.repository.dart';
import '../base/remote.usecase.dart';

class UserUsecase {
  final UserRepository _userRepository;

  UserUsecase(this._userRepository);

  Future excute<T>({required RemoteUsecase usecase}) async {
    return await usecase(_userRepository);
  }
}
