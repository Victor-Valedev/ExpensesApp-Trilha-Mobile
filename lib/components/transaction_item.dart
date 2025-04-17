import 'package:expensivesapp/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  final Transactions tr;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('R\$${tr.value}')),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(DateFormat('dd MMM y').format(tr.date)),
        trailing: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder:
                  (ctnx) => AlertDialog(
                    title: Text('Excluir transação'),
                    content: Text(
                      'Tem certeza que deseja excluir essa transação?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctnx).pop(),
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          onRemove((tr.id));
                          Navigator.of(ctnx).pop();
                        },
                        child: Text('Excluir'),
                      ),
                    ],
                  ),
            );
          }, //() => onRemove(tr.id),
          color: Colors.red,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}