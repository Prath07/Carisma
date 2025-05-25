import 'package:flutter_test/flutter_test.dart';

bool isValidEmail(String email) {
  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return regex.hasMatch(email);
}

void main() {
  test('Email validator regex test', () {
    expect(isValidEmail('test@example.com'), true);
    expect(isValidEmail('test.com'), false);
    expect(isValidEmail(''), false);
  });
}