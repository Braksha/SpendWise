import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/application/transaction_cubit.dart';
import 'package:spendwise/application/transaction_state.dart';
import 'package:spendwise/comonents.dart/nav_bar.dart';
import 'package:spendwise/models/transactions.dart';
import 'package:spendwise/screens/home_screen.dart';
import 'package:spendwise/screens/report_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransactionBloc(
            TransactionState(
              transactions: transactions,
            ),
          ),
        ),
      ],
      child: MaterialApp(
        home: NavBar(),
      ),
    ),
  );
}
