library totp_migration_encode;

import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:base32/base32.dart';
import 'package:totp_migration_decode/totp_model.dart';

class TME {
  List<TotpModel> encodeFromUrl(String url) {
    List<TotpModel> list = [];
    // Get the Data from the URL
    String data = url.split('data=')[1];
    data = Uri.decodeFull(data);
    // Base64 Decode the Data
    List<int> bytesList = base64.decode(data);

    while (bytesList.length > 3) {
      print('bytesList.length: ${bytesList.length}');

      try {
        bytesList = bytesList.sublist(3);
        //SEED
        var seedList = _consume(bytesList);
        var seed = seedList[0];
        bytesList = seedList[1];
        //Account
        var accountList = _consume(bytesList);
        var account = accountList[0];
        bytesList = accountList[1];
        //Service
        var serviceList = _consume(bytesList);
        var service = serviceList[0];
        bytesList = serviceList[1];
        // Encode the seed to base32
        String seedBase32 = base32.encode(Uint8List.fromList(seed));

        String accountString = utf8.decode(account);
        String serviceString = utf8.decode(service);
        TotpModel totpModel =
            TotpModel(seedBase32, accountString, serviceString);

        list.add(totpModel);
        bytesList = bytesList.sublist(5);
      } catch (e) {
        print("Error on List: " + bytesList.toString());
        log(e.toString());
        break;
      }
    }
    inspect(list);
    return list;
  }

  _consume(List<int> bytes) {
    int firstByte = 0;
    List<int> firstReturn = [];
    List<int> secondReturn = [];
    try {
      firstByte = bytes[0];
      firstReturn = bytes.getRange(1, firstByte + 1).toList();
      secondReturn = bytes.getRange(firstByte + 2, bytes.length).toList();
      return [firstReturn, secondReturn];
    } catch (e) {
      print("-------");
      print("FirstByte: $firstByte");
      print("Bytes: $bytes");
      print("FirstReturn: $firstReturn");
      print("SecondReturn: $secondReturn");
      print(e);
      print("-------");
    }
  }

  // _consume(ByteData bytes) {
  //   var l = bytes.
  // }
}
