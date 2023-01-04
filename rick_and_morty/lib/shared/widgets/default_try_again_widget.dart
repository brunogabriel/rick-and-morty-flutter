import 'package:flutter/material.dart';

class DefaultTryAgainWidget extends StatelessWidget {
  const DefaultTryAgainWidget({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ops, something wrong happend',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(onPressed: onPressed, child: const Text('Try Again'))
          ],
        ),
      );
}
