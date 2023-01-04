import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({Key? key, required this.status}) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    late Color color;

    if (status == 'dead') {
      color = Colors.red;
    } else if (status == 'alive') {
      color = Colors.green;
    } else {
      color = Colors.grey;
    }

    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
