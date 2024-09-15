import 'dart:io';

import 'package:agrimarket/api_service.dart';
import 'package:agrimarket/screens/create_new3.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

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
  final List<File> _images = []; // Use File for image picker
  File? _video;
  VideoPlayerController? _videoController;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _requestPermissions(); // Request permissions on init
  }

  // Request permissions for storage, photos, and camera
  Future<void> _requestPermissions() async {
    final statuses = await Future.wait([
      Permission.photos.request(),
      Permission.camera.request(),
      Permission.storage.request(),
      Permission.microphone.request(),
    ]);

    if (statuses.every((status) => status.isGranted)) {
      // Permissions granted
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Permissions denied. Please allow access.")),
      );
    }
  }

  // Method to pick images
  Future<void> _pickImages() async {
    final pickedImages = await picker.pickMultiImage();

    if (pickedImages != null && pickedImages.length >= 3) {
      setState(() {
        _images.clear();
        _images.addAll(pickedImages.map((image) => File(image.path)));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select at least 3 images!")),
      );
    }
  }

  // Method to pick a video
  Future<void> _pickVideo() async {
    final pickedVideo = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedVideo != null) {
      setState(() {
        _video = File(pickedVideo.path);
        _initializeVideo(); // Initialize video when picked
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No video selected")),
      );
    }
  }

  // Initialize the video player
  void _initializeVideo() {
    if (_video != null) {
      _videoController = VideoPlayerController.file(_video!)
        ..initialize().then((_) {
          setState(() {});
          _videoController!.play(); // Automatically play the video
        });
    }
  }

  // Dummy test function (Replace with actual quality test logic)
  void _testQuality() async {
    if (_images.length >= 3 && _video != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Testing quality...")),
      );

      // Add the first image to the crop details
      widget.cropDetails['image'] = _images.first;
      print(widget.cropDetails['image']);
      print("testing......................");
      var response = await ApiService.uploadPhotos(_images);
      print(response);
      // Perform any additional crop quality test logic here
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please upload at least 3 images and 1 video!")),
      );
    }
  }

  @override
  void dispose() {
    _videoController?.dispose(); // Dispose the video controller when not needed
    super.dispose();
  }

  Widget _buildImageList() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: _images.map((image) {
        return Image.file(
          image,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Test Crop Quality"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Upload at least 3 images of your crop:"),
              const SizedBox(height: 10),
              _buildImageList(),
              ElevatedButton(
                onPressed: _pickImages,
                child: const Text("Pick Images"),
              ),
              const SizedBox(height: 20),
              const Text("Upload a video of your crop:"),
              const SizedBox(height: 10),
              _video == null
                  ? const Text("No video selected")
                  : _videoController != null &&
                          _videoController!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _videoController!.value.aspectRatio,
                          child: VideoPlayer(_videoController!),
                        )
                      : const Text("Loading video..."),
              ElevatedButton(
                onPressed: _pickVideo,
                child: const Text("Pick Video"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _testQuality,
                child: const Text("Test Crop Quality"),
              ),
              const SizedBox(height: 0),
              ElevatedButton(
                onPressed: () {
                  widget.cropDetails['image'] = _images.first;
                  widget.cropDetails['quality']="50";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PriceDetails(
                        cropDetails: widget.cropDetails,
                        addSaleCallback: widget.addSaleCallback,
                      ),
                    ),
                  );
                },
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Video Player Widget (Handles video playback)
class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
