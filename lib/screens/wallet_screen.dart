import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final TextEditingController _amountController = TextEditingController();
  double _balance =
      1000.00; // Example balance, you might fetch this from a backend

  void _transferAmount(String method) {
    final double amount = double.tryParse(_amountController.text) ?? 0.0;
    if (amount <= 0 || amount > _balance) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid amount or insufficient balance')),
      );
      return;
    }

    // Deduct the amount from the balance
    setState(() {
      _balance -= amount;
    });

    // Clear the amount field
    _amountController.clear();

    // Show receipt
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Transaction Receipt'),
          content: Text(
              'Amount: \$${amount.toStringAsFixed(2)}\nMethod: $method\nRemaining Balance: \$${_balance.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Wallet",
                style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Balance:',
                  style: TextStyle(
                    fontFamily: 'lato',
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    '\$${_balance.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontFamily: 'lato',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: 'Enter Amount',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _transferAmount('Bank Account'),
                  child: Text('Transfer to Bank Account'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _transferAmount('UPI'),
                  child: Text('Transfer to UPI'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
