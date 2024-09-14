// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:agrimarket/screens/nav_bar.dart';
import 'package:agrimarket/screens/wallet_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/slide1.png",
                    ),
                    SizedBox(width: 16),
                    Image.asset(
                      "assets/images/slide2.png",
                    ),
                    SizedBox(width: 16),
                    Image.asset(
                      "assets/images/slide3.png",
                    ),
                    SizedBox(width: 16),
                    Image.asset(
                      "assets/images/slide4.png",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                width: BouncingScrollSimulation.maxSpringTransferVelocity,
                child: Text(
                  "Today's Price",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/pic1.png",
                    ),
                    SizedBox(width: 16),
                    Image.asset(
                      "assets/images/pic2.png",
                    ),
                    SizedBox(width: 16),
                    Image.asset(
                      "assets/images/pic3.png",
                    ),
                    SizedBox(width: 16),
                    Image.asset(
                      "assets/images/pic4.png",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: BouncingScrollSimulation.maxSpringTransferVelocity,
                  child: Text(
                    "Wallet Balance",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            "Add Money",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            "Add Money",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.card_giftcard_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            "Add Money",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.cached_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            "Add Money",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                width: BouncingScrollSimulation.maxSpringTransferVelocity,
                child: Text(
                  "Best Bidings",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Image.asset("assets/images/best1.png"),
                SizedBox(
                  height: 10,
                ),
                Image.asset("assets/images/best2.png"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
