import 'package:expensivesapp/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final List<Transactions> transactions;

  TransactionsList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child:
          transactions.isEmpty
              ? Column(
                children: [
                  Text('Nenhuma transação cadastrada'),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
              : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctnx, index) {
                  final tr = transactions[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('R\$${tr.value}'),
                          ),
                        )
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(
                        DateFormat('dd MMM y').format(tr.date),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
