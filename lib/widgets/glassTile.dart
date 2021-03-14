import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:money_expenses_app/homepage.dart';

class GlassTile extends StatelessWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Function deleteTransaction;

  GlassTile({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
    this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1.5,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
              child: Container(
                color: Colors.white.withOpacity(0.09),
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
                            "\$${amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFCA436B).withOpacity(1),
                            //color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: Colors.white.withOpacity(0.5),
                            ),
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
                              "${title}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${DateFormat.yMMMd().format(date)}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ),
                    (MediaQuery.of(context).size.width > 460)
                        ? TextButton.icon(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.deepPurple.withOpacity(0.7),
                            ),
                            onPressed: () {
                              deleteTransaction(id);
                            },
                            label: Text(
                              "Delete",
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.deepPurple.withOpacity(0.7),
                            onPressed: () {
                              deleteTransaction(id);
                            },
                          ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
