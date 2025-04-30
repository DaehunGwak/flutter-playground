import '../../../../core/utils/error/error_response.dart';
import '../../../../presentation/main/cubit/mall_type_cubit.dart';
import '../../../model/common/result.dart';
import '../../../repository/display/display.respository.dart';
import '../../base/remote.usecase.dart';

class GetMenusUsecase extends RemoteUsecase<DisplayRepository> {
  final MallType mallType;

  GetMenusUsecase({
    required this.mallType,
  });

  @override
  Future call(DisplayRepository repository) async {
    final result = await repository.getMenusByMallType(mallType: mallType);

    return (result.status == 'SUCCESS')
        ? Result.success(result.data ?? List.empty())
        : Result.failure(ErrorResponse(
            status: result.status,
            code: result.code,
            message: result.message,
          ));
  }
}
