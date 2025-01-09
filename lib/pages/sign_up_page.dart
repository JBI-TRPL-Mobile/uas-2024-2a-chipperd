import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart'; // Import untuk membaca file JSON
import 'dart:convert'; // Import untuk decode JSON
import '../widgets/custom_button_sign_up.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_sign_in_buttons.dart';
import '../state/auth_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Variabel untuk menampung data yang dibaca dari JSON
  late String fullName;
  late String email;
  late String password;

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  // Fungsi untuk membaca file JSON
  Future<void> loadJsonData() async {
    // Membaca file JSON dari assets
    final String response = await rootBundle.loadString('assets/datauser.json');
    final data = await json.decode(response);

    setState(() {
      fullName = data['fullName']; // Ambil data 'fullName' dari JSON
      email = data['email']; // Ambil data 'email' dari JSON
      password = data['password']; // Ambil data 'password' dari JSON
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomTextField(
              labelText: 'Full Name',
              onChanged: (value) {
                setState(() {
                  fullName = value;
                });
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Enter Email',
              onChanged: (value) {
                setState(() {
                  email = value;
                  context.read<AuthState>().email = email; // Update email in AuthState
                });
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Password',
              obscureText: true,
              hasSuffixIcon: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Confirm Password',
              obscureText: true,
              hasSuffixIcon: true,
              onChanged: (value) {
                // Handle confirm password
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Sign Up',
              onPressed: () {
                // Logic for sign-up goes here
              },
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('or sign in with'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16),
            SocialSignInButtons(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Sign In Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
