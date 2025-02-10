import 'dart:convert';
import 'package:http/http.dart' as http;
import 'encryption_util.dart';

class ApiService {
  // final String _apiEndpoint =
  //     'http://localhost:5000/api/encrypt-test'; // Local Node.js Server

  final String _apiEndpoint =
      'http://10.0.2.2:5000/api/encrypt-test'; // For Android Emulator

  Future<void> testEncryption() async {
    Map<String, dynamic> testData = {
      "username": "FlutterDev",
      "password": "SecurePass123"
    };

    // Encrypt the data
    String encryptedData = EncryptData.encryptAES(json.encode(testData));

    final response = await http.post(
      Uri.parse(_apiEndpoint),
      body: json.encode({"encryptedData": encryptedData}),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      // Decrypt the server response
      String decryptedResponse =
          EncryptData.decryptAES(json.decode(response.body)["encryptedData"]);
      print("Decrypted Response from Server: $decryptedResponse");
    } else {
      print("Error from server: ${response.body}");
    }
  }
}
