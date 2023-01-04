// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:rick_and_morty/character/data/character_repository.dart' as _i5;
import 'package:rick_and_morty/character/data/service/character_service.dart'
    as _i4;
import 'package:rick_and_morty/character/domain/character_interactor.dart'
    as _i6;
import 'package:rick_and_morty/character/presentation/bloc/character_bloc.dart'
    as _i7;
import 'package:rick_and_morty/network/network_module.dart' as _i8;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.factory<_i3.Interceptor>(
    () => networkModule.providePrettyLogger(),
    instanceName: 'PrettyLogger',
  );
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.singleton<_i3.Dio>(networkModule.provideDio(
    gh<String>(instanceName: 'BaseUrl'),
    gh<_i3.Interceptor>(instanceName: 'PrettyLogger'),
  ));
  gh.factory<_i4.CharacterService>(
      () => _i4.CharacterServiceImpl(gh<_i3.Dio>()));
  gh.factory<_i5.CharacterRepository>(
      () => _i5.CharacterRepositoryImpl(gh<_i4.CharacterService>()));
  gh.factory<_i6.CharacterInteractor>(
      () => _i6.CharacterInteractorImpl(gh<_i5.CharacterRepository>()));
  gh.factory<_i7.CharacterBloc>(
      () => _i7.CharacterBloc(gh<_i6.CharacterInteractor>()));
  return getIt;
}

class _$NetworkModule extends _i8.NetworkModule {}
