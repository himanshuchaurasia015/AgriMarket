import 'package:agrimarket/screens/create_new2.dart';
import 'package:flutter/material.dart';

class CreateNew1 extends StatefulWidget {
  final Function(Map<String, dynamic>) addSaleCallback;

  const CreateNew1({super.key, required this.addSaleCallback});

  @override
  _CreateNew1State createState() => _CreateNew1State();
}

class _CreateNew1State extends State<CreateNew1> {
  final TextEditingController cropNameController = TextEditingController();
  final TextEditingController cropTypeController = TextEditingController();
  final TextEditingController seasonController = TextEditingController();
  final TextEditingController fertilizerController = TextEditingController();
  final TextEditingController pesticidesController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> _saveData() async {
    Map<String, dynamic> cropDetails = {
      "cropName": cropNameController.text,
      "cropType": cropTypeController.text,
      "season": seasonController.text,
      "fertilizer": fertilizerController.text,
      "pesticides": pesticidesController.text,
      "phone": phoneController.text,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TestDetails(
          cropDetails: cropDetails,
          addSaleCallback: widget.addSaleCallback,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Basic Details",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primaryContainer,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            _buildTextField("Crop Name", cropNameController),
            _buildTextField("Crop Type", cropTypeController),
            _buildTextField("Season", seasonController),
            _buildTextField("Fertilizer", fertilizerController),
            _buildTextField("Pesticides", pesticidesController),
            _buildTextField("Phone", phoneController, TextInputType.phone),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              child: Text(
                'Save & Next',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
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
      ),
    );
  }
}
