import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_expenses_app/models/transaction.dart';
import 'package:money_expenses_app/widgets/chartbars.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart({this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      print('-----------------');
      print(DateFormat.E().format(weekday));
      print(totalSum);
      print('-----------------');
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalSum
      }; // Map<String,Object>
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      color: Colors.white.withOpacity(0.4),
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBars(
                day: data['day'],
                spendingAmount: data['amount'],
                spendingPercentageAmount: totalSpending == 0
                    ? 0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
