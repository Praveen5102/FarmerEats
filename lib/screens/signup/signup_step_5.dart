import 'package:flutter/material.dart';
import 'package:farmer_eats/screens/HomeScreen.dart';

class SignupStep5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 300),
              // Image in the center
              Container(
                margin: EdgeInsets.only(bottom: 24.0),
                child: Image.asset(
                  'assets/images/tick.png',
                  width: 100,
                  height: 100,
                ),
              ),

              // Main Title
              Text(
                "You’re all done!",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),

              // Subtitle Text
              SizedBox(height: 16.0),
              Text(
                "Hang tight! We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),

              // Button
              SizedBox(height: 200),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD5715B),// Button background color
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Text(
                  "Got it!",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
