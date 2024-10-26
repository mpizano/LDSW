// This is a basic Flutter widget test.
// test/widget_test.dart
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:frontend/main.dart';

void main() {
  testWidgets('Test MyApp', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verifica que el texto "Hello World" está en pantalla
    expect(find.text('Hello World'), findsOneWidget);
  });
}
