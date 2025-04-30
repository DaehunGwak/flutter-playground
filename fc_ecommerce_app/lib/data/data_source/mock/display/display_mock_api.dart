import 'dart:convert';
import 'dart:io';

import '../../../dto/common/response_wrapper.dart';
import '../../../dto/display/menu/menu_dto.dart';
import '../../remote/display.api.dart';
import 'display_mock_data.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(String mallType) {
    throw SocketException('test socket exception');

    return Future(
      () => ResponseWrapper<List<MenuDto>>(
        status: 'SUCCESS',
        code: '0000',
        message: '',
        data: _menuParser(
          mallType == 'market'
              ? DisplayMockData.menusByMarket
              : DisplayMockData.menusByBeauty,
        ),
      ),
    );
  }

  List<MenuDto> _menuParser(String source) {
    final List json = jsonDecode(source);

    return json.map((e) => MenuDto.fromJson(e)).toList();
  }
}
