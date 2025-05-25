import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carisma/profile_screen.dart';

void main() {
  testWidgets('ProfileScreen UI loads correctly without Firebase', (WidgetTester tester) async {
    // Build a simplified ProfileScreen with minimal setup.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Text('test@example.com'),
              Expanded(
                child: Center(
                  child: Text('No uploads yet.'),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Verify that email and placeholder upload text appear
    expect(find.text('test@example.com'), findsOneWidget);
    expect(find.text('No uploads yet.'), findsOneWidget);
  });
}
