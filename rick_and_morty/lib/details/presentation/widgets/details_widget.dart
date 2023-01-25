import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final id = (arguments as Map<String, Object?>)['id'] ?? 'Erro';
    return Center(child: Text(id.toString()));
  }
}
