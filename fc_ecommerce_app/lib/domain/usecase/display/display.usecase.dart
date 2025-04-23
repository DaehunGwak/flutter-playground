import '../../repository/display/display.respository.dart';
import '../base/remote.usecase.dart';

class DisplayUsecase {
  final DisplayRepository _displayRepository;

  DisplayUsecase(this._displayRepository);

  Future execute<T>({required RemoteUsecase usecase}) async {
    return await usecase(_displayRepository);
  }
}
