import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'QuickSand',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    // Transaction(
    //   date: DateTime.now(),
    //   id: 't0',
    //   amount: 3750,
    //   title: 'New Lappie',
    // ),
    // Transaction(
    //   date: DateTime.now(),
    //   id: 't1',
    //   amount: 2350.56,
    //   title: 'Chicken Republic',
    // ),
  ];

  List<Transaction> get recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void createTransaction({@required String title, @required double amount}) {
    if (title.isEmpty || amount <= 0) {
      return;
    }
    final tx = Transaction(
        id: 't${transactions.length}',
        amount: amount,
        title: title,
        date: DateTime.now());
    setState(() {
      transactions.add(tx);
    });
    Navigator.of(context).pop();
  }

  void openNewTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(createTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => openNewTransactionModal(context),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => openNewTransactionModal(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Chart(recentTransactions),
            TransactionList(transactions),
          ],
        ),
      ),
    );
  }
}
