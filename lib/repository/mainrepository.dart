import 'dart:convert';

import 'package:demoapp/model/expert_list.dart';
import 'package:demoapp/model/student_list.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/purchase_list.dart';
import '../model/service_list_model.dart';

class MainRepository extends GetxController {
  static MainRepository get instance => Get.find();

  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();


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
    final token = await secureStorage.read(key: 'ACCESSTOKEN');
    final url = Uri.parse('https://helpinghandapi.onrender.com/api/user/students');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':token!

        },
      );

      if (response.statusCode == 200) {
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
    final token = await secureStorage.read(key: 'ACCESSTOKEN');

    final url = Uri.parse('https://helpinghandapi.onrender.com/api/user/experts');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':token!

        },
      );

      if (response.statusCode == 200) {
        // Handle success
        return expertFromJson(response.body);

      } else {
        print("Exception occured 1");
        // Handle server errors
        throw Exception(response.body);
      }
    } on http.ClientException catch (e) {
      print("Exception occured 2");
      print(e.message);
      throw Exception(
          500); // Customize as per your error handling
    } catch (e) {
      print(e);
      print("Exception occured 3");
      rethrow;
    }
  }


  Future<List<PurchaseWithService>> getPurchases() async {
    final token = await secureStorage.read(key: 'ACCESSTOKEN');
    final url = Uri.parse('https://helpinghandapi.onrender.com/api/service/allPurchases');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token':token!
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
    final token = await secureStorage.read(key: 'ACCESSTOKEN');

    final url = Uri.parse('https://helpinghandapi.onrender.com/api/service/confirmPayment');
    try {
      final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'x-auth-token':token!
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
        print(response);
        throw Exception(response.statusCode);
      }
    } on http.ClientException catch (e) {
      throw Exception(
          500); // Customize as per your error handling
    } catch (e) {
      rethrow;
    }
  }


  Future<void> postJob(String title,String desc,String company, String location, String salary) async {
    final token = await secureStorage.read(key: 'ACCESSTOKEN');

    final url = Uri.parse('https://helpinghandapi.onrender.com/api/job');
    try {
      final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'x-auth-token':token!
          },
          body: json.encode({
            'title':title,
            'description':desc,
            'company':company,
            'location' :location,
            'salary': int.parse(salary)
          })
      );

      if (response.statusCode == 201) {
        print(response.body);
        // Handle success
      } else {
        // Handle server errors
        print(response);
        throw Exception(response.statusCode);
      }
    } on http.ClientException catch (e) {
      print(e);
      throw Exception(
          500); // Customize as per your error handling
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}