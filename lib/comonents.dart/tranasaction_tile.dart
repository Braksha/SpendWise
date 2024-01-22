import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/application/transaction_cubit.dart';
import 'package:spendwise/models/transaction_model.dart';

class TransactionTile extends StatelessWidget {
  final String name;
  final double paid;
  final TransactionType type;
  final DateTime created;
  final int index;
  const TransactionTile({
    super.key,
    required this.name,
    required this.paid,
    required this.type,
    required this.created,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 0.5,
              color: const Color.fromRGBO(189, 189, 189, 1),
            ),
            // color: Colors.lightBlue,
          ),
          child: type.icon,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${created.day} - ${created.month} - ${created.year}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          '$paid',
          style: TextStyle(
            // fontSize: 12,
            fontWeight: FontWeight.bold,
            color: type.name == 'Income' ? Colors.green : Colors.red,
          ),
        ),
        InkWell(
          onTap: () {
            context.read<TransactionBloc>().removeTransaction(index);
          },
          child: const Icon(
            Icons.delete,
            color: Colors.red,
            size: 24,
          ),
        )
      ],
    );
  }
}
