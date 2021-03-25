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
        height: 500,
        child: transactions.length > 0
            ? ListView(
                children: transactions
                    .map(
                      (transaction) => TransactionWidget(transaction),
                    )
                    .toList())
            : Column(
                children: <Widget>[
                  Text(
                    'No Transactions Recorded',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      height: 400,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              ));
  }
}
