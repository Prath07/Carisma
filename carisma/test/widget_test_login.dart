import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carisma/login_screen.dart';

void main() {
  testWidgets('Login screen has email and password fields', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
