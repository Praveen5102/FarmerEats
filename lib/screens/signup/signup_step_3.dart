import 'dart:io';
import 'package:farmer_eats/screens/signup/signup_step_2.dart';
import 'package:farmer_eats/screens/signup/signup_step_4.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Import Firebase Storage
import 'package:permission_handler/permission_handler.dart';

class SignupStep3 extends StatefulWidget {
  @override
  _SignupStep3State createState() => _SignupStep3State();
}

class _SignupStep3State extends State<SignupStep3> {
  File? _file;
  String? _fileName;
  bool isUploading = false; // To indicate file uploading status

  // Function to request storage permissions
  Future<void> _requestPermissions() async {
    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }
  }

  // Function to pick a file (PDF, etc.)
  Future<void> _pickFile() async {
    await _requestPermissions();

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'], // You can adjust allowed extensions
    );

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
        _fileName = result.files.single.name;
      });
    }
  }

  // Function to upload the file to Firebase Storage
  Future<void> _uploadFile() async {
    if (_file == null) {
      // No file selected, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please attach proof of registration!')),
      );
      return;
    }

    setState(() {
      isUploading = true;
    });

    try {
      // Create a reference to Firebase Storage
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('uploads/${_fileName}');

      // Upload the file
      UploadTask uploadTask = ref.putFile(_file!);
      TaskSnapshot snapshot = await uploadTask;

      // Get the file URL
      String downloadURL = await snapshot.ref.getDownloadURL();
      print('File uploaded successfully: $downloadURL');

      // Navigate to the next step (SignupStep4)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignupStep4()),
      );
    } catch (e) {
      print('File upload failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File upload failed!')),
      );
    } finally {
      setState(() {
        isUploading = false;
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
                "Attach proof of Department of Agriculture registrations (PDF, DOC, etc.)",
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
                    onTap: _pickFile,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFD5715B), // Same as the Continue button color
                      child: Icon(Icons.attach_file, color: Colors.white, size: 30.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),

              // Display the selected file name (if available)
              _file != null
                  ? Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Selected file: $_fileName',
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
              )
                  : SizedBox(),

              SizedBox(height: 200),
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
                    onPressed: isUploading ? null : _uploadFile, // Upload the file on click
                    child: isUploading
                        ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                        : Text(
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
