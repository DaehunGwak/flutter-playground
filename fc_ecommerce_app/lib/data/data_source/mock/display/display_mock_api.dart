import 'dart:convert';

import '../../../dto/display/menu/menu_dto.dart';
import '../../remote/display.api.dart';
import 'display_mock_data.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<List<MenuDto>> getMenusByMallType(String mallType) {
    return Future(() => _menuParser(mallType == 'market'
        ? DisplayMockData.menusByMarket
        : DisplayMockData.menusByBeauty));
  }

  List<MenuDto> _menuParser(String source) {
    final List json = jsonDecode(source);

    return json.map((e) => MenuDto.fromJson(e)).toList();
  }
}
