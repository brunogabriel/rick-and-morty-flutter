part of 'character_bloc.dart';

enum ResultState { initial, loading, error, result }

class CharacterState extends Equatable {
  const CharacterState({
    this.page = 1,
    this.characters = const <CharacterResponse>[],
    this.hasReachedMax = false,
    this.result = ResultState.initial,
  });

  final int page;
  final List<CharacterResponse> characters;
  final bool hasReachedMax;
  final ResultState result;

  @override
  List<Object> get props => [page, characters, hasReachedMax, result];

  bool get isFirstPage => page == 1;

  CharacterState copyWith({
    int? page,
    bool? hasReachedMax,
    List<CharacterResponse>? characters,
    ResultState? result,
  }) =>
      CharacterState(
        page: page ?? this.page,
        characters: characters ?? this.characters,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        result: result ?? this.result,
      );
}
