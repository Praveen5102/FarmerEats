import 'package:flutter/material.dart';
import 'package:farmer_eats/screens/signup/signup_step_1.dart';
import 'package:farmer_eats/screens/login/ForgotPasswordScreen.dart';
import '../HomeScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('FarmerEats'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            padding: const EdgeInsets.all(24.0),
            // Ensure it fits the screen width dynamically
            width: screenWidth > 1500 ? 1500 : double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text('New here? ', style: TextStyle(color: Colors.grey)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  SignupStep1()),
                        );
                      },
                      child: const Text(
                        'Create account',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email, color: Colors.grey),
                    hintText: 'Email Address',
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                        );
                      },
                      child: const Text('Forgot?', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD5715B), // Set the button color to #D5715B
                    padding: const EdgeInsets.symmetric(vertical: 16), // Padding inside the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  // Wrap the button inside a SizedBox to match the width of text fields
                  child: const SizedBox(
                    width: double.infinity, // Full width
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Optional: Change text color to white for better visibility
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),
                const Center(child: Text('or login with', style: TextStyle(color: Colors.grey))),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialIconButton('assets/images/google_logo.png'),
                    const SizedBox(width: 50),
                    socialIconButton('assets/images/apple_logo.png'),
                    const SizedBox(width: 50),
                    socialIconButton('assets/images/facebook.png'),
                  ],
                ),
                const SizedBox(height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget socialIconButton(String imagePath) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: Image.asset(
        imagePath,
        height: 24,
        width: 24,
      ),
    );
  }
}
