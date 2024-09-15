
// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:async';
import 'package:agrimarket/screens/create_new1.dart';
import 'package:agrimarket/screens/sell_details.dart';
import 'package:flutter/material.dart';
import 'package:agrimarket/apis/api.dart';
class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  List<Map<String, dynamic>> recentSells = [];
  List<dynamic> data = [];
  Timer? _timer; // For the countdown timer
  Duration _timeLeft = Duration(); // The remaining time for the current timer

  @override
  void initState() {
    super.initState();
    // Call the function to fetch active products
    _fetchActiveProducts();
  }

  // Function to fetch active products from API
  Future<void> _fetchActiveProducts() async {
    try {
      final fetchedData = await getActiveProducts();
      setState(() {
        // data = fetchedData;
        // recentSells = fetchedData.map((item) => item as Map<String, dynamic>).toList();
      });
    } catch (e) {
      // Handle the error if there's an exception
      print('Error fetching active products: $e');
    }
  }
  // Function to add new sale details
  void _addNewSale(Map<String, dynamic> saleDetails) {
    setState(() {
      recentSells.add(saleDetails);
    });
  }

  // Function to start the timer
  void _startTimer(String timeLimit) {
    List<String> timeParts = timeLimit.split(':');
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);

    _timeLeft = Duration(hours: hours, minutes: minutes);

    _timer?.cancel(); // Cancel any existing timer

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_timeLeft.inSeconds > 0) {
          _timeLeft = _timeLeft - Duration(seconds: 1);
        } else {
          timer.cancel();
        }
      });
    });
  }

  // Function to stop the timer
  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _timeLeft = Duration(); // Reset the timer
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Recent Sales",
                  style: TextStyle(
                    fontFamily: 'lato',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateNew1(
                          addSaleCallback: _addNewSale,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Create New",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
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
                          builder: (context) => SaleDetailsScreen(
                              saleDetails: recentSells[index]),
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
                                Text(
                                  recentSells[index]['cropName'],
                                  style: TextStyle(
                                    fontFamily: 'lato',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _startTimer(recentSells[index]['bidTimeLimit']);
                                  },
                                  child: Text("Start"),
                                ),
                                ElevatedButton(
                                  onPressed: _stopTimer,
                                  child: Text("End"),
                                ),
                                Text(
                                  _timeLeft.inHours.toString().padLeft(2, '0') +
                                      ":" +
                                      (_timeLeft.inMinutes % 60)
                                          .toString()
                                          .padLeft(2, '0') +
                                      ":" +
                                      (_timeLeft.inSeconds % 60)
                                          .toString()
                                          .padLeft(2, '0'),
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
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
          )
        ],
      ),
    );
  }
}