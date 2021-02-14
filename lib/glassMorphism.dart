import 'dart:ui';

import 'package:flutter/material.dart';

class GlassTile extends StatefulWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  GlassTile(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
  @override
  _GlassTileState createState() => _GlassTileState(
      id: this.id, title: this.title, amount: this.amount, date: this.date);
}

class _GlassTileState extends State<GlassTile> {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  _GlassTileState(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 2,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 1.5,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
              child: Container(
                color: Colors.white.withOpacity(0.09),
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
                            "\$$amount",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ],
                            color: const Color(0xFFCA436B).withOpacity(1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: Colors.white.withOpacity(0.2),
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
                              "$title",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "$date",
                              style: TextStyle(
                                color: Colors.white,
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
              )),
        ),
      ),
    );
  }
}
