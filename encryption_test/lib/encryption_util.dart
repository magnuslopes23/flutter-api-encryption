import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'dart:convert';

class EncryptData {
  static String _key = "A|*/X&>g%v@|F:Z4s9A:nrQvxiRy*?zJ"; // 32-char key
  static String _iv = "7l!y8lJ%kpyMy*iC"; // 16-char IV

  static String encryptAES(String text) {
    final keyBytes = Uint8List.fromList(utf8.encode(_key));
    final iv = Uint8List.fromList(utf8.encode(_iv));
    final cipher = CBCBlockCipher(AESEngine())
      ..init(true, ParametersWithIV(KeyParameter(keyBytes), iv));

    final inputBytes = Uint8List.fromList(utf8.encode(text));
    final encryptedBytes = encryptBytes(cipher, inputBytes);

    return base64.encode(encryptedBytes);
  }

  static String decryptAES(String encryptedText) {
    final keyBytes = Uint8List.fromList(utf8.encode(_key));
    final iv = Uint8List.fromList(utf8.encode(_iv));
    final cipher = CBCBlockCipher(AESEngine())
      ..init(false, ParametersWithIV(KeyParameter(keyBytes), iv));

    final encryptedBytes = base64.decode(encryptedText);
    final decryptedBytes = decryptBytes(cipher, encryptedBytes);

    return utf8.decode(decryptedBytes);
  }

  static Uint8List encryptBytes(BlockCipher cipher, Uint8List input) {
    final blockSize = cipher.blockSize;
    final paddedInput = padBlock(input, blockSize);
    final result = Uint8List(paddedInput.length);
    for (var i = 0; i < paddedInput.length; i += blockSize) {
      cipher.processBlock(paddedInput, i, result, i);
    }
    return result;
  }

  static Uint8List decryptBytes(BlockCipher cipher, Uint8List input) {
    final blockSize = cipher.blockSize;
    final result = Uint8List(input.length);
    for (var i = 0; i < input.length; i += blockSize) {
      cipher.processBlock(input, i, result, i);
    }
    return removePadding(result);
  }

  static Uint8List padBlock(Uint8List input, int blockSize) {
    final padLength = blockSize - (input.length % blockSize);
    final padded = Uint8List(input.length + padLength);
    padded.setAll(0, input);
    for (var i = input.length; i < padded.length; i++) {
      padded[i] = padLength;
    }
    return padded;
  }

  static Uint8List removePadding(Uint8List input) {
    final padLength = input.last;
    return input.sublist(0, input.length - padLength);
  }
}
