import 'package:agrimarket/screens/create_new1.dart';
import 'package:agrimarket/screens/sell_details.dart';
import 'package:flutter/material.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  List<Map<String, dynamic>> recentSells = [];

  // Function to add new sale details
  void _addNewSale(Map<String, dynamic> saleDetails) {
    setState(() {
      recentSells.add(saleDetails);
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
                        child: Row(
                          children: [
                            // Display image of the crop
                            recentSells[index]['image'] != null
                                ? Image.file(
                                    recentSells[index]['image'],
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Icon(Icons.image, size: 100),
                            SizedBox(width: 16),
                            // Display name of the crop
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
