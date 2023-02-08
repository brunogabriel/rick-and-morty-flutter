part of 'character_details_bloc.dart';

abstract class CharacterDetailsEvent extends Equatable {
  const CharacterDetailsEvent();

  @override
  List<Object> get props => [];
}

class CharacterDetailsRequestEvent extends CharacterDetailsEvent {
  const CharacterDetailsRequestEvent(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}
