import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/details/data/service/character_details_response.dart';

abstract class CharacterDetailsService {
  Future<CharacterDetailsResponse> getCharacterDetails(String id);
}

@Injectable(as: CharacterDetailsService)
class CharacterDetailsServiceImpl implements CharacterDetailsService {
  CharacterDetailsServiceImpl(this._client);

  final Dio _client;

  @override
  Future<CharacterDetailsResponse> getCharacterDetails(String id) async {
    try {
      final character = await _client.get('/character/$id');
      final originUrl = character.data['origin']['url'];
      final locationUrl = character.data['location']['url'];

      final locations = await Future.wait([
        if (originUrl != '') ...{
          _client.get(originUrl).then((value) => value.data)
        },
        if (locationUrl != '') ...{
          _client.get(locationUrl).then((value) => value.data)
        }
      ]);

      var json = character.data;
      json['locations'] = locations;

      return CharacterDetailsResponse.fromJson(json);
    } catch (_) {
      throw Exception('Fail getting character details $id');
    }
  }
}
