import 'package:flutter/material.dart';
import 'package:money_expenses_app/widgets/addtransactionbox.dart';
import 'package:money_expenses_app/widgets/chart.dart';
import 'package:money_expenses_app/widgets/transactionlist.dart';
import 'dart:ui';

import 'models/transaction.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

final List<Transaction> transactionsList = [
  Transaction(
      id: "T1",
      title: "Apples",
      amount: 3,
      date: DateTime.now().subtract(Duration(days: 1))),
  Transaction(
      id: "T2",
      title: "Milk",
      amount: 7,
      date: DateTime.now().subtract(Duration(days: 2))),
  Transaction(
      id: "T3",
      title: "Mango",
      amount: 10,
      date: DateTime.now().subtract(Duration(days: 3))),
  Transaction(
      id: "T4",
      title: "Juice",
      amount: 5,
      date: DateTime.now().subtract(Duration(days: 4))),
];

class _HomepageState extends State<Homepage> {
  List<Transaction> get _recentTransactions {
    return transactionsList.where((transactionObj) {
      return transactionObj.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void deleteTransaction(String id) {
    setState(() {
      transactionsList.removeWhere((element) => element.id == id);
    });
  }

  void _addTransaction(String title, double amount, DateTime date) {
    final newTransactionObj = new Transaction(
        id: "T${transactionsList.length + 1}",
        title: title,
        amount: amount,
        date: date);

    setState(() {
      transactionsList.add(newTransactionObj);
    });

    print("New Transaction -> $newTransactionObj");
  }

  void startAddNewTransaction(BuildContext buildContext) {
    showModalBottomSheet(
        isScrollControlled: true, // moves the sheet upwards with keyboard open
        context: buildContext,
        builder: (context) {
          return AddTransactionBox(
            addTransactionFunction: _addTransaction,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCA436B).withOpacity(0.9),
        title: Center(
            child: Text(
          "Expenses App",
          style: TextStyle(fontFamily: 'OpenSans'),
        )),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF915FB5).withOpacity(1),
        onPressed: () => startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                const Color(0xFF915FB5),
                const Color(0xFFCA436B),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            transactionsList.isEmpty
                ? Container(
                    child: Column(
                      children: [
                        Chart(
                          recentTransactions: _recentTransactions,
                        ),
                        Text(
                          "No Transactions Added Here",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Container(
                            height: 200,
                            child: Image.asset(
                              'assets/images/waiting.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Chart(
                        recentTransactions: _recentTransactions,
                      ),
                      TransactionList(
                        deleteTransaction: deleteTransaction,
                        transactionsList: transactionsList,
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
