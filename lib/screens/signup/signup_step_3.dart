import 'package:flutter/material.dart';
import 'signup_step_2.dart';
import 'signup_step_4.dart';

class SignupStep3 extends StatelessWidget {
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
              Text('Signup - Verification', style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text('Verification', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('Attach proof of Department of Agriculture registration i.e. Florida Fresh, USDA Approved, USDA Organic.', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 16),
              _verificationForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _verificationForm(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Attach proof of registration',
              border: OutlineInputBorder(),
            ),
          ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStep4()));
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
