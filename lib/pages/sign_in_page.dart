import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_project/widgets/custom_button_sign_up.dart';
import 'sign_up_page.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_sign_in_buttons.dart';
import '../state/auth_state.dart';


class SignInPage extends StatelessWidget {
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
              labelText: 'Enter Email',
              onChanged: (value) => context.read<AuthState>().email = value,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Password',
              obscureText: true,
              hasSuffixIcon: true,
              onChanged: (value) => context.read<AuthState>().password = value,
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
              onPressed: () {
                context.read<AuthState>().signIn();
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
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
