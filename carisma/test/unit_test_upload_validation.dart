import 'package:flutter_test/flutter_test.dart';

bool isUploadValid(String make, String model, dynamic image) {
  return make.isNotEmpty && model.isNotEmpty && image != null;
}

void main() {
  test('Validates all required upload fields', () {
    expect(isUploadValid('Toyota', 'Supra', 'someImage'), true);
    expect(isUploadValid('', 'Supra', 'someImage'), false);
    expect(isUploadValid('Toyota', '', 'someImage'), false);
    expect(isUploadValid('Toyota', 'Supra', null), false);
  });
}