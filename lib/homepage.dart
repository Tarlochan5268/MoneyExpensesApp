import 'package:flutter/material.dart';
import 'dart:io';
import 'package:money_expenses_app/widgets/addtransactionbox.dart';
import 'package:money_expenses_app/widgets/chart.dart';
import 'package:money_expenses_app/widgets/transactionlist.dart';
import 'dart:ui';
import 'widgets/no_transaction_list_widget.dart';

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
  bool showChart = false;

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

  Widget _isLandscapeBuild(double heightCalculated) {
    return Column(
      children: [
        Container(
          height: heightCalculated * 0.1,
          padding: EdgeInsets.only(top: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Show Chart',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Switch.adaptive(
                activeColor: Colors.pink,
                value: showChart,
                onChanged: (bool value) {
                  setState(() {
                    showChart = value;
                  });
                },
              )
            ],
          ),
        ),
        (showChart)
            ? Container(
                height: heightCalculated * 0.6,
                child: Chart(
                  recentTransactions: _recentTransactions,
                ),
              )
            : (transactionsList.isNotEmpty)
                ? Container(
                    height: heightCalculated * 0.8,
                    child: TransactionList(
                      deleteTransaction: deleteTransaction,
                      transactionsList: transactionsList,
                    ),
                  )
                : NoTransactionListWidget(
                    heightAssigned: heightCalculated * 0.8,
                  ),
      ],
    );
  }

  Widget _isPotraitBuild(double heightCalculated) {
    return Column(
      children: [
        Container(
          height: heightCalculated * 0.25,
          child: Chart(
            recentTransactions: _recentTransactions,
          ),
        ),
        (transactionsList.isNotEmpty)
            ? Container(
                height: heightCalculated * 0.65,
                child: TransactionList(
                  deleteTransaction: deleteTransaction,
                  transactionsList: transactionsList,
                ),
              )
            : NoTransactionListWidget(
                heightAssigned: heightCalculated * 0.65,
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
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
    );
    final heightCalculated = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      appBar: appBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: (!Platform.isIOS)
          ? FloatingActionButton(
              backgroundColor: const Color(0xFF915FB5).withOpacity(1),
              onPressed: () => startAddNewTransaction(context),
              child: Icon(Icons.add),
            )
          : Container(),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (isLandscape)
                ? _isLandscapeBuild(heightCalculated)
                : _isPotraitBuild(heightCalculated),
          ],
        ),
      ),
    );
  }
}
