import 'package:flutter/material.dart';

class BidDetailsPage extends StatefulWidget {
  final Map<String, dynamic> saleDetails;
  final Function(int) onBidSubmitted; // Callback for when a bid is submitted

  const BidDetailsPage({
    super.key,
    required this.saleDetails,
    required this.onBidSubmitted, // Add this to constructor
  });

  @override
  State<BidDetailsPage> createState() => _BidDetailsPageState();
}

class _BidDetailsPageState extends State<BidDetailsPage> {
  final TextEditingController bidAmountController = TextEditingController();

  void _submitBid() {
    if (bidAmountController.text.isNotEmpty) {
      int bidAmount = int.parse(bidAmountController.text);

      setState(() {
        if (widget.saleDetails['basePrice'] < bidAmount) {
          widget.saleDetails['basePrice'] = bidAmount;
          widget.onBidSubmitted(bidAmount); // Notify BuyScreen of the change

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Bid submitted: ₹$bidAmount"),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "The current Amount is greater than your quoted Amount"),
          ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("${widget.saleDetails['cropName']} Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Crop Name: ${widget.saleDetails['cropName']}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Weight: ${widget.saleDetails['weight']}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Current Base Price: ₹${widget.saleDetails['basePrice']}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: bidAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter your bid amount",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitBid,
              child: Text("Bid"),
            ),
          ],
        ),
      ),
    );
  }
}
