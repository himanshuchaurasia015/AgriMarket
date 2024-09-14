import 'package:agrimarket/buyer/buy_details.dart';
import 'package:flutter/material.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({super.key});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  List<Map<String, dynamic>> recentSells = [
    {
      'cropName': 'Wheat',
      'weight': '100kg',
      'basePrice': 2000,
      'image': null,
      'bidTimeLimit': '02:00',
    },
    {
      'cropName': 'Rice',
      'weight': '50kg',
      'basePrice': 1500,
      'image': null,
      'bidTimeLimit': '03:00',
    },
    // Add more sample data as required
  ];

  Duration _timeLeft = Duration.zero;

  void _startTimer(String bidTimeLimit) {
    setState(() {
      _timeLeft = Duration(
        hours: int.parse(bidTimeLimit.split(":")[0]),
        minutes: int.parse(bidTimeLimit.split(":")[1]),
      );
    });
  }

  void _stopTimer() {
    setState(() {
      _timeLeft = Duration.zero;
    });
  }

  // Method to handle bid updates
  void _updateBasePrice(int index, int newPrice) {
    setState(() {
      recentSells[index]['basePrice'] = newPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Column(
        children: [
          SizedBox(height: 16),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "New Biddings",
                style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: recentSells.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BidDetailsPage(
                            saleDetails: recentSells[index],
                            onBidSubmitted: (newPrice) {
                              _updateBasePrice(index, newPrice);
                            },
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                recentSells[index]['image'] != null
                                    ? Image.file(
                                        recentSells[index]['image'],
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(Icons.image, size: 100),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recentSells[index]['cropName'],
                                      style: TextStyle(
                                        fontFamily: 'lato',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Weight: ${recentSells[index]['weight']}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "Base Price: ₹${recentSells[index]['basePrice']}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
