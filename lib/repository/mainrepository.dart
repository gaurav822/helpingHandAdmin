import 'dart:convert';

import 'package:demoapp/model/expert_list.dart';
import 'package:demoapp/model/student_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/purchase_list.dart';
import '../model/service_list_model.dart';

class MainRepository extends GetxController {
  static MainRepository get instance => Get.find();

  Future<List<Service>> getServices() async {
    final url = Uri.parse('https://helpinghandapi.onrender.com/api/service/types');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        // Handle success
        return serviceFromJson(response.body);

      } else {
        // Handle server errors
        throw Exception(response.body);
      }
    } on http.ClientException catch (e) {
      print(e.message);
      throw Exception(
          500); // Customize as per your error handling
    } catch (e) {
      rethrow;
    }
  }


  Future<List<Student>> getStudents() async {
    final url = Uri.parse('https://helpinghandapi.onrender.com/api/user/students');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZWY5OTllY2QwZDk3MzdmNmQ3MWY2YiIsImlhdCI6MTcyODAxMjYzMiwiZXhwIjoxNzI4MDk5MDMyfQ.d5HK7I50XwngnAvyF_kr1U-J1IFNkiXa12rSh54c95o'

        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        // Handle success
        return studentFromJson(response.body);

      } else {
        // Handle server errors
        throw Exception(response.body);
      }
    } on http.ClientException catch (e) {
      print(e.message);
      throw Exception(
          500); // Customize as per your error handling
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Expert>> getExperts() async {
    final url = Uri.parse('https://helpinghandapi.onrender.com/api/user/experts');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZWY5OTllY2QwZDk3MzdmNmQ3MWY2YiIsImlhdCI6MTcyODAxMjYzMiwiZXhwIjoxNzI4MDk5MDMyfQ.d5HK7I50XwngnAvyF_kr1U-J1IFNkiXa12rSh54c95o'

        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        // Handle success
        return expertFromJson(response.body);

      } else {
        // Handle server errors
        throw Exception(response.body);
      }
    } on http.ClientException catch (e) {
      print(e.message);
      throw Exception(
          500); // Customize as per your error handling
    } catch (e) {
      rethrow;
    }
  }


  Future<List<PurchaseWithService>> getPurchases() async {
    final url = Uri.parse('https://helpinghandapi.onrender.com/api/service/allPurchases');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZWY5OTllY2QwZDk3MzdmNmQ3MWY2YiIsImlhdCI6MTcyNzk2MzQzNCwiZXhwIjoxNzI4MDQ5ODM0fQ.dms0eblVoMep3-d7eQHmkC4H3MaF2jA8LQKOJBZTC8s'
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


  Future<void> confirmPayment(String purchaseId) async {
    final url = Uri.parse('https://helpinghandapi.onrender.com/api/service/confirmPayment');
    try {
      final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'x-auth-token':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZWY5OTllY2QwZDk3MzdmNmQ3MWY2YiIsImlhdCI6MTcyNzk2MzQzNCwiZXhwIjoxNzI4MDQ5ODM0fQ.dms0eblVoMep3-d7eQHmkC4H3MaF2jA8LQKOJBZTC8s'
          },
          body: json.encode({
            'purchaseId':purchaseId
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