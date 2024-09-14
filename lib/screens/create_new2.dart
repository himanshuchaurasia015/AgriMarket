import 'dart:io';

import 'package:agrimarket/api_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'create_new3.dart';

class TestDetails extends StatefulWidget {
  final Map<String, dynamic> cropDetails;
  final Function(Map<String, dynamic>) addSaleCallback;

  const TestDetails({
    Key? key,
    required this.cropDetails,
    required this.addSaleCallback,
  }) : super(key: key);

  @override
  _TestDetailsState createState() => _TestDetailsState();
}

class _TestDetailsState extends State<TestDetails> {
  final List<File> _images = [];
  File? _video;
  final picker = ImagePicker();

  bool _isLoading = false;

  // Method to pick images
  Future<void> _pickImages() async {
    final pickedImages = await picker.pickMultiImage();
    if (pickedImages != null && pickedImages.length >= 3) {
      setState(() {
        _images.addAll(pickedImages.map((image) => File(image.path)));
      });
    }
  }

  // Method to pick video
  Future<void> _pickVideo() async {
    final pickedVideo = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {
      setState(() {
        _video = File(pickedVideo.path);
      });
    }
  }

  // Method to handle image and video upload, and get the response from API
  Future<void> _uploadFilesAndTestQuality() async {
    if (_images.length >= 3 && _video != null) {
      setState(() {
        _isLoading = true; // Show loading indicator
      });

      // Call API service to upload images and get response
      var imageResponse = await ApiService.uploadPhotos(_images);

      // If the upload is successful, proceed to the next step
      if (imageResponse != null && imageResponse['success']) {
        // Add image upload response to cropDetails
        widget.cropDetails['imageResponse'] = imageResponse;

        // Add image and video paths to cropDetails
        widget.cropDetails['images'] =
            _images.map((image) => image.path).toList();
        widget.cropDetails['video'] = _video!.path;

        // Navigate to Price Details screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PriceDetails(
              cropDetails: widget.cropDetails,
              addSaleCallback: widget.addSaleCallback,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to upload images")),
        );
      }

      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please upload at least 3 images and 1 video.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Crop Quality")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _pickImages,
            child: const Text("Pick Images"),
          ),
          ElevatedButton(
            onPressed: _pickVideo,
            child: const Text("Pick Video"),
          ),
          _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: _uploadFilesAndTestQuality,
                  child: const Text("Upload and Next"),
                ),
        ],
      ),
    );
  }
}
