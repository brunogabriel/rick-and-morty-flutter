import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/character/data/service/character_response.dart';

abstract class CharacterService {
  Future<CharacterApiResponse> getCharacters([int page = 1]);
}

@Injectable(as: CharacterService)
class CharacterServiceImpl implements CharacterService {
  const CharacterServiceImpl(this._client);

  final Dio _client;

  @override
  Future<CharacterApiResponse> getCharacters([int page = 1]) async {
    final response = await _client.get(
      'character',
      queryParameters: {'page': '$page'},
    );

    if (response.statusCode == 200) {
      return CharacterApiResponse.fromJson(response.data);
    }

    throw HttpException('Fail to get characters at page $page');
  }
}
