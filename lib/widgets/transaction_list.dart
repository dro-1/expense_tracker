import 'package:flutter/material.dart';

import './transaction_widget.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: ListView(
          children: transactions
              .map(
                (transaction) => TransactionWidget(transaction),
              )
              .toList()),
    );
  }
}
