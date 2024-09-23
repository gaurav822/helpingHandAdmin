import 'package:demoapp/payment_list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class PaymentListScreen extends StatefulWidget {
  const PaymentListScreen({super.key});

  @override
  State<PaymentListScreen> createState() => _PaymentListScreenState();
}

class _PaymentListScreenState extends State<PaymentListScreen> {


  @override
  Widget build(BuildContext context) {
    final controller = PaymentListController();
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.purchases.isEmpty) {
        return const Center(
          child: Text("No Purchases found!"),
        );
      } else {
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: controller.purchases.asMap().entries.map((entry) {
                  int index = entry.key; // This is the position (index)
                  var service = entry.value;

                  // Find the purchase status for each service
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column()
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: selectedServices.isNotEmpty
            //       ? () {
            //     // Proceed to the payment screen
            //     Get.to(() => PaymentScreen(selectedServices: selectedServices));
            //   }
            //       : null,
            //   child: const Text("Proceed to Payment"),
            // ),
          ],
        );
      }
    });
  }
}
