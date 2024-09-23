import 'package:flutter/material.dart';



class ViewAccountScreen extends StatelessWidget {
  final String userName;
  final String email;
  final String mobile;
  final String location;
  final String imageUrl;

  ViewAccountScreen({
    required this.userName,
    required this.email,
    required this.mobile,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 20),
            Text(
              userName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Email: $email",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Mobile: $mobile",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Location: $location",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
