

import 'package:agrimarket/screens/nav_bar.dart';
import 'package:agrimarket/screens/sell_screen.dart';
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
    if (response.statusCode==201) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Data submitted successfully")),
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavBar()));
      }

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Submission failed")),
      );
    }
  }


  Widget customTextField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscuringCharacter: '•',
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Price Details"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customTextField("Base Price", basePriceController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customTextField("Min Price", minPriceController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customTextField("Max Price", maxPriceController),
          ),
          ElevatedButton(
            onPressed: _submitDetails,
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}