import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Calculator", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(Key("Result")), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);
  });
}
