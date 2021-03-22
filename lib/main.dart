import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      date: DateTime.now(),
      id: 't1',
      amount: 375000,
      title: 'New Lappie',
    ),
    Transaction(
      date: DateTime.now(),
      id: 't2',
      amount: 2350.56,
      title: 'Chicken Republic',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text(
                'My Chart',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: transactions
                  .map(
                    (transaction) => TransactionWidget(transaction),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
