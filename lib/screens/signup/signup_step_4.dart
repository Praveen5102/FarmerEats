import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'signup_step_5.dart';

class SignupStep4 extends StatefulWidget {
  @override
  _SignupStep4State createState() => _SignupStep4State();
}

class _SignupStep4State extends State<SignupStep4> {
  Map<String, List<String>> dayTimings = {};
  String selectedDay = '';
  String selectedTime = '';

  void selectDay(String day) {
    setState(() {
      selectedDay = day;
    });
    print('Selected day: $selectedDay');
  }

  void selectTime(String time) {
    if (selectedDay.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select a day first."),
      ));
      return;
    }
    setState(() {
      if (!dayTimings.containsKey(selectedDay)) {
        dayTimings[selectedDay] = [];
      }

      // If the time slot is already selected for the day, remove it. Otherwise, add it.
      if (dayTimings[selectedDay]!.contains(time)) {
        dayTimings[selectedDay]!.remove(time);
      } else {
        dayTimings[selectedDay]!.add(time);
      }
    });
    print('Day timings: $dayTimings');
  }

  void saveDataToFirebase() async {
    if (dayTimings.isNotEmpty) {
      // Save to Firestore (or any other Firebase service)
      try {
        await FirebaseFirestore.instance.collection('users').add({
          'business_hours': dayTimings,
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Data saved successfully!"),
        ));

        // Navigate to the next step
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignupStep5()),
        );
      } catch (error) {
        print('Error saving data to Firebase: $error');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error saving data. Please try again."),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select at least one day and time."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('FarmerEats', style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Signup 4 of 4', style: TextStyle(fontSize: 14, color: Colors.grey)),
              SizedBox(height: 20),
              Text('Business Hours', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                  'Choose the hours your farm is open for pickups. This will allow customers to order deliveries.',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              SizedBox(height: 20),

              // Days Selection (Rectangular Buttons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dayButton('M'),
                  dayButton('T'),
                  dayButton('W'),
                  dayButton('Th'),
                  dayButton('F'),
                  dayButton('S'),
                  dayButton('Su'),
                ],
              ),
              SizedBox(height: 20),

              // Time Slots (Two in a line)
              Row(
                children: [
                  SizedBox(width: 10),
                  timeSlotButton('8:00am-10:00am'),
                  SizedBox(width: 40),
                  timeSlotButton('10:00am-1:00pm'),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 10),
                  timeSlotButton('1:00pm-4:00pm'),
                  SizedBox(width: 40),
                  timeSlotButton('4:00pm-7:00pm'),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 10),
                  timeSlotButton('7:00pm-10:00pm'),
                ],
              ),
              SizedBox(height: 200),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    onPressed: saveDataToFirebase, // Save to Firebase
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD5715B), // Same as "Continue" button color
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text('Signup', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dayButton(String day) {
    return GestureDetector(
      onTap: () => selectDay(day),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: dayTimings.containsKey(day) && dayTimings[day]!.isNotEmpty
              ? Color(0xFFD5715B)
              : Colors.grey[200], // Selected day color
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(day, style: TextStyle(color: dayTimings.containsKey(day) && dayTimings[day]!.isNotEmpty ? Colors.white : Colors.black)),
        ),
      ),
    );
  }

  Widget timeSlotButton(String time) {
    return GestureDetector(
      onTap: () => selectTime(time),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        width: 150, // Adjust the width to fit two buttons in a row
        decoration: BoxDecoration(
          color: selectedDay.isNotEmpty && dayTimings[selectedDay] != null && dayTimings[selectedDay]!.contains(time)
              ? Color(0xFFF8C569)
              : Colors.grey[200], // Selected time color
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(time, style: TextStyle(color: selectedDay.isNotEmpty && dayTimings[selectedDay]!.contains(time) ? Colors.black : Colors.grey[600])),
      ),
    );
  }
}
