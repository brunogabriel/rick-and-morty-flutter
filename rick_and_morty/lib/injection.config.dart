// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:rick_and_morty/character/data/character_repository.dart'
    as _i10;
import 'package:rick_and_morty/character/data/service/character_service.dart'
    as _i8;
import 'package:rick_and_morty/character/domain/character_interactor.dart'
    as _i12;
import 'package:rick_and_morty/character/presentation/bloc/character_bloc.dart'
    as _i13;
import 'package:rick_and_morty/details/data/details_repository.dart' as _i9;
import 'package:rick_and_morty/details/data/service/character_details_service.dart'
    as _i7;
import 'package:rick_and_morty/details/presentation/bloc/character_details_bloc.dart'
    as _i11;
import 'package:rick_and_morty/network/network_module.dart' as _i14;
import 'package:rick_and_morty/preferences/preferences_module.dart' as _i15;
import 'package:rick_and_morty/shared/theme/data/app_theme_repository.dart'
    as _i5;
import 'package:rick_and_morty/shared/theme/data/cubit/theme_cubit.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  final preferencesModule = _$PreferencesModule();
  gh.factory<_i3.Interceptor>(
    () => networkModule.providePrettyLogger(),
    instanceName: 'PrettyLogger',
  );
  await gh.singletonAsync<_i4.SharedPreferences>(
    () => preferencesModule.sharedPrefs,
    preResolve: true,
  );
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i5.AppThemeRepository>(
      () => _i5.AppThemeRepositoryImpl(gh<_i4.SharedPreferences>()));
  gh.singleton<_i3.Dio>(networkModule.provideDio(
    gh<String>(instanceName: 'BaseUrl'),
    gh<_i3.Interceptor>(instanceName: 'PrettyLogger'),
  ));
  gh.factory<_i6.ThemeCubit>(
      () => _i6.ThemeCubit(gh<_i5.AppThemeRepository>()));
  gh.factory<_i7.CharacterDetailsService>(
      () => _i7.CharacterDetailsServiceImpl(gh<_i3.Dio>()));
  gh.factory<_i8.CharacterService>(
      () => _i8.CharacterServiceImpl(gh<_i3.Dio>()));
  gh.factory<_i9.CharacterDetailsRepository>(() =>
      _i9.CharacterDetailsRepositoryImpl(gh<_i7.CharacterDetailsService>()));
  gh.factory<_i10.CharacterRepository>(
      () => _i10.CharacterRepositoryImpl(gh<_i8.CharacterService>()));
  gh.factory<_i11.CharacterDetailsBloc>(
      () => _i11.CharacterDetailsBloc(gh<_i9.CharacterDetailsRepository>()));
  gh.factory<_i12.CharacterInteractor>(
      () => _i12.CharacterInteractorImpl(gh<_i10.CharacterRepository>()));
  gh.factory<_i13.CharacterBloc>(
      () => _i13.CharacterBloc(gh<_i12.CharacterInteractor>()));
  return getIt;
}

class _$NetworkModule extends _i14.NetworkModule {}

class _$PreferencesModule extends _i15.PreferencesModule {}
