// import 'package:flutter/material.dart';

// class BuyScreen extends StatefulWidget {
//   const BuyScreen({super.key});

//   @override
//   State<BuyScreen> createState() => _BuyScreenState();
// }

// class _BuyScreenState extends State<BuyScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Theme.of(context).colorScheme.primaryContainer,
//         body: Column(
//           children: [
//             SizedBox(
//               height: 16,
//             ),
//             Container(
//               height: 60,
//               width: double.infinity,
//               color: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Text(
//                   "New Bidings",
//                   style: TextStyle(
//                       fontFamily: 'lato',
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Theme.of(context).colorScheme.primary),
//                 ),
//               ),
//             ),
//             SizedBox(height: 15),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView.builder(
//                 itemCount: 5,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => (
//                               saleDetails: recentSells[index]),
//                         ),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 170,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Row(
//                               children: [
//                                 recentSells[index]['image'] != null
//                                     ? Image.file(
//                                         recentSells[index]['image'],
//                                         height: 100,
//                                         width: 100,
//                                         fit: BoxFit.cover,
//                                       )
//                                     : Icon(Icons.image, size: 100),
//                                 SizedBox(width: 16),
//                                 Text(
//                                   recentSells[index]['cropName'],
//                                   style: TextStyle(
//                                     fontFamily: 'lato',
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     _startTimer(recentSells[index]['bidTimeLimit']);
//                                   },
//                                   child: Text("Start"),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: _stopTimer,
//                                   child: Text("End"),
//                                 ),
//                                 Text(
//                                   _timeLeft.inHours.toString().padLeft(2, '0') +
//                                       ":" +
//                                       (_timeLeft.inMinutes % 60)
//                                           .toString()
//                                           .padLeft(2, '0') +
//                                       ":" +
//                                       (_timeLeft.inSeconds % 60)
//                                           .toString()
//                                           .padLeft(2, '0'),
//                                   style: TextStyle(
//                                       fontSize: 16, fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           )
//           ],
//         ));
//   }
// }
