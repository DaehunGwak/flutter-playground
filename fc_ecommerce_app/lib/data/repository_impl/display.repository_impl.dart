import '../../domain/model/menu/menu.model.dart';
import '../../domain/repository/display/display.respository.dart';
import '../../presentation/main/cubit/mall_type_cubit.dart';
import '../data_source/remote/display.api.dart';
import '../dto/common/response_wrapper.dart';
import '../mapper/common.mapper.dart';
import '../mapper/display.mapper.dart';

class DisplayRepositoryImpl implements DisplayRepository {
  DisplayRepositoryImpl(this._displayApi);

  final DisplayApi _displayApi;

  @override
  Future<ResponseWrapper<List<Menu>>> getMenusByMallType({
    required MallType mallType,
  }) async {
    final response = await _displayApi.getMenusByMallType(mallType.name);

    return response.toModel<List<Menu>>(
      response.data?.map((dto) => dto.toModel()).toList() ?? List.empty(),
    );
  }
}
