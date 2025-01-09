import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'message_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName = '';
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('name') ?? '';
      _userEmail = prefs.getString('email') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue),
            title: Text(_userName),
            subtitle: Text(_userEmail),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.video_library, color: Colors.blue),
            title: Text('Video Preference'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.download, color: Colors.blue),
            title: Text('Download Option'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.play_arrow, color: Colors.blue),
            title: Text('Video Playback Options'),
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Account Settings'),
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.blue),
            title: Text('Account Security'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.email, color: Colors.blue),
            title: Text('Email Notification Preferences'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.blue),
            title: Text('Learning Reminders'),
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info, color: Colors.blue),
            title: Text('About Learnout'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.help, color: Colors.blue),
            title: Text('Frequently Asked Questions'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.share, color: Colors.blue),
            title: Text('Share the Learnout App'),
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Log Out'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Log Out'),
                  content: Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: Text('Log Out'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
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
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MessagePage()),
            );
          }
        },
      ),
    );
  }
}
