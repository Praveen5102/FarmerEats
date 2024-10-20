import 'package:flutter/material.dart';
import 'verifyOTPscreen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width > 600 ? 400 : double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text("FarmerEats",style: TextStyle(fontSize: 16),),
                  const SizedBox(height: 70),
                  const Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text('Remember your password? ', style: TextStyle(color: Colors.grey)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Color(0xFFD5715B)), // Consistent button color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone, color: Colors.black),
                      hintText: 'Phone Number',hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD5715B),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const VerifyOtpScreen()),
                      );
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Send Code',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Add extra spacing if needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
