import 'package:flutter/material.dart';

class TransactionsForms extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionsForms(this.onSubmit);

  @override
  State<TransactionsForms> createState() => _TransactionsFormsState();
}

class _TransactionsFormsState extends State<TransactionsForms> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForms() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForms(),
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: valueController,
              onSubmitted: (_) => _submitForms(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitForms,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: Text(
                'Nova Transação',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
