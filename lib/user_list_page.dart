import 'package:demoapp/styles.dart';
import 'package:flutter/material.dart';

import 'images.dart';

class UsersListPage extends StatelessWidget {
  // Sample payment history data
  final List<Map<String, dynamic>> paymentHistory = [
    {
      'srNo': 1,
      'product': 'Product A',
      'price': '\$10.00',
      'date': '2024-09-01',
      'status': 'Completed',
    },
    {
      'srNo': 2,
      'product': 'Product B',
      'price': '\$20.00',
      'date': '2024-09-02',
      'status': 'Pending',
    },
    {
      'srNo': 3,
      'product': 'Product C',
      'price': '\$15.00',
      'date': '2024-09-03',
      'status': 'Failed',
    },
    {
      'srNo': 4,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 5,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 6,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 7,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 8,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 9,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 10,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 11,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 12,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 13,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 14,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 15,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 16,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 17,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },    {
      'srNo': 18,
      'product': 'Product D',
      'price': '\$30.00',
      'date': '2024-09-04',
      'status': 'Completed',
    },
  ];

  // Sample To-Do list data
  final List<Map<String, dynamic>> todoList = [
    {
      'srNo': 1,
      'task': 'Complete project documentation',
      'dueDate': '2024-10-01',
      'status': 'Pending',
    },
    {
      'srNo': 2,
      'task': 'Prepare presentation for client meeting',
      'dueDate': '2024-10-05',
      'status': 'In Progress',
    },
    {
      'srNo': 3,
      'task': 'Update project status on Trello',
      'dueDate': '2024-10-03',
      'status': 'Completed',
    },
    // Add more tasks as needed
  ];

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
                  DataColumn(label: Container(width: width*0.13, child: Text('First Name', style: poppinsBold))),
                  DataColumn(label: Container(width: width*0.13, child: Text('Last Name', style: poppinsBold))),
                  DataColumn(label: Container(width: width*0.13, child: Text('Email', style: poppinsBold))),
                  DataColumn(label: Container( width:width*0.13, child: Text('Status', style: poppinsBold))),
                ],
                rows: paymentHistory.map((payment) {
                  return DataRow(
                      cells: [
                        DataCell(Text(payment['srNo'].toString())),
                        DataCell(Text(payment['product'])),
                        DataCell(Text(payment['price'])),
                        DataCell(Text(payment['date'])),
                        DataCell(Text(payment['status'])),
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
                  DataColumn(label: Container(width: width*0.13, child: Text('First Name', style: poppinsBold))),
                  DataColumn(label: Container(width: width*0.13, child: Text('Last Name', style: poppinsBold))),
                  DataColumn(label: Container(width: width*0.13, child: Text('Email', style: poppinsBold))),
                  DataColumn(label: Container( width:width*0.13, child: Text('Status', style: poppinsBold))),
                ],
                rows: paymentHistory.map((payment) {
                  return DataRow(
                      cells: [
                        DataCell(Text(payment['srNo'].toString())),
                        DataCell(Text(payment['product'])),
                        DataCell(Text(payment['price'])),
                        DataCell(Text(payment['date'])),
                        DataCell(Text(payment['status'])),
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