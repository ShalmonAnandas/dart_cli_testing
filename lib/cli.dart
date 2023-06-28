// ignore_for_file: non_constant_identifier_names

import 'package:encrypt/encrypt.dart';

class EncryptDecrypt {
  final secret_key_hashed = Key.fromUtf8("8c02d34a655b9304c9440d816c4284c3");
  final secret_iv_hashed = IV.fromUtf8("d9537fc9b3099109");

  Encrypted encryption(String string_to_encrypt) {
    final encrypter = Encrypter(AES(secret_key_hashed, mode: AESMode.cbc));
    final encrypted =
        encrypter.encrypt(string_to_encrypt, iv: secret_iv_hashed);
    return encrypted;
  }

  String decryption(String encrypted) {
    final encrypter = Encrypter(AES(secret_key_hashed, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(encrypted),
        iv: secret_iv_hashed);
    return decrypted;
  }
}
