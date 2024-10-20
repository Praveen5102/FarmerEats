import 'dart:io';
import 'package:farmer_eats/screens/signup/signup_step_2.dart';
import 'package:farmer_eats/screens/signup/signup_step_4.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class SignupStep3 extends StatefulWidget {
  @override
  _SignupStep3State createState() => _SignupStep3State();
}

class _SignupStep3State extends State<SignupStep3> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Function to request permissions
  Future<void> _requestPermissions() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }
  }

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage() async {
    await _requestPermissions();
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(height: 50), // Header text and description
              Text(
                "FarmerEats",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 30),
              Text(
                "Signup 3 of 4",
                style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
              ),
              SizedBox(height: 16.0),
              Text(
                "Verification",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 8.0),
              Text(
                "Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic",
                style: TextStyle(fontSize: 14.0, color: Colors.grey[400]),
              ),
              SizedBox(height: 32.0),

              // Row to display the text and icon side by side
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Attach proof of registration",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700]),
                  ),
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFD5715B), // Same as the Continue button color
                      child: Icon(Icons.camera_alt, color: Colors.white, size: 30.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),

              // Display the selected image (if available)
              _image != null
                  ? Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Image.file(
                  _image!,
                  width: 100,
                  height: 100,
                ),
              )
                  : SizedBox(),
              SizedBox(height: 400),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignupStep2()),
                      );
                    },
                  ),

                  // Continue button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD5715B),
                      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignupStep4()),
                      );
                      if (_image != null) {
                        // Handle image upload or navigate to the next step
                        print("Image selected: ${_image!.path}");
                      } else {
                        // Prompt the user to select an image
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please attach proof of registration!')),
                        );
                      }
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
