import 'package:flutter/material.dart';
import 'package:farmer_eats/screens/signup/signup_step_3.dart';
import 'package:flutter/services.dart';

class SignupStep2 extends StatefulWidget {
  @override
  _SignupStep2State createState() => _SignupStep2State();
}

class _SignupStep2State extends State<SignupStep2> {
  // List of states for the dropdown
  final List<String> states = ['Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh', 'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 'Karnataka',
    'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur', 'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal'
  ];
  String? selectedState;
  final TextEditingController zipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Make the page scrollable
        child: Center(
          child: Container(
            width: double.infinity,
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
                Text("FarmerEats",style: TextStyle(fontSize: 16),),
                SizedBox(height: 40),
                Text("Signup 2 of 4", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 10),
                Text('Farm Info',
                    style:
                        TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                SizedBox(height: 40),
                _profileForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileForm(BuildContext context) {
    return Column(
      children: [
        _textField('Business Name', false, Icons.label),
        SizedBox(height: 10), // Spacing between text fields
        _textField('Informal Name', false, Icons.emoji_emotions),
        SizedBox(height: 10),
        _textField('Street Address', false, Icons.home),
        SizedBox(height: 10),
        _textField('City', false, Icons.pin_drop_outlined),
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(width: 40),
            _stateDropdown(), // Dropdown for State
            SizedBox(width: 20), // Spacing between dropdown and zip code
            _zipCodeField(), // Text field for Zip Code
          ],
        ),
        SizedBox(height: 200),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignupStep3()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD5715B), // Custom color
                minimumSize: Size(200, 40), // Increase width
              ),
              child: Text('Continue', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        SizedBox(height: 50),
      ],
    );
  }

  // Dropdown for state selection
  Widget _stateDropdown() {
    return Container(
      width: 140,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedState,
          hint: Text('State'),
          items: states.map((String state) {
            return DropdownMenuItem<String>(
              value: state,
              child: Text(state),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedState = newValue;
            });
          },
        ),
      ),
    );
  }

  // Text field for Zip Code
  Widget _zipCodeField() {
    return Container(
      width: 140,
      child: TextField(
        controller: zipController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.local_post_office),
          filled: true,
          fillColor: Colors.grey[200],
          border: InputBorder.none,
          hintText: 'Zip Code',
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly
        ], // To ensure only numbers are entered
      ),
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
            prefixIcon: Icon(icon),
            // Icon for the text field
            filled: true,
            // Enable fill color
            fillColor: Colors.grey[200],
            // Set the background color to light grey
            border: InputBorder.none,
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
