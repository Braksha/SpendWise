import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/application/transaction_cubit.dart';
import 'package:spendwise/models/transaction_model.dart';
import 'package:spendwise/models/transactions.dart';

class NewTransactionScreen extends StatefulWidget {
  @override
  _NewTransactionScreenState createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TransactionType? transactionType;

  bool isFormFilled() {
    return nameController.text.isNotEmpty &&
        paidController.text.isNotEmpty &&
        transactionType != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('New Transaction',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total Balance',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              '${context.watch<TransactionBloc>().totalBalance} LD',
              style: TextStyle(fontSize: 75, color: Colors.blue),
            ),
            SizedBox(height: 64),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Transaction Name',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                    // borderSide: BorderSide(color: Colors.black38),
                    ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  width: 190,
                  height: 200,
                  child: TextField(
                    controller: paidController,
                    decoration: InputDecoration(
                      labelText: 'Paid Amount',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Spacer(),
                // SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 200,
                  child: DropdownButtonFormField<TransactionType>(
                    value: transactionType,
                    onChanged: (value) {
                      setState(() {
                        transactionType = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Paid Type',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                    ),
                    items: types.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Row(
                          children: [
                            type.icon,
                            Text(type.name),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: isFormFilled()
                    ? () {

                        context
                            .read<TransactionBloc>()
                            .addTransaction(double.parse(paidController.text),transactionType!,transactionType!.name);
                      }
                    : null,
                child: const Text(
                  'Add A New Transaction',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    paidController.dispose();
    super.dispose();
  }
}

