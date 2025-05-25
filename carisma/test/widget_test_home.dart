import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carisma/home_screen.dart';

void main() {
  testWidgets('HomeScreen shows title and bottom nav', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    expect(find.text('Carisma'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.photo_camera_outlined), findsOneWidget);
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
  });
}
