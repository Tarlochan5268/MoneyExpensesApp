import 'package:flutter/material.dart';
import 'dart:ui';

class AddTransactionBox extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransactionFunction;
  AddTransactionBox({this.addTransactionFunction});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          margin: EdgeInsets.all(25),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Enter Title"),
                  /*onChanged: (value) {
                            titleInput = value;
                          },*/
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Enter Amount"),
                  controller: amountController,
                  /*onChanged: (value) {
                            amountInput = value;
                          },*/
                ),
                SizedBox(
                  height: 5,
                ),
                FlatButton(
                  shape: new RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.white.withOpacity(0.2)),
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  color: Colors.white.withOpacity(0.3),
                  child: Text("Add Transaction"),
                  onPressed: () {
                    addTransactionFunction(titleController.text,
                        double.parse(amountController.text));
                    titleController.clear();
                    amountController.clear();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

setState(() {
                        transactionsList.add(new Transaction(
                            id: "T${transactionsList.length + 1}",
                            title: titleController.text,
                            amount: double.parse(amountController.text),
                            date: DateTime.now()));
                      });

 */
