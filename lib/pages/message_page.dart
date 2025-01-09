import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';

class MessagePage extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {'sender': 'Alice', 'message': 'Hi! How are you?'},
    {'sender': 'Bob', 'message': 'Don’t forget our meeting tomorrow.'},
    {'sender': 'Charlie', 'message': 'Can we reschedule our call?'},
    {'sender': 'Diana', 'message': 'Happy birthday! Hope you have a great day.'},
    {'sender': 'Eve', 'message': 'Check out this new app I found.'},
    {'sender': 'Frank', 'message': 'Are you available for a quick chat?'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.mail, color: Colors.blue), // Ikon amplop
            title: Text(
              messages[index]['sender']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(messages[index]['message']!),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}
