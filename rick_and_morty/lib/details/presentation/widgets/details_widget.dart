import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
    required this.characterId,
  }) : super(key: key);

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(characterId));
  }
}
