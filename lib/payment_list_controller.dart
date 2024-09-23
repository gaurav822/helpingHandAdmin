import 'package:demoapp/purchase_list.dart';
import 'package:demoapp/purchase_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


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
}
