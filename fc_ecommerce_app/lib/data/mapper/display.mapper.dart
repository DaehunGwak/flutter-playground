import '../../domain/model/menu/menu.model.dart';
import '../dto/display/menu/menu_dto.dart';

extension MenuX on MenuDto {
  Menu toModel() {
    return Menu(tabId: tabId, title: title);
  }
}
