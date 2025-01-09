import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'sign_up_page.dart';
import '../widgets/custom_button_sign.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_sign_in_buttons.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Mendapatkan data dari SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? storedEmail = prefs.getString('email');
      String? storedPassword = prefs.getString('password');
      String? storedName = prefs.getString('name'); // Mendapatkan nama pengguna

      // Mengecek apakah email dan password yang dimasukkan sesuai dengan yang disimpan
      if (storedEmail == email && storedPassword == password) {
        print('Login successful');
        // Simpan nama pengguna ke SharedPreferences
        prefs.setString('currentUserName', storedName ?? '');

        // Navigasi ke halaman Home setelah login berhasil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        print('Invalid email or password');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    } else {
      print('Email or Password is empty');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both email and password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Welcome back! Please enter your credentials.',
              style: TextStyle(fontSize: 14, color: Colors.blueGrey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: _emailController,
              labelText: 'Enter Email',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
              hasSuffixIcon: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Sign In',
              onPressed: _signIn,
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(child: Divider(color: Colors.blueGrey)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('or sign in with'),
                ),
                Expanded(child: Divider(color: Colors.blueGrey)),
              ],
            ),
            const SizedBox(height: 16),
            SocialSignInButtons(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: const Text(
                    'Sign Up Now',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
