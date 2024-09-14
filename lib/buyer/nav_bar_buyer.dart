// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:agrimarket/buyer/buy_screen.dart';
import 'package:agrimarket/screens/history_screen.dart';
import 'package:agrimarket/screens/home_screen.dart';
import 'package:agrimarket/screens/notification_screen.dart';
import 'package:agrimarket/screens/profile_screen.dart';
import 'package:agrimarket/screens/support_screen.dart';
import 'package:agrimarket/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarBuyer extends StatefulWidget {
  const NavBarBuyer({super.key});

  @override
  State<NavBarBuyer> createState() => _NavBarBuyerState();
}

class _NavBarBuyerState extends State<NavBarBuyer> {
  final BuyerNavigationController controller =
      Get.put(BuyerNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/blackbg.png',
            width: 180, fit: BoxFit.contain),
        actions: [
          IconButton(
            icon: Icon(Icons.play_circle_filled_rounded,
                size: 30, color: Color.fromARGB(255, 155, 255, 168)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_sharp,
                size: 30, color: Color.fromARGB(255, 155, 255, 168)),
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        NotificationScreen(),
                  ));
            },
          ),
          IconButton(
            icon: Icon(Icons.support_agent_rounded,
                size: 30, color: Color.fromARGB(255, 155, 255, 168)),
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SupportScreen(),
                  ));
            },
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: Theme.of(context).colorScheme.primary,
            indicatorColor: Colors.green,
            labelTextStyle: WidgetStateProperty.all(
              TextStyle(color: Colors.white),
            ),
            iconTheme: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(color: Color(0xFFD7FBE8));
              }
              return IconThemeData(color: Colors.white);
            }),
          ),
          child: NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.shopify_rounded), label: 'Buy'),
              NavigationDestination(icon: Icon(Icons.wallet), label: 'Wallet'),
              NavigationDestination(
                  icon: Icon(Icons.history_rounded), label: 'History'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class BuyerNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    BuyScreen(),
    WalletScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];
}
