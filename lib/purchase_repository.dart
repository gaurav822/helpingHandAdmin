import 'dart:convert';
import 'dart:math';
import 'package:demoapp/purchase_list.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';



class PurchaseRepository extends GetxController {
  static PurchaseRepository get instance => Get.find();

  Future<List<PurchaseWithService>> getPurchases() async {
    final url = Uri.parse('https://helpinghandapi.onrender.com/api/service/allPurchases');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZWY5OTllY2QwZDk3MzdmNmQ3MWY2YiIsImlhdCI6MTcyNzEwNDE0NiwiZXhwIjoxNzI3MTkwNTQ2fQ.wwL5LfxgXgbzJywiVyNhgQabDLZY6ykhqDzylLedZ9M'
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        // Handle success
        return purchaseListFromJson(response.body).purchaseWithServices;

      } else {
        // Handle server errors
        throw Exception(response.statusCode);
      }
    } on http.ClientException catch (e) {
      print(e.message);
      throw Exception(
          500); // Customize as per your error handling
    } catch (e) {
      rethrow;
    }
  }


  Future<void> confirmPayment(String purhcaseId) async {
    final url = Uri.parse('https://helpinghandapi.onrender.com/api/service/confirmPayment');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZWY5OTllY2QwZDk3MzdmNmQ3MWY2YiIsImlhdCI6MTcyNzEwNDE0NiwiZXhwIjoxNzI3MTkwNTQ2fQ.wwL5LfxgXgbzJywiVyNhgQabDLZY6ykhqDzylLedZ9M'
        },
        body: json.encode({
          'purchaseId':purhcaseId
        })
      );

      if (response.statusCode == 200) {
        print(response.body);
        // Handle success
      } else {
        // Handle server errors
        throw Exception(response.statusCode);
      }
    } on http.ClientException catch (e) {
      print(e.message);
      throw Exception(
          500); // Customize as per your error handling
    } catch (e) {
      rethrow;
    }
  }

}
