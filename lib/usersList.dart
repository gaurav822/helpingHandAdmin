// users_list.dart
import 'package:demoapp/user_detail_screen.dart';
import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  String selectedFilter = "Student"; // Default filter
  List<String> users = []; // Replace this with your user model
  final List<String> allUsers = [
    "Alice (Student)",
    "Bob (Expert)",
    "Charlie (Student)",
    "David (Expert)",
    "Eva (Student)",
  ]; // Example user data

  // Example ID documents for each user
  final Map<String, List<String>> userDocuments = {
    "Alice (Student)": ["assets/image/visa.jpg"],
    "Bob (Expert)": ["assets/image/visa.jpg"],
    "Charlie (Student)": ["assets/image/visa.jpg"],
    "David (Expert)": ["assets/image/visa.jpg"],
    "Eva (Student)": ["assets/image/visa.jpg"],
  };

  @override
  void initState() {
    super.initState();
    _filterUsers(); // Initial filtering
  }

  void _filterUsers() {
    setState(() {
      users = allUsers.where((user) => user.contains(selectedFilter)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButton<String>(
              value: selectedFilter,
              icon: Icon(Icons.arrow_drop_down),
              isExpanded: false,
              underline: SizedBox(), // Remove the underline
              style: TextStyle(color: Colors.black, fontSize: 16),
              items: <String>['Student', 'Expert']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedFilter = newValue;
                    _filterUsers();
                  });
                }
              },
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Center( // Center the card
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5, // Half of the screen width
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    child: ListTile(
                      title: Text(users[index], style: TextStyle(fontWeight: FontWeight.bold)),
                      leading: Icon(Icons.person, size: 40),
                      subtitle: Text(selectedFilter, style: TextStyle(color: Colors.grey)),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailScreen(
                              userName: users[index],
                              idDocuments: userDocuments[users[index]] ?? [],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
