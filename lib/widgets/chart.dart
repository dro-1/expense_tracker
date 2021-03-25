import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  double get totalWeekAmount {
    return recentTransactions.fold(0.0, (previousValue, item) {
      return previousValue + item.amount;
    });
  }

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        var totalDaySum = 0.0;
        for (int i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            totalDaySum += recentTransactions[i].amount;
          }
        }
        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalDaySum
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return groupedTransactionValues.length > 0
        ? Card(
            elevation: 6,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: groupedTransactionValues.map(
                  (data) {
                    print(data['amount']);
                    var amountPercentage = totalWeekAmount == 0
                        ? 0.0
                        : (data['amount'] as double) / totalWeekAmount;
                    return Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          data['amount'], amountPercentage, data['day']),
                    );
                  },
                ).toList(),
              ),
            ),
          )
        : Text('There are no transactions');
  }
}
