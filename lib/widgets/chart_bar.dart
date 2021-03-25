import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double amountPercentage;

  ChartBar(this.amount, this.amountPercentage, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text('#${amount.toStringAsFixed(0)}'),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
            height: 50,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: amountPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            )),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
