import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/shared/widgets/default_try_again_widget.dart';

void main() {
  testWidgets('has only one try again message', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DefaultTryAgainWidget(),
    ));

    expect(find.text('Try Again'), findsOneWidget);
  });

  testWidgets('has only one something wrong message', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DefaultTryAgainWidget(),
    ));

    expect(find.text('Ops, something wrong happend'), findsOneWidget);
    expect(find.text(';)'), findsNothing);
  });
}
