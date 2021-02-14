import 'package:flutter/material.dart';
import 'transaction.dart';
import 'glassMorphism.dart';

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

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Transaction> transactionsList = [
    Transaction(id: "T1", title: "Apples", amount: 3, date: DateTime.now()),
    Transaction(id: "T2", title: "Milk", amount: 7, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              width: double.infinity,
              height: 30,
              child: Card(
                color: Colors.grey,
                elevation: 5,
                child: Text(
                  "CHART",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              child: Column(
                children: transactionsList.map((transactionObj) {
                  return GlassTile(
                      id: transactionObj.id,
                      title: transactionObj.title,
                      amount: transactionObj.amount,
                      date: transactionObj.date);
                }).toList(),
              ),
            )
          ],
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
