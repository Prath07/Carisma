import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carisma/login_screen.dart';

void main() {
  testWidgets('LoginScreen shows email, password fields and sign-in button', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.byIcon(Icons.email), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsOneWidget);
  });
}
