import 'package:flutter/material.dart';
import 'package:money_expenses_app/models/transaction.dart';

import 'glassTile.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionsList;
  TransactionList({this.transactionsList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GlassTile(
              id: transactionsList[index].id,
              title: transactionsList[index].title,
              amount: transactionsList[index].amount,
              date: transactionsList[index].date);
        },
        itemCount: transactionsList.length,
      ),
    );
  }
}

/*

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

 */
