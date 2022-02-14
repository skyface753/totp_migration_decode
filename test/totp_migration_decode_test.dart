import 'package:flutter_test/flutter_test.dart';

import 'package:totp_migration_decode/totp_migration_decode.dart';
import 'package:totp_migration_decode/totp_model.dart';

void main() {
  test('adds one to input values', () {
    final tme = TME();

    List<TotpModel> testTotpList = tme.encodeFromUrl(
        'otpauth-migration://offline?data=CioKCkhpLCBBbmRyZXMSBkFuZHJlcxoOU29tZSBTZXJ2aWNlIDEgASgBMAIKKQoKTm90IFNvIEJhZBIFS2V2aW4aDlNvbWUgU2VydmljZSAyIAEoATACEAE%3D');
    for (TotpModel t in testTotpList) {
      print(t.service + ' (' + t.issuer + ') - ' + t.secret);
    }
  });
}
