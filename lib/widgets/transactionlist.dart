import 'package:flutter/material.dart';
import 'package:money_expenses_app/models/transaction.dart';

import 'glassTile.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionsList;
  TransactionList({this.transactionsList});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: transactionsList.map((transactionObj) {
          return GlassTile(
              id: transactionObj.id,
              title: transactionObj.title,
              amount: transactionObj.amount,
              date: transactionObj.date);
        }).toList(),
      ),
    );
  }
}
