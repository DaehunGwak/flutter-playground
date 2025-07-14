// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:boilerplate_firebase_kakao/data/repository_impl/user.repository_impl.dart'
    as _i216;
import 'package:boilerplate_firebase_kakao/domain/repository/user.repository.dart'
    as _i66;
import 'package:boilerplate_firebase_kakao/domain/usecase/user/user.usecase.dart'
    as _i374;
import 'package:boilerplate_firebase_kakao/presentation/bloc/user_bloc/user_bloc.dart'
    as _i697;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i66.UserRepository>(() => _i216.UserRepositoryImpl());
    gh.singleton<_i374.UserUsecase>(
      () => _i374.UserUsecase(gh<_i66.UserRepository>()),
    );
    gh.factory<_i697.UserBloc>(() => _i697.UserBloc(gh<_i374.UserUsecase>()));
    return this;
  }
}
