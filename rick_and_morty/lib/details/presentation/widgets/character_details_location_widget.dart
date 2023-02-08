import 'package:flutter/material.dart';
import 'package:rick_and_morty/details/data/service/character_details_location_response.dart';

class CharacterDetailsLocationWidget extends StatelessWidget {
  const CharacterDetailsLocationWidget({
    super.key,
    required this.location,
  });

  final CharacterDetailsLocationResponse location;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: theme.cardTheme.elevation ?? 0.0,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              location.type,
              style: theme.textTheme.caption?.copyWith(fontSize: 13),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              location.name,
              style: theme.textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              location.dimension,
            ),
          ],
        ),
      ),
    );
  }
}
