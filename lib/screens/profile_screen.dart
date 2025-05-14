import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final Map worker;
  ProfileScreen({required this.worker});

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(title: Text("Worker Profile")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 8,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text("ID: ${worker['id']}", style: TextStyle(fontSize: 18)),
                Text("Name: ${worker['full_name']}", style: TextStyle(fontSize: 18)),
                Text("Email: ${worker['email']}", style: TextStyle(fontSize: 18)),
                Text("Phone: ${worker['phone']}", style: TextStyle(fontSize: 18)),
                Text("Address: ${worker['address']}", style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => logout(context),
                  child: Text("Logout"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
