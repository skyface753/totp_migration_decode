import 'package:flutter_test/flutter_test.dart';

import 'package:totp_migration_decode/totp_migration_decode.dart';
import 'package:totp_migration_decode/totp_model.dart';

void main() {
  test('adds one to input values', () {
    final tme = TME();

    List<TotpModel> testTotpList = tme.encodeFromUrl(
        'otpauth-migration://offline?data=CjkKFD3GyqSCSm0oh2eyMx4gtDFmy4XZEhJqb2huLmRvZUBlbWFpbC5jb20aB0FDTUUgQ28gASgBMAIKKgoKSGksIEFuZHJlcxIGQW5kcmVzGg5Tb21lIFNlcnZpY2UgMSABKAEwAgopCgpOb3QgU28gQmFkEgVLZXZpbhoOU29tZSBTZXJ2aWNlIDIgASgBMAIQARgBIAA%3D');
    for (TotpModel t in testTotpList) {
      print(t.service + ' (' + t.issuer + ') - ' + t.secret);
    }
  });
}
