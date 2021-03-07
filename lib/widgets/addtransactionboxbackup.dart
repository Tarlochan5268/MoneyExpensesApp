import 'package:flutter/material.dart';
import 'dart:ui';

class AddTransactionBoxBackup extends StatefulWidget {
  final Function addTransactionFunction;
  AddTransactionBoxBackup({this.addTransactionFunction});

  @override
  _AddTransactionBoxState createState() => _AddTransactionBoxState();
}

class _AddTransactionBoxState extends State<AddTransactionBoxBackup> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTransactionFunction(enteredTitle, enteredAmount);
    titleController.clear();
    amountController.clear();
    Navigator.of(context).pop();
  }

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
                  onSubmitted: (_) => submitData(),
                  /*onChanged: (value) {
                            titleInput = value;
                          },*/
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Enter Amount"),
                  controller: amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => submitData(),
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
                  onPressed: submitData,
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
