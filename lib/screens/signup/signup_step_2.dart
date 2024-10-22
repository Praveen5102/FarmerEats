import 'package:flutter/material.dart';
import 'package:farmer_eats/screens/signup/signup_step_3.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupStep2 extends StatefulWidget {
  @override
  _SignupStep2State createState() => _SignupStep2State();
}

class _SignupStep2State extends State<SignupStep2> {
  final List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];

  String? selectedState;
  final TextEditingController zipController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController informalNameController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                Text("FarmerEats", style: TextStyle(fontSize: 16)),
                SizedBox(height: 40),
                Text("Signup 2 of 4", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 10),
                Text('Farm Info',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
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
        _textField('Business Name', false, Icons.label, businessNameController),
        SizedBox(height: 10),
        _textField('Informal Name', false, Icons.emoji_emotions, informalNameController),
        SizedBox(height: 10),
        _textField('Street Address', false, Icons.home, streetAddressController),
        SizedBox(height: 10),
        _textField('City', false, Icons.pin_drop_outlined, cityController),
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(width: 10),
            _stateDropdown(),
            SizedBox(width: 30),
            _zipCodeField(),
          ],
        ),
        SizedBox(height: 200),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_validateFields()) {
                  await _submitForm();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignupStep3()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD5715B),
                minimumSize: Size(200, 40),
              ),
              child: Text('Continue', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        SizedBox(height: 50),
      ],
    );
  }

  bool _validateFields() {
    if (businessNameController.text.isEmpty ||
        informalNameController.text.isEmpty ||
        streetAddressController.text.isEmpty ||
        cityController.text.isEmpty ||
        selectedState == null ||
        zipController.text.isEmpty) {
      _showErrorDialog("Please fill in all fields.");
      return false;
    }
    return true;
  }

  Future<void> _submitForm() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Store user data in Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'businessName': businessNameController.text,
          'informalName': informalNameController.text,
          'streetAddress': streetAddressController.text,
          'city': cityController.text,
          'state': selectedState,
          'zipCode': zipController.text,
        });
      }
    } catch (e) {
      _showErrorDialog("Failed to save user data. Please try again.");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _stateDropdown() {
    return Container(
      width: 120,
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
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }

  Widget _textField(String hint, bool isPassword, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 300,
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            filled: true,
            fillColor: Colors.grey[200],
            border: InputBorder.none,
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
