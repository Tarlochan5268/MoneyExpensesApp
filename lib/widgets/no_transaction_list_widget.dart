import 'package:flutter/material.dart';

class NoTransactionListWidget extends StatelessWidget {
  final double heightAssigned;

  NoTransactionListWidget({@required this.heightAssigned});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightAssigned,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.1,
              child: Center(
                child: Text(
                  "No Transactions Added Here",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.1,
            ),
            Center(
              child: Container(
                height: constraints.maxHeight * 0.7,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
