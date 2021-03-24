import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final createTransaction;

  NewTransaction(this.createTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              style: TextStyle(fontSize: 20),
              controller: titleController,
              onSubmitted: (_) {
                widget.createTransaction(
                    title: titleController.text,
                    amount: double.parse(amountController.text));
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              style: TextStyle(fontSize: 20),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                widget.createTransaction(
                    title: titleController.text,
                    amount: double.parse(amountController.text));
              },
            ),
            FlatButton(
              onPressed: () {
                widget.createTransaction(
                    title: titleController.text,
                    amount: double.parse(amountController.text));
              },
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
