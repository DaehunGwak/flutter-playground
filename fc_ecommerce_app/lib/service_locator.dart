import 'package:get_it/get_it.dart';

import 'data/data_source/mock/display/display_mock_api.dart';
import 'data/data_source/remote/display.api.dart';
import 'data/repository_impl/display.repository_impl.dart';
import 'domain/repository/display/display.respository.dart';
import 'domain/usecase/display/display.usecase.dart';

class ServiceLocator {
  static final GetIt locator = GetIt.instance;

  ServiceLocator._();

  static void setUpLocators() {
    _data();
    _domain();
  }

  static void _data() {
    locator.registerSingleton<DisplayApi>(DisplayMockApi());
  }

  static void _domain() {
    // repository
    locator.registerSingleton<DisplayRepository>(
      DisplayRepositoryImpl(locator<DisplayApi>()),
    );

    // usecase
    locator.registerSingleton<DisplayUsecase>(
      DisplayUsecase(locator<DisplayRepository>()),
    );
  }
}
