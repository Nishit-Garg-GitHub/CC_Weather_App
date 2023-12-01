import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_app/main.dart';

import 'google_sign_in_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignInService googleSignInService = GoogleSignInService();

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Login Page',
            style: TextStyle(fontSize: 35.0, color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                User? user = await googleSignInService.signInWithGoogle();

                if (user != null) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const WeatherHomePage(defaultCity: 'Pilani')));
                } else {
                  print("Error Logging in");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Set button background color
                padding: const EdgeInsets.all(20.0), // Set padding for the button
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkyt756Fxim0wbg4N5peJntzd4ImRyeikdDzuksO8j_eL15DdywPHQO4koD7k7J5hqFV0&usqp=CAU', // Replace with the actual URL of your Google logo image
                    height: 40, // Adjust the height as needed
                  ),
                  const SizedBox(
                      width: 10), // Add some space between the logo and text
                  const Text(
                    'Continue with Google',
                    style: TextStyle(fontSize: 35.0, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}