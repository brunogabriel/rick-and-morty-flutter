import 'package:flutter/material.dart';

import '../widgets/details_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.characterId,
  }) : super(key: key);

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return DetailsWidget(
      characterId: characterId,
    );
  }
}
