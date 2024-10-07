import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../home_screen.dart';
import '../my_cm.dart';

class AuthenticationRepository extends GetxController {

  static AuthenticationRepository get instance => Get.find();


  Future<String> signInWithEmailPass({required String email, required String password}) async {
    final url = Uri.parse('https://helpinghandapi.onrender.com/api/auth/login');
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        String token = json.decode(response.body)['token'] as String;
        await secureStorage.write(key: 'ACCESSTOKEN', value: token);
        return "success";
      } else {
        return response.body;
      }
    } on http.ClientException catch (e) {
      throw Exception(500); // Customize as per your error handling
    } catch (e) {
      throw Exception(e);
    }
  }
}