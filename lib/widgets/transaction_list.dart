import 'package:flutter/material.dart';

import './transaction_widget.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
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
    return Column(
        children: transactions
            .map(
              (transaction) => TransactionWidget(transaction),
            )
            .toList());
  }
}
