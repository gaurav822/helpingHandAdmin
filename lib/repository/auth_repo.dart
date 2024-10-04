import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepository extends GetxController {

  Future<void> signInWithEmailPass({required String email, required String password}) async {
    final url = Uri.parse('https://helpinghandapi.onrender.com/api/auth/login');
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
        //handle if verified or not;

      } else {

        final message = json.decode(response.body)['msg'] as String;
        // Handle server errors
        throw Exception(response.statusCode);
      }
    } on http.ClientException catch (e) {
      throw Exception(500); // Customize as per your error handling
    } catch (e) {
      throw Exception(e);
    }
  }
}