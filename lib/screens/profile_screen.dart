import 'dart:io'; // For File handling

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // To pick images
import 'package:shared_preferences/shared_preferences.dart'; // For persistent storage

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController languageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData(); // Load saved data when the screen initializes
  }

  // Load saved data from SharedPreferences
  Future<void> _loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? '';
      numberController.text = prefs.getString('number') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      locationController.text = prefs.getString('location') ?? '';
      languageController.text = prefs.getString('language') ?? '';
      String? imagePath = prefs.getString('imagePath');
      if (imagePath != null && imagePath.isNotEmpty) {
        _image = File(imagePath);
      }
    });
  }

  // Save data to SharedPreferences
  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('number', numberController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('location', locationController.text);
    await prefs.setString('language', languageController.text);
    if (_image != null) {
      await prefs.setString('imagePath', _image!.path);
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Set the image file
      });
      _saveData(); // Save the selected image path
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Account Details",
                  style: TextStyle(
                    fontFamily: 'lato',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 100,
                backgroundImage: _image != null
                    ? FileImage(_image!)
                    : AssetImage("assets/images/3.png") as ImageProvider,
                child: _image == null
                    ? Icon(
                        Icons.add_a_photo,
                        size: 30,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            SizedBox(height: 20),
            _buildTextField("Name", nameController),
            _buildTextField(
                "Phone Number", numberController, TextInputType.phone),
            _buildTextField(
                "Email Address", emailController, TextInputType.emailAddress),
            _buildTextField("Location", locationController),
            _buildTextField("Language", languageController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveData(); // Save data when save button is pressed
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable TextField Widget
  Padding _buildTextField(String hintText, TextEditingController controller,
      [TextInputType inputType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}
