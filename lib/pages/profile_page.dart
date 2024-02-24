import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double? _bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Height (cm)'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _calculateBMI();
              },
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            _bmiResult != null
                ? Text(
                    'BMI: ${_bmiResult?.toStringAsFixed(1)}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      double heightInMeters = height / 100;
      double bmi = weight / (heightInMeters * heightInMeters);
      setState(() {
        _bmiResult = bmi;
      });
    }
  }
}


Widget _buildOptionTile(String title, VoidCallback onTap) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    onTap: onTap,
    trailing: Icon(Icons.arrow_forward_ios),
  );
}


class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.purple[100], // Set background color to purple
              borderRadius: BorderRadius.circular(10), // Add border radius for rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  // Add shadow color
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _getImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : AssetImage(
                            'assets/profile_picture.jpg') as ImageProvider,
                    // Add your profile picture asset path here
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'John Doe',
                  // Replace with user's name
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'john.doe@example.com',
                  // Replace with user's email
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement action here
                  },
                  child: Text('Edit Profile'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement action here
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Add space between the purple box and options
          Expanded(
            child: ListView(
              children: [
                _buildOptionTile('BMI Calculator', () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BMIPage()),
        );
      }),
                _buildOptionTile('Option 2', () {
                  // Handle option 2 tap
                }),
                _buildOptionTile('Option 3', () {
                  // Handle option 3 tap
                }),
                _buildOptionTile('Option 4', () {
                  // Handle option 4 tap
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
