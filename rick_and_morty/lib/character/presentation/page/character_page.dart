import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/character/presentation/widgets/character_widget.dart';

import '../bloc/character_bloc.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<CharacterBloc>()..add(CharacterRequestEvent()),
      child: const CharacterWidget(),
    );
  }
}
