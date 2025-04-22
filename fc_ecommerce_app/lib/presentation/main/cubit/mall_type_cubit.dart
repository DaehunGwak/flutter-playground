import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/custom/custom_app_bar.dart';

enum MallType {
  market,
  beauty,
}

class MallTypeCubit extends Cubit<MallType> {
  MallTypeCubit() : super(MallType.market);

  void changeIndex(int index) => emit(MallType.values[index]);
}

extension MAllTypeX on MallType {
  String get toName => switch (this) {
        MallType.market => '마켓패캠',
        MallType.beauty => '뷰티패캠',
      };

  CustomAppBarTheme get theme => switch (this) {
        MallType.market => CustomAppBarTheme.market,
        MallType.beauty => CustomAppBarTheme.beauty,
      };

  bool get isMarket => this == MallType.market;

  bool get isBeauty => this == MallType.beauty;
}
