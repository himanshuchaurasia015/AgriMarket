// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceDetails extends StatefulWidget {
  final Map<String, dynamic> cropDetails;
  final Function(Map<String, dynamic>) addSaleCallback;

  const PriceDetails({
    super.key,
    required this.cropDetails,
    required this.addSaleCallback,
  });

  @override
  _PriceDetailsState createState() => _PriceDetailsState();
}

class _PriceDetailsState extends State<PriceDetails> {
  final TextEditingController basePriceController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  final TextEditingController customTimeController =
      TextEditingController(); // Controller for custom time input
  String? _selectedTimeLimit; // Store the selected time limit

  void _submitDetails() {
    widget.cropDetails['basePrice'] = basePriceController.text;
    widget.cropDetails['minPrice'] = minPriceController.text;
    widget.cropDetails['maxPrice'] = maxPriceController.text;
    widget.cropDetails['bidTimeLimit'] =
        _selectedTimeLimit; // Add the selected time limit

    widget.addSaleCallback(widget.cropDetails);

    // After adding sale, pop to SellScreen
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Price Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(
                  "Base Price", basePriceController, TextInputType.number),
              _buildTextField(
                  "Minimum Price", minPriceController, TextInputType.number),
              _buildTextField(
                  "Maximum Price", maxPriceController, TextInputType.number),
              SizedBox(height: 20),
              _buildTimeInput(), // Add Time Input widget
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitDetails,
                child: Text(
                  "Submit",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
        ),
        inputFormatters: inputType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly]
            : [], // Only apply formatter to numeric fields
      ),
    );
  }

  Padding _buildTimeInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _selectedTimeLimit ?? 'Enter Bid Time Limit (HH:mm)',
              style: TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: Icon(Icons.access_time),
            onPressed: _selectCustomTime,
          ),
        ],
      ),
    );
  }

  void _selectCustomTime() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Bid Time Limit'),
          content: TextField(
            controller: customTimeController,
            decoration: InputDecoration(
              hintText: 'e.g. 01:30',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              TimeFormatter(), 
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedTimeLimit = customTimeController.text;
                });
                Navigator.of(context).pop(); 
              },
              child: Text('Submit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}


class TimeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    if (text.length > 2 && text[2] != ':') {
      text = text.substring(0, 2) + ':' + text.substring(2);
    }
    if (text.length > 5) {
      text = text.substring(0, 5);
    }
    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
