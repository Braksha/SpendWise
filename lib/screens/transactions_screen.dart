import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/application/transaction_cubit.dart';
import 'package:spendwise/application/transaction_state.dart';
import 'package:spendwise/comonents.dart/tranasaction_tile.dart';
import 'package:spendwise/models/transactions.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Change this color to the desired color
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          'Weekly Report',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 8);
              },
              itemCount: transactions.length,
              itemBuilder: (context, index) => TransactionTile(
                  name: transactions[index].name,
                  paid: transactions[index].paid,
                  type: transactions[index].type,
                  created: transactions[index].created,
                  index: index),
            ),
          );
        },
      ),
    );
  }
}
