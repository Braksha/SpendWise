import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/application/transaction_cubit.dart';
import 'package:spendwise/application/transaction_state.dart';
import 'package:spendwise/comonents.dart/tranasaction_tile.dart';
import 'package:spendwise/models/transaction_model.dart';
import 'package:spendwise/models/transactions.dart';
import 'package:spendwise/screens/another_screen.dart';
import 'package:spendwise/screens/transactions_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 150,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                SizedBox(height: 24),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                Text(
                  '$totalBalance LD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: const Color.fromRGBO(189, 189, 189, 1),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_circle_down_outlined,
                          color: Colors.green,
                          size: 50,
                        ),
                        Text(
                          "Income",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "${thisMonthIncomes()} LD",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: const Color.fromRGBO(189, 189, 189, 1),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_circle_up_outlined,
                          color: Colors.red,
                          size: 50,
                        ),
                        Text(
                          "Expense",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "${thisMonthOutcomes()} LD",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),

              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              // width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Transactions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransactionsScreen()),
                          );
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<TransactionBloc, TransactionState>(
                    builder: (context, state) {
                      return Expanded(
                        child: state.transactions.isNotEmpty
                            ? ListView.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(height: 8);
                                },
                                itemCount: state.transactions.length,
                                itemBuilder: (context, index) =>
                                    TransactionTile(
                                  name: state.transactions[index].name,
                                  paid: state.transactions[index].paid,
                                  type: state.transactions[index].type,
                                  created: state.transactions[index].created,
                                  index: index,
                                ),
                              )
                            : Center(child: Text('Empty')),
                      ); // <-- Added the missing semicolon here
                    },
                  ),
                ],
              ),
            ),
          ),
          //
        ],
      ),
    );
  }
}
