// user_detail_screen.dart
import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final String userName;
  final List<String> idDocuments; // List of ID document asset paths

  UserDetailScreen({required this.userName, required this.idDocuments});

  void _verifyDocument(BuildContext context, String document) {
    // Add verification logic here
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$document verified!')));
  }

  void _denyDocument(BuildContext context, String document) {
    // Add denial logic here
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$document denied!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$userName's Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User Name: $userName",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text("ID Documents:", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: idDocuments.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(idDocuments[index], height: 100), // Displaying the document
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () => _verifyDocument(context, idDocuments[index]),
                                child: Text("Verify"),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                              ),
                              ElevatedButton(
                                onPressed: () => _denyDocument(context, idDocuments[index]),
                                child: Text("Deny"),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
