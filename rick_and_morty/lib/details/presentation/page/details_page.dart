import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/details/presentation/bloc/character_details_bloc.dart';

import '../widgets/details_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.characterId,
  }) : super(key: key);

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<CharacterDetailsBloc>()
        ..add(CharacterDetailsRequestEvent(characterId)),
      child: DetailsWidget(
        characterId: characterId,
      ),
    );
  }
}
