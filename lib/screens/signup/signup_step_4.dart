import 'package:flutter/material.dart';
import 'signup_step_3.dart';
import 'signup_step_5.dart';

class SignupStep4 extends StatelessWidget {
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
              Text('Signup - Business Hours', style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text('Business Hours', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('Choose the hours your farm is open for pickups.', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 16),
              _businessHoursSelection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _businessHoursSelection(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8,
          children: List.generate(7, (index) {
            return ChoiceChip(
              label: Text(['M', 'T', 'W', 'Th', 'F', 'S', 'Su'][index]),
              selected: false,
              onSelected: (selected) {},
            );
          }),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStep5()));
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
