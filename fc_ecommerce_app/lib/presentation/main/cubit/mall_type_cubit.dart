import 'package:flutter_bloc/flutter_bloc.dart';

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

  bool get isMarket => this == MallType.market;
  bool get isBeauty => this == MallType.beauty;
}
