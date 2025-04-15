import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/constant/app_icons.dart';

enum BottomNav {
  home,
  category,
  search,
  user,
}

class BottomNavCubit extends Cubit<BottomNav> {
  BottomNavCubit() : super(BottomNav.home);

  void changeIndex(int index) => emit(BottomNav.values[index]);
}

extension BottomNavX on BottomNav {
  String get icon {
    return switch (this) {
      BottomNav.home => AppIcons.navHome,
      BottomNav.category => AppIcons.navCategory,
      BottomNav.search => AppIcons.navSearch,
      BottomNav.user => AppIcons.navUser,
    };
  }

  String get activeIcon {
    return switch (this) {
      BottomNav.home => AppIcons.navHomeOn,
      BottomNav.category => AppIcons.navCategoryOn,
      BottomNav.search => AppIcons.navSearchOn,
      BottomNav.user => AppIcons.navUserOn,
    };
  }

  String get toName {
    return switch (this) {
      BottomNav.home => '홈',
      BottomNav.category => '카테고리',
      BottomNav.search => '검색',
      BottomNav.user => '마이페이지',
    };
  }
}
