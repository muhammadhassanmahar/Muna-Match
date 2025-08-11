import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muna_match/main.dart'; // Apne project ka sahi path lagayen

void main() {
  testWidgets('Splash Screen loads', (WidgetTester tester) async {
    // Pump the app widget
    await tester.pumpWidget(const MunaMatchApp());

    // Check if splash screen is showing
    expect(find.byType(Image), findsOneWidget);
  });
}
