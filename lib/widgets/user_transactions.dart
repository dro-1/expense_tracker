import 'package:flutter/material.dart';

import './../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(
      date: DateTime.now(),
      id: 't0',
      amount: 375000,
      title: 'New Lappie',
    ),
    Transaction(
      date: DateTime.now(),
      id: 't1',
      amount: 2350.56,
      title: 'Chicken Republic',
    ),
  ];

  void createTransaction({@required String title, @required double amount}) {
    final tx = Transaction(
        id: 't${transactions.length}',
        amount: amount,
        title: title,
        date: DateTime.now());
    setState(() {
      transactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(createTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
