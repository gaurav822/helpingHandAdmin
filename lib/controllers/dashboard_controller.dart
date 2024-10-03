import 'dart:developer';

import 'package:demoapp/repository/mainrepository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../model/purchase_list.dart';
import '../model/service_list_model.dart';
import '../spin_loader.dart';




class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  //controllers
  var services = <Service>[].obs;
  var purchases = <PurchaseWithService>[].obs;
  var isLoading = true.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getServices();
    getPurchases();
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
      loaderKey.currentState?.showLoader();
      print("start clicked");
      //show spin kit here

      await MainRepository.instance.confirmPayment(purhcaseId);

      Fluttertoast.showToast(msg: "Purchase Approved Successfully",toastLength: Toast.LENGTH_LONG);
      getPurchases();
      loaderKey.currentState?.hideLoader();

      // Move to verify email address
    } catch (e) {
      loaderKey.currentState?.hideLoader();
    }
  }

}
