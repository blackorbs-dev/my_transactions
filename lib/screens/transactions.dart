import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import 'filter_chips.dart';
import 'list_view.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text("My Transactions")),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  FilterChips(isWide: isWide),
                  const SizedBox(height: 16),
                  const Expanded(child: TransactionListView()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}