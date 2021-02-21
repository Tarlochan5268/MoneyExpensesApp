import 'package:flutter/material.dart';

import 'homepage.dart';

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
