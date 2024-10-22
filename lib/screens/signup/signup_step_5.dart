import 'package:flutter/material.dart';
import 'package:farmer_eats/screens/HomeScreen.dart';

class SignupStep5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the height and width of the screen
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Flexible space to adjust height dynamically
              Flexible(
                flex: 2,
                child: SizedBox(height: screenHeight * 0.25), // 25% of screen height
              ),

              // Image in the center
              Container(
                margin: EdgeInsets.only(bottom: 24.0),
                child: Image.asset(
                  'assets/images/tick.png',
                  width: screenWidth * 0.25, // 25% of screen width
                  height: screenWidth * 0.25, // Maintain aspect ratio
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Hang tight! We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Button
              Flexible(
                flex: 1,
                child: SizedBox(height: screenHeight * 0.15), // 15% of screen height
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD5715B), // Button background color
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
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
