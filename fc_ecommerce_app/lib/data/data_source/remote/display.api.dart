import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../dto/display/menu/menu_dto.dart';

part 'display.api.g.dart';

@RestApi()
abstract class DisplayApi {
  factory DisplayApi(Dio dio, {String baseUrl}) = _DisplayApi;

  @GET("/api/menus/{mall_typ}")
  Future<List<MenuDto>> getMenusByMallType(@Path('mall_type') String mallType);
}
