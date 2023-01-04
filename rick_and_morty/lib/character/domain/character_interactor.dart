import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/character/data/character_repository.dart';
import 'package:rick_and_morty/character/data/service/character_response.dart';

abstract class CharacterInteractor {
  Future<CharacterApiResponse> fetchCharacters(int page);
}

@Injectable(as: CharacterInteractor)
class CharacterInteractorImpl implements CharacterInteractor {
  const CharacterInteractorImpl(this._repository);

  final CharacterRepository _repository;

  @override
  Future<CharacterApiResponse> fetchCharacters(int page) =>
      _repository.getCharacters(page);
}
