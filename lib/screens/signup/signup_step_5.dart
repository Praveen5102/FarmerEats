import 'package:flutter/material.dart';
import 'signup_step_4.dart';
import 'signup_step_6.dart';

class SignupStep5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Signup - Profile Image', style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text('Profile Image', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('Please upload a profile picture', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 16),
              _profileImageUpload(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImageUpload(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.grey[200],
          child: Center(child: Text('Upload Image')),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.grey),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStep6()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: Text('Continue'),
            ),
          ],
        ),
      ],
    );
  }
}
