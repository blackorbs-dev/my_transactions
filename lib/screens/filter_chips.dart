import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';
import '../models/transaction.dart';

class FilterChips extends StatelessWidget {
  final bool isWide;
  const FilterChips({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TransactionBloc>();

    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {

        final chips = TransactionStatus.values.map((e) {
          return ChoiceChip(
            label: Text(e.titleCase()),
            selected: e == state.selectedFilter,
            onSelected: (_) => bloc.add(FilterTransactions(e)),
          );
        });

        return isWide ? Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: chips.map((chip) => Padding(
            padding: const EdgeInsets.only(right: 12),
            child: chip,
          )).toList(),
        ) : Wrap(
          spacing: 12,
          runSpacing: 8,
          children: chips.toList()
        );

      }
    );
  }
}