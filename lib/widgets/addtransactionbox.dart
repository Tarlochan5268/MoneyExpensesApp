import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:intl/intl.dart';

class AddTransactionBox extends StatefulWidget {
  final Function addTransactionFunction;
  AddTransactionBox({this.addTransactionFunction});

  @override
  _AddTransactionBoxState createState() => _AddTransactionBoxState();
}

class _AddTransactionBoxState extends State<AddTransactionBox> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate;
  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }
    widget.addTransactionFunction(enteredTitle, enteredAmount, selectedDate);
    titleController.clear();
    amountController.clear();
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((datePicked) {
      if (datePicked == null) {
        return;
      }
      setState(() {
        selectedDate = datePicked;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        height: 260,
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
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate == null
                          ? 'No Date Selected'
                          : 'Selected Date: ${DateFormat().add_yMd().format(selectedDate)}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    FlatButton(
                      shape: new RoundedRectangleBorder(
                        side: new BorderSide(
                            color: Colors.white.withOpacity(0.2)),
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      color: Colors.white.withOpacity(0.2),
                      child: Text(
                        "Select Date",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      onPressed: presentDatePicker,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              FlatButton(
                shape: new RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.white.withOpacity(0.3)),
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
