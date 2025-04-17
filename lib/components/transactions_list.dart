import 'package:expensivesapp/components/transaction_item.dart';
import 'package:expensivesapp/models/transactions.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final List<Transactions> transactions;
  final void Function(String) onRemove;

  TransactionsList({required this.transactions, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
          builder: (ctx, constraints) {
            return Column(
              children: [
                SizedBox(height: 20),
                Text('Nenhuma transação cadastrada'),
                SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          },
        )
        : ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctnx, index) {
            final tr = transactions[index];
            return TransactionItem(tr: tr, onRemove: onRemove);
          },
        );
  }
}


