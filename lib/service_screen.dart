import 'package:demoapp/styles.dart';
import 'package:demoapp/submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'asset_mapper.dart';
import 'controllers/dashboard_controller.dart';
import 'images.dart';

class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({super.key});

  @override
  State<ServiceListScreen> createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final controller = DashboardController.instance;
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.services.isEmpty) {
        return const Center(
          child: Text("No Services found!"),
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
                      "Services",
                      style: poppinsBold.copyWith(fontSize: 18),
                    ),
                    Spacer(),

                Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Stack(
                    children: [ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0EA800),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                          elevation: 0,
                        ),
                        onPressed: (){},
                        child: Text("Add New Service",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),)),

                      Positioned(
                          top: -10,
                          right: 0,
                          child: Image.asset("assets/image/in_progress.png",height: 30,))
                    ]
                  ),
                )

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

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical, // Allows vertical scrolling
                  child: DataTable(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                    ),
                    columns: [
                      DataColumn(label: Container(width: width * 0.13, child: Text('Sr No.', style: poppinsBold))),
                      DataColumn(label: Container(width: width * 0.13, child: Text('Service Description', style: poppinsBold))),
                      DataColumn(label: Container(width: width * 0.13, child: Text('Service Desc', style: poppinsBold))),
                      DataColumn(label: Container(width: width * 0.13, child: Text('Price', style: poppinsBold))),
                      DataColumn(label: Container(width: width * 0.13, child: Text('Image', style: poppinsBold))),
                    ],
                    rows: controller.services.asMap().entries.map((entry) {
                      int index = entry.key + 1;  // Getting the index (starting from 1)
                      var service = entry.value;
                      return DataRow(cells: [
                        DataCell(Text(index.toString())),  // Using the index for the first column
                        DataCell(Text(service.typename)),  // Service typename
                        DataCell(Text(service.description)),  // Service description
                        DataCell(Text("\$"+service.price.toString())),  // Service price
                        DataCell(Row(
                          children: [
                            Image.asset(AssetMapper(service.typename).assetPath,height: 40,width: 40,),
                            SizedBox(width: 10,),
                            OutlinedButton(onPressed: (){}, child: Text("Change"))
                          ],
                        )),  // Service typename again (status, modify if needed)
                      ]);
                    }).toList(),
                  ),
                ),
              )



            ],
          ),
        );
      }
    });
  }
}
