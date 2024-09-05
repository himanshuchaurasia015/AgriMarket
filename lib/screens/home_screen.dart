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
      appBar: AppBar(
        title: Image.asset('assets/images/blackbg.png',
            width: 180, fit: BoxFit.contain),
        actions: [
          IconButton(
            icon: Icon(Icons.play_circle_filled_rounded,
                size: 30, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_sharp,
                size: 30, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.support_agent_rounded,
                size: 30, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {},
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Text('Home Screen Content'),
      ),
    );
  }
}
