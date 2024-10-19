import 'package:flutter/material.dart';
import 'signup_step_1.dart';
import 'signup_step_3.dart';

class SignupStep2 extends StatelessWidget {
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
              Text('Signup - Farm Info', style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text('Farm Info', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              _farmInfoForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _farmInfoForm(BuildContext context) {
    return Column(
      children: [
        _textField('Business Name'),
        _textField('Informal Name'),
        _textField('Street Address'),
        _textField('City'),
        Row(
          children: [
            Expanded(child: _textField('State')),
            SizedBox(width: 8),
            Expanded(child: _textField('Enter Zipcode')),
          ],
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStep3()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: Text('Continue'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _textField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
        ),
      ),
    );
  }
}
