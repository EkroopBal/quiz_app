// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/quiz.dart';  // Import the correct file

void main() {
  testWidgets('Start Screen displays and counter increments on button tap', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Quiz());  // Use Quiz widget here

    // Verify that the Start Screen is shown
    expect(find.text('Try your luck on our quiz!'), findsOneWidget);

    // Tap the "Start Quiz" button and trigger a frame.
    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();  // Wait for screen transition

    // Verify that the Questions Screen appears after the button is tapped
    expect(find.text('How did Ed lose his arm in Full Metal Alchemist'), findsOneWidget);  // Check for a question
  });
}
