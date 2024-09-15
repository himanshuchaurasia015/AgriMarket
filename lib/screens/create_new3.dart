import 'package:flutter/material.dart';
import 'package:agrimarket/apis/api.dart';
class PriceDetails extends StatefulWidget {
  final Map<String, dynamic> cropDetails;
  final Function(Map<String, dynamic>) addSaleCallback;

  const PriceDetails({
    Key? key,
    required this.cropDetails,
    required this.addSaleCallback,
  }) : super(key: key);

  @override
  _PriceDetailsState createState() => _PriceDetailsState();
}

class _PriceDetailsState extends State<PriceDetails> {
  final TextEditingController basePriceController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  Future<void> _submitDetails() async {
    widget.cropDetails['basePrice'] = basePriceController.text;
    widget.cropDetails['minPrice'] = minPriceController.text;
    widget.cropDetails['maxPrice'] = maxPriceController.text;

    // Make API call to submit data
    final response = await createProduct(
      widget.cropDetails['cropName'],
      widget.cropDetails['cropType'],
      widget.cropDetails['season'],
      widget.cropDetails['fertilizer'],
      widget.cropDetails['pesticides'],
      widget.cropDetails['phone'],
      '12:00', // Dummy duration, adjust as needed
      // widget.cropDetails['images'].first,
      'Good', // Quality, modify based on quality check result
      widget.cropDetails['minPrice'],
      widget.cropDetails['maxPrice'],
      widget.cropDetails['basePrice'],
    );
    print('-----------response-------------->$response');
    if (response.statusCode==200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Data submitted successfully")),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Submission failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Price Details"),
      ),
      body: Column(
        children: [
          _buildTextField("Base Price", basePriceController),
          _buildTextField("Min Price", minPriceController),
          _buildTextField("Max Price", maxPriceController),
          ElevatedButton(
            onPressed: _submitDetails,
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }

  Padding _buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: labelText),
      ),
    );
  }
}

