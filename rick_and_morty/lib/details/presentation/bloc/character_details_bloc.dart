import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/details/data/details_repository.dart';
import 'package:rick_and_morty/details/data/service/character_details_response.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';

@injectable
class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  CharacterDetailsBloc(this._repository)
      : super(CharacterDetailsInitialState()) {
    on(_onRequestEvent);
  }

  final CharacterDetailsRepository _repository;

  Future<void> _onRequestEvent(CharacterDetailsRequestEvent event,
      Emitter<CharacterDetailsState> emit) async {
    try {
      emit(CharacterDetailsLoadingState());
      emit(CharacterDetailsResultState(
          await _repository.getCharacterDetails(event.id)));
    } catch (_) {
      emit(CharacterDetailsErrorState());
    }
  }
}
