import 'package:flutter/material.dart';
import 'package:money_expenses_app/widgets/addtransactionbox.dart';
import 'package:money_expenses_app/widgets/usertransactions.dart';
import 'dart:ui';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

void startAddNewTransaction(BuildContext buildContext) {
  showBottomSheet(
      context: buildContext,
      builder: (context) {
        return AddTransactionBox();
      });
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCA436B).withOpacity(0.9),
        title: Center(
            child: Text(
          "Expenses App",
        )),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF915FB5).withOpacity(1),
        onPressed: () {},
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
            UserTransactionsUpdate(),
          ],
        ),
      ),
    );
  }
}
