import 'package:demoapp/spin_loader.dart';
import 'package:demoapp/styles.dart';
import 'package:demoapp/submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'asset_mapper.dart';
import 'controllers/dashboard_controller.dart';
import 'images.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<PaymentHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final controller = DashboardController.instance;
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: const CircularProgressIndicator());
      } else if (controller.services.isEmpty) {
        return const Center(
          child: Text("No Payments found!"),
        );
      } else {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18,),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Image.asset(Images.ic_client, height: 30,),
                    SizedBox(width: 10,),
                    Text(
                      "Total Product Purchase / Payment",
                      style: poppinsBold.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(width: 130, height: 5, color: Colors.blue,),
              SizedBox(
                height: 10,
              ),

              controller.purchases.isEmpty?Center(child: Text("No Purchases Found!",style: TextStyle(fontSize: 16,color: Colors.red),),) :Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                    scrollDirection: Axis.vertical, // Allows vertical scrolling
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                        ),
                        columns: [
                          DataColumn(label: Container(width: width * 0.13, child: Text('Sr No.', style: poppinsBold))),
                          DataColumn(label: Container(width: width * 0.13, child: Text('Student Name', style: poppinsBold))),
                          DataColumn(label: Container(width: width * 0.13, child: Text('Services', style: poppinsBold))),
                          DataColumn(label: Container(width: width * 0.13, child: Text('Total Amount', style: poppinsBold))),
                          DataColumn(label: Container(width: width * 0.13, child: Text('Status', style: poppinsBold))),
                          DataColumn(label: Container(width: width * 0.2, child: Text('Action', style: poppinsBold))),

                        ],
                        rows: controller.purchases.asMap().entries.map((entry) {
                          int index = entry.key + 1;  // Getting the index (starting from 1)
                          var purchase = entry.value;
                          return DataRow(cells: [
                            DataCell(Text(index.toString())),  // Using the index for the first column
                            DataCell(Text(purchase.studentId.firstname +" "+purchase.studentId.lastname)),  // Service typename
                            DataCell(Row(
                              children: [
                                ...purchase.serviceTypes.map((service) => Text(
                                  "${service.typename},",
                                  style: const TextStyle(fontSize: 16),
                                )),
                              ],
                            )),  // Service description
                            DataCell(Text("\$${purchase.totalPrice}")),  // Service price
                            DataCell( Text(purchase.paymentStatus)),
                            DataCell( Row(
                              children: [
                                Container(
                                  height: 30,
                                  child: OutlinedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12), // <-- Radius
                                        ),
                                        elevation: 0,
                                      ),
                                      onPressed: (){},
                                      child:Text("View Details",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                                      )),
                                ),
                                SizedBox(width: 5,),
                                purchase.paymentStatus=="Pending"? Container(
                                  height: 30,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF0EA800),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12), // <-- Radius
                                        ),
                                        elevation: 0,
                                      ),
                                      onPressed: (){
                                        controller.confirmPay(purchase.id,loaderKey);
                                      },
                                      child:Text("Approve",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),
                                      )),
                                ):Image.asset("assets/image/verified.png")
                              ],
                            )

                            ) // Ser// Service typename again (status, modify if needed)
                          ]);
                        }).toList(),
                      ),
                    ),
                  ),
                    Loader(),
                  ]
                ),
              )



            ],
          ),
        );
      }
    });
  }
}
