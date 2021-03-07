import 'package:flutter/material.dart';

class ChartBars extends StatelessWidget {
  final String day;
  final double spendingAmount;
  final double spendingPercentageAmount;

  ChartBars({this.day, this.spendingAmount, this.spendingPercentageAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 15,
            child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentageAmount,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          day,
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}
