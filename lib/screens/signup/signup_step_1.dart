import 'package:flutter/material.dart';
import 'package:farmer_eats/screens/signup/signup_step_2.dart';
import 'package:farmer_eats/screens/login/loginScreen.dart';
import 'package:flutter/services.dart'; // Assuming you have a LoginScreen class

class SignupStep1 extends StatefulWidget {
  @override
  _SignupStep1State createState() => _SignupStep1State();
}

class _SignupStep1State extends State<SignupStep1> {
  // Controllers for the text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  // Visibility toggle for password fields
  bool _obscurePassword = true;
  bool _obscureRePassword = true;

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
                SizedBox(height: 10),
                Text("FarmerEats",style: TextStyle(fontSize: 16)),
                SizedBox(height: 50),
                Text("Signup 1 of 4",style: TextStyle(color: Colors.grey),),
                SizedBox(height: 10),
                Text('Welcome!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 56),
                _socialLoginButtons(),
                SizedBox(height: 20),
                _signupForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialButton('assets/images/google_logo.png'),
        const SizedBox(width: 70),
        _socialButton('assets/images/apple_logo.png'),
        const SizedBox(width: 70),
        _socialButton('assets/images/facebook.png'),
      ],
    );
  }

  Widget _socialButton(String assetPath) {
    return GestureDetector(
      onTap: () {
        // Add functionality for social login here if needed
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          assetPath,
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  Widget _signupForm(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const Center(child: Text('or login with', style: TextStyle(color: Colors.grey))),
        const SizedBox(height: 30),
        _textField('Full Name', false, Icons.person, nameController),
        SizedBox(height: 10),
        _textField('Email Address', false, Icons.email, emailController),
        SizedBox(height: 10),
        _textField('Phone Number', false, Icons.phone, phoneController, isPhone: true),
        SizedBox(height: 10),
        _textField('Password', true, Icons.lock, passwordController),
        SizedBox(height: 10),
        _textField('Re-enter Password', true, Icons.lock, rePasswordController, isRePassword: true),
        SizedBox(height: 20),
        const SizedBox(height: 50),
        Row(
          children: [
            SizedBox(width: 50),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Login', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
            ),
            SizedBox(width:50),
            ElevatedButton(
              onPressed: () {
                if (_validateFields()) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStep2()));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD5715B),
                minimumSize: Size(200, 40),
              ),
              child: Text('Continue',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
        SizedBox(height: 50),
      ],
    );
  }

  Widget _textField(String hint, bool isPassword, IconData icon, TextEditingController controller, {bool isRePassword = false, bool isPhone = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 300,
        child: TextField(
          controller: controller,
          obscureText: isPassword && (isRePassword ? _obscureRePassword : _obscurePassword),
          keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
          inputFormatters: isPhone ? [FilteringTextInputFormatter.digitsOnly] : null,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(isRePassword ? (_obscureRePassword ? Icons.visibility : Icons.visibility_off) : (_obscurePassword ? Icons.visibility : Icons.visibility_off)),
              onPressed: () {
                setState(() {
                  if (isRePassword) {
                    _obscureRePassword = !_obscureRePassword;
                  } else {
                    _obscurePassword = !_obscurePassword;
                  }
                });
              },
            )
                : null,
            filled: true,
            fillColor: Colors.grey[200],
            border: InputBorder.none,
            hintText: hint,
          ),
        ),
      ),
    );
  }

  bool _validateFields() {
    String email = emailController.text;
    String phone = phoneController.text;
    String password = passwordController.text;
    String rePassword = rePasswordController.text;

    if (nameController.text.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || rePassword.isEmpty) {
      _showErrorDialog('Please fill in all fields');
      return false;
    }

    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(email)) {
      _showErrorDialog('Please enter a valid Gmail address');
      return false;
    }

    if (phone.length != 10) {
      _showErrorDialog('Phone number must be 10 digits long');
      return false;
    }

    if (password.length < 6) { // Minimum password length validation
      _showErrorDialog('Password must be at least 6 characters long');
      return false;
    }

    if (password != rePassword) {
      _showErrorDialog('Passwords do not match');
      return false;
    }

    return true;
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
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
