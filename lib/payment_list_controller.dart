import 'package:demoapp/purchase_list.dart';
import 'package:demoapp/purchase_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'full_screen_loader.dart';
import 'loaders.dart';


class PaymentListController extends GetxController {
  static PaymentListController get instance => Get.find();

  //controllers
  // State variables
  var purchases = <PurchaseWithService>[].obs;
  var isLoading = true.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("hello");
    getPurchases();
  }

  Future<void> getPurchases() async {
    try {
      isLoading(true); // Start loading
      List<PurchaseWithService> fetchedPurchases = await PurchaseRepository.instance.getPurchases();
      purchases.assignAll(fetchedPurchases); // Assign the fetched data to the observable list
    } finally {
      isLoading(false); // Stop loading
    }
  }


  Future<void> confirmPay(String purhcaseId) async {
    try {
      //start loading
      print("start clicked");
      // FullScreenLoader.openLoadingDialog("Confirming a payment...");

      // final isConnected = await NetworkManager.instance.isConnected();

      // if (!isConnected) {
      //   FullScreenLoader.stopLoading();
      //   return;
      // }
      //form validation

      final serviceRepository = Get.put(PurchaseRepository());
      await serviceRepository.confirmPayment(purhcaseId);

      getPurchases();

      FullScreenLoader.stopLoading();



      //show success message
      Loaders.successSnackBar(
          title: "Success", message: "Payment has been confirmed");

      // Move to verify email address
    } catch (e) {
      // FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!', message: e.toString());
    }
  }
}
