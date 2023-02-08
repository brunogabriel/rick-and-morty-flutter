import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/details/presentation/bloc/character_details_bloc.dart';
import 'package:rick_and_morty/details/presentation/widgets/character_details_location_widget.dart';

import '../../../shared/datastructure/pair.dart';
import '../../../shared/widgets/default_loading_widget.dart';
import '../../../shared/widgets/default_try_again_widget.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
    required this.characterId,
  }) : super(key: key);

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
      builder: (context, state) {
        return Stack(
          children: [
            if (state is CharacterDetailsErrorState) ...{
              Center(
                child: DefaultTryAgainWidget(
                  onPressed: () => _requestCharacterDetails(context),
                ),
              )
            } else if (state is CharacterDetailsResultState) ...{
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        state.response.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    ...[
                      Pair('Name', state.response.name),
                      Pair('Status', state.response.status),
                      Pair('Species', state.response.species),
                      Pair('Type', state.response.type),
                    ].map(
                      (pair) => ListTile(
                        title: Text(pair.first),
                        subtitle: Text(pair.second),
                      ),
                    ),
                    if (state.response.locations.isNotEmpty) ...{
                      GridView.count(
                        crossAxisCount: state.response.locations.length,
                        shrinkWrap: true,
                        children: state.response.locations
                            .map(
                              (currentLocation) =>
                                  CharacterDetailsLocationWidget(
                                location: currentLocation,
                              ),
                            )
                            .toList(),
                      )
                    }
                  ],
                ),
              )
            } else ...{
              const Center(child: DefaultLoadingWidget())
            }
          ],
        );
      },
    );
  }

  void _requestCharacterDetails(BuildContext context) =>
      context.read<CharacterDetailsBloc>()
        ..add(CharacterDetailsRequestEvent(characterId));
}
