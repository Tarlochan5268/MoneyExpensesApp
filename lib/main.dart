import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:money_expenses_app/widgets/usertransactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense App",
      home: Homepage(),
    );
  }
}

//String titleInput;
//String amountInput;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
      ),
    );
  }
}

/*
return Card(
                      elevation: 5,
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    "\$${transactionObj.amount.toString()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              //color: Colors.green,
                              //width: 100,
                            ),
                            Expanded(
                              child: Container(
                                //color: Colors.yellow,
                                child: Column(
                                  children: [
                                    Text(
                                      "${transactionObj.title}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${transactionObj.date}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));

 */
