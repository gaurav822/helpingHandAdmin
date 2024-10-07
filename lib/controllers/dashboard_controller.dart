import 'dart:developer';

import 'package:demoapp/model/student_list.dart';
import 'package:demoapp/repository/mainrepository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../model/expert_list.dart';
import '../model/purchase_list.dart';
import '../model/service_list_model.dart';
import '../spin_loader.dart';




class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  //controllers
  var students = <Student>[].obs;
  var experts = <Expert>[].obs;
  var services = <Service>[].obs;
  var purchases = <PurchaseWithService>[].obs;
  var isLoading = true.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUsers();
    getServices();
    getPurchases();
  }

  Future<void> getUsers() async{
    try {
      isLoading(true); // Start loading
      List<Expert> fetchedExperts = await MainRepository.instance.getExperts();
      List<Student> fetchedStudents = await MainRepository.instance.getStudents();
      students.assignAll(fetchedStudents); // Assign the fetched data to the observable list
      experts.assignAll(fetchedExperts); // Assign the fetched data to the observable list
    } catch(e) {
      isLoading(false); // Stop loading
    }
  }

  Future<void> getServices() async {
    try {
      isLoading(true); // Start loading
      List<Service> fetchedServices = await MainRepository.instance.getServices();
      services.assignAll(fetchedServices); // Assign the fetched data to the observable list
    } catch(e) {
      isLoading(false); // Stop loading
    }
  }

  Future<void> getPurchases() async {
    try {
      isLoading(true); // Start loading
      List<PurchaseWithService> fetchedPurchases = await MainRepository.instance.getPurchases();
      purchases.assignAll(fetchedPurchases); // Assign the fetched data to the observable list
    } finally {
      isLoading(false); // Stop loading
    }
  }


  Future<void> confirmPay(String purhcaseId, GlobalKey<LoaderState> loaderKey) async {
    try {
      //start loading
      loaderKey.currentState?.showLoader(); //show spin kit here

      await MainRepository.instance.confirmPayment(purhcaseId);

      Fluttertoast.showToast(msg: "Purchase Approved Successfully",toastLength: Toast.LENGTH_LONG);
      getPurchases();
      loaderKey.currentState?.hideLoader();

      // Move to verify email address
    } catch (e) {
      loaderKey.currentState?.hideLoader();
    }
  }


  Future<void> postAccomodation(String purhcaseId, GlobalKey<LoaderState> loaderKey) async {
    try {
      //start loading
      loaderKey.currentState?.showLoader(); //show spin kit here

      await MainRepository.instance.confirmPayment(purhcaseId);

      Fluttertoast.showToast(msg: "Purchase Approved Successfully",toastLength: Toast.LENGTH_LONG);
      getPurchases();
      loaderKey.currentState?.hideLoader();

      // Move to verify email address
    } catch (e) {
      loaderKey.currentState?.hideLoader();
    }
  }


  Future<void> postJob(String title,String desc,String company, String location, String salary, GlobalKey<LoaderState> loaderKey) async {
    try {
      //start loading
      loaderKey.currentState?.showLoader(); //show spin kit here

      await MainRepository.instance.postJob(title,desc,company,location,salary);

      Fluttertoast.showToast(msg: "New Job Added Successfully",toastLength: Toast.LENGTH_LONG);
      // getPurchases();
      loaderKey.currentState?.hideLoader();

      // Move to verify email address
    } catch (e) {
      loaderKey.currentState?.hideLoader();
    }
  }



}
