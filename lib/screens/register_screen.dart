import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();

  Future<void> registerWorker() async {
    var url = Uri.parse('http://10.0.2.2/wtms/register_worker.php');
    var response = await http.post(url, body: {
      "full_name": _fullName.text,
      "email": _email.text,
      "password": _password.text,
      "phone": _phone.text,
      "address": _address.text,
    });

    var result = jsonDecode(response.body);
    if (result['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered Successfully")));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration Failed: ${result['message']}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: _fullName, decoration: InputDecoration(labelText: "Full Name")),
              TextFormField(controller: _email, decoration: InputDecoration(labelText: "Email")),
              TextFormField(controller: _password, obscureText: true, decoration: InputDecoration(labelText: "Password")),
              TextFormField(controller: _phone, decoration: InputDecoration(labelText: "Phone")),
              TextFormField(controller: _address, decoration: InputDecoration(labelText: "Address")),
              SizedBox(height: 20),
              ElevatedButton(onPressed: registerWorker, child: Text("Register")),
            ],
          ),
        ),
      ),
    );
  }
}
