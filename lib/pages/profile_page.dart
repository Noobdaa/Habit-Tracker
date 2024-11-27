import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_am_cooked/components/button.dart';
import 'package:i_am_cooked/pages/login.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../components/Buttons.dart'; // For handling file system

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Variables for storing profile data
  XFile? _image; // Profile image

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'HabTrack',
            style: GoogleFonts.poppins(
              fontSize: 24,
              // color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture Section
            GestureDetector(
              onTap: _pickImage, // Trigger image picker on tap
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
                child: _image == null
                    ? Icon(
                  Icons.camera_alt,
                  size: 40,
                  color: Colors.white,
                )
                    : null,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tap to upload a Profile Picture',
              style:GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),

            // About Text Section (Static text)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              child: Column(
                children:[ Text(
                  'About Us',
                  style:GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),

                  Text(
                    'This app is designed to manage tasks effectively and efficiently. '
                        'You can add tasks, set reminders, and organize your daily activities with ease.',
                    style:GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ],
              ),
            ),
            SizedBox(height: 20),

            // Save Button (Optional)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle the save logic (if needed)
                  print("Profile Saved");
                },
                child: Text('Save Profile',
                  style:GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Full width button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
        SizedBox(height: 240,),

        GestureDetector(
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,
            ),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
