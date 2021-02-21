import 'package:flutter/material.dart';
import 'package:money_expenses_app/homepage.dart';
import 'package:money_expenses_app/models/transaction.dart';
import 'package:money_expenses_app/widgets/addtransactionbox.dart';
import 'package:money_expenses_app/widgets/transactionlist.dart';
import '../homepage.dart';

class UserTransactionsUpdate extends StatefulWidget {
  @override
  _UserTransactionsUpdateState createState() => _UserTransactionsUpdateState();
}

class _UserTransactionsUpdateState extends State<UserTransactionsUpdate> {
  final List<Transaction> _transactionsList = [
    Transaction(id: "T1", title: "Apples", amount: 3, date: DateTime.now()),
    Transaction(id: "T2", title: "Milk", amount: 7, date: DateTime.now()),
  ];

  void _addTransaction(String title, double amount) {
    final newTransactionObj = new Transaction(
        id: "T${_transactionsList.length + 1}",
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _transactionsList.add(newTransactionObj);
    });

    print("New Transaction -> $newTransactionObj");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransactionBox(addTransactionFunction: _addTransaction),
        TransactionList(
          transactionsList: _transactionsList,
        ),
      ],
    );
  }
}
