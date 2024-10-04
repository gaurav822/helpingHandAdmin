import 'package:demoapp/controllers/dashboard_controller.dart';
import 'package:demoapp/styles.dart';
import 'package:flutter/material.dart';

import 'images.dart';

class UsersListPage extends StatelessWidget {
  // Sample payment history data
 final controller = DashboardController.instance;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                  "Students",
                  style: poppinsBold.copyWith(fontSize: 18),
                ),
                Spacer(),

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
              scrollDirection: Axis.vertical, // Allow horizontal scrolling
              child: DataTable(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2)
                ),
                columns: [
                  DataColumn(label: Container(width: width*0.13, child: Text('Sr No.', style: poppinsBold))),
                  DataColumn(label: Container(width: width*0.13, child: Text('Student Name', style: poppinsBold))),
                  DataColumn(label: Container(width: width*0.13, child: Text('Email', style: poppinsBold))),
                  DataColumn(label: Container(width: width*0.13, child: Text('Phone Number', style: poppinsBold))),
                  DataColumn(label: Container( width:width*0.13, child: Text('Account Status', style: poppinsBold))),
                ],
                rows: controller.students.asMap().entries.map((entry) {
                  int index = entry.key + 1;  // Getting the index (starting from 1)
                  var student = entry.value;
                  return DataRow(
                      cells: [
                        DataCell(Text(index.toString())),
                        DataCell(Text("${student.firstname}  ${student.lastname}")),
                        DataCell(Text(student.email)),
                        DataCell(Text(student.phoneNumber??"N/A")),
                        DataCell(Text(student.isVerified?"Verified":"Unverified")),
                      ]);
                }).toList(),
              ),
            ),
          ),


          SizedBox(height: 18,),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Image.asset(Images.ic_client, height: 30,),
                SizedBox(width: 10,),
                Text(
                  "Experts",
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

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, // Allow horizontal scrolling
              child: DataTable(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2)
                ),
                columns: [
                  DataColumn(label: Container(width: width*0.13, child: Text('Sr No.', style: poppinsBold))),
                  DataColumn(label: Container(width: width*0.13, child: Text('Expert Name', style: poppinsBold))),
                  DataColumn(label: Container(width: width*0.13, child: Text('Email', style: poppinsBold))),
                  DataColumn(label: Container(width: width*0.13, child: Text('Phone Number', style: poppinsBold))),
                  DataColumn(label: Container( width:width*0.13, child: Text('Account Status', style: poppinsBold))),
                ],
                rows: controller.experts.asMap().entries.map((entry) {
                  int index = entry.key + 1;  // Getting the index (starting from 1)
                  var expert = entry.value;
                  return DataRow(
                      cells: [
                        DataCell(Text(index.toString())),
                        DataCell(Text("${expert.firstname}  ${expert.lastname}")),
                        DataCell(Text(expert.email)),
                        DataCell(Text(expert.phoneNumber)),
                        DataCell(Text(expert.isVerified?"Verified":"Unverified")),
                      ]);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}