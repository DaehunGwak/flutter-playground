import 'package:flutter/material.dart';

import 'core/theme/theme_data.dart';
import 'domain/usecase/display/display.usecase.dart';
import 'domain/usecase/display/menu/get_menus.usecase.dart';
import 'presentation/main/cubit/mall_type_cubit.dart';
import 'presentation/routes/routes.dart';
import 'service_locator.dart';

void main() async {
  // final result = await DisplayUsecase(DisplayRepositoryImpl(DisplayMockApi()))
  //     .execute(usecase: GetMenusUsecase(mallType: MallType.market));
  // debugPrint(result.toString());

  ServiceLocator.setUpLocators();

  final menus = await ServiceLocator.locator<DisplayUsecase>()
      .execute(usecase: GetMenusUsecase(mallType: MallType.market));
  debugPrint(menus.toString());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: CustomThemeData.themeData,
    );
  }
}
