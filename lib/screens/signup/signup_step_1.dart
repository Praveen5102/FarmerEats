import 'package:flutter/material.dart';
import 'signup_step_2.dart';
import 'package:farmer_eats/screens/login/loginScreen.dart'; // Assuming you have a LoginScreen class

class SignupStep1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity, // Fill the available width
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text('Welcome!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 56),
              _socialLoginButtons(),
              SizedBox(height: 20), // Add spacing before the signup form
              _signupForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialLoginButtons() {
    return Row(
      children: [
        const SizedBox(width: 50),
        _socialButton('assets/images/google_logo.png'),
        const SizedBox(width: 70),
        _socialButton('assets/images/apple_logo.png'),
        const SizedBox(width: 70),
        _socialButton('assets/images/facebook.png'),
      ],
    );
  }

  Widget _socialButton(String assetPath) {
    return GestureDetector(
      onTap: () {
        // Add functionality for social login here if needed
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          assetPath,
          width: 40, // Set your desired width
          height: 40, // Set your desired height
        ),
      ),
    );
  }

  Widget _signupForm(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const Center(child: Text('or login with', style: TextStyle(color: Colors.grey))),
        const SizedBox(height: 50),
        _textField('Full Name', false, Icons.person),
        SizedBox(height: 10), // Spacing between text fields
        _textField('Email Address', false, Icons.email),
        SizedBox(height: 10),
        _textField('Phone Number', false, Icons.phone),
        SizedBox(height: 10),
        _textField('Password', true, Icons.lock),
        SizedBox(height: 10),
        _textField('Re-enter Password', true, Icons.lock),
        SizedBox(height: 20),
        const SizedBox(height: 50), // More spacing before the buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())); // Navigate to login screen
              },
              child: Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStep2()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD5715B), // Custom color
                minimumSize: Size(200, 40), // Increase width
              ),
              child: Text('Continue'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _textField(String hint, bool isPassword, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 300, // Set the desired width for the text field
        child: TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            prefixIcon: Icon(icon), // Icon for the text field
            filled: true, // Enable fill color
            fillColor: Colors.grey[200], // Set the background color to light grey
            border: OutlineInputBorder(),
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
