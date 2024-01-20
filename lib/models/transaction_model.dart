import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transaction {
  Transaction(
    this.name,
    this.paid,
    this.type,
  );

  String name;
  double paid;
  TransactionType type;
  DateTime created = DateTime.now();
}

class TransactionType {
  TransactionType(this.name, this.icon);
  String name;
  Icon icon;
}
