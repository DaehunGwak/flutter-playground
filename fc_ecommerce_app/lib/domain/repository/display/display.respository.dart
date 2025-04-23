import '../../../data/dto/common/response_wrapper.dart';
import '../../../presentation/main/cubit/mall_type_cubit.dart';
import '../../model/menu/menu.model.dart';
import '../repository.dart';

abstract class DisplayRepository extends Repository {
  Future<ResponseWrapper<List<Menu>>> getMenusByMallType({
    required MallType mallType,
  });
}
