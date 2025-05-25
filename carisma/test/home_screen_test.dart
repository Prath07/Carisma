import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';
import 'package:carisma/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:carisma/upload_page.dart';
import 'package:carisma/profile_screen.dart';

void main() {
  setupFirebaseMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Shows message when no posts are available', (WidgetTester tester) async {
    final instance = MockFirestoreInstance();
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Wait for stream to build
    await tester.pumpAndSettle();

    expect(find.text('No cars uploaded yet.'), findsOneWidget);
  });
}
