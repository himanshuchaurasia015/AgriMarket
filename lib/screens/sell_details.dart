import 'dart:io';
import 'package:flutter/material.dart';

class SaleDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> saleDetails;

  const SaleDetailsScreen({super.key, required this.saleDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "${saleDetails['cropName']} Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Crop Name: ${saleDetails['cropName']}"),
            Text("Crop Type: ${saleDetails['cropType']}"),
            Text("Season: ${saleDetails['season']}"),
            Text("Fertilizer Used: ${saleDetails['fertilizer']}"),
            Text("Pesticides Used: ${saleDetails['pesticides']}"),
            Text("Phone: ${saleDetails['phone']}"),
            SizedBox(height: 20),
            saleDetails['image'] != null
                ? Image.file(
                    saleDetails['image'],
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  )
                : Text("No image available"),
          ],
        ),
      ),
    );
  }
}
