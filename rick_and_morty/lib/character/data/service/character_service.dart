import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class CharacterService {
  Future<void> getCharacters([int page = 1]);
}

@Injectable(as: CharacterService)
class CharacterServiceImpl implements CharacterService {
  const CharacterServiceImpl(this._client);

  final Dio _client;

  @override
  Future<void> getCharacters([int page = 1]) async {
    final response = _client.get(
      'character',
      queryParameters: {'page': '$page'},
    );
  }
}
