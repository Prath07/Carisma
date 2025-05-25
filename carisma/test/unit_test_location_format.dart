import 'package:flutter_test/flutter_test.dart';

bool isValidLocation(String loc) {
  final parts = loc.split(',');
  if (parts.length != 2) return false;
  final lat = double.tryParse(parts[0].trim());
  final lng = double.tryParse(parts[1].trim());
  return lat != null && lng != null;
}

void main() {
  test('Validates latitude,longitude format', () {
    expect(isValidLocation('34.0522, -118.2437'), true);
    expect(isValidLocation('34.0522,-118.2437'), true);
    expect(isValidLocation('invalid string'), false);
    expect(isValidLocation(''), false);
  });
}

