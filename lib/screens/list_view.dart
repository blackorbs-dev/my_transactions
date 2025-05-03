import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../bloc/state.dart';
import '../models/transaction.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: state.transactions.isEmpty
              ? Center(
            key: const ValueKey("empty"),
            child: Text(
              "No transactions found.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ) : ImplicitlyAnimatedList(
              items: state.transactions,
              itemBuilder: (_, anim, tx, i) => item(tx, anim),
              areItemsTheSame: (a, b) => a.id == b.id,
              insertDuration: const Duration(milliseconds: 400),
              removeDuration: const Duration(milliseconds: 400),
              updateDuration: const Duration(milliseconds: 400)
          )
        );
      },
    );
  }

  Widget item(Transaction tx, Animation<double> animation) =>
      SizeFadeTransition(
        animation: animation,
        child: Card(
          child: ListTile(
            title: Text(tx.amount),
            subtitle: Text(tx.date),
            trailing: Text(
              tx.status.name.toUpperCase(),
              style: TextStyle(
                color: _statusColor(tx.status),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  Color _statusColor(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.pending:
        return Colors.orange;
      case TransactionStatus.failed:
        return Colors.red;
      default:
        return Colors.green;
    }
  }
}
