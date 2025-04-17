import 'package:expensivesapp/components/adaptative_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsForms extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionsForms(this.onSubmit);

  @override
  State<TransactionsForms> createState() => _TransactionsFormsState();
}

class _TransactionsFormsState extends State<TransactionsForms> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForms() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null)  {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForms(),
                decoration: InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: _valueController,
                onSubmitted: (_) => _submitForms(),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Valor (R\$)'),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null ? 'Nenhuma data selecionada!'
                        : 'Data selecionada: ${DateFormat('dd/MM/y').format(_selectedDate!)}'
                      ),
                    ),
                    TextButton(
                      child: Text('Selecionar data'),
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: _showDatePicker,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              AdaptativeButton(label: 'Nova Transação', onPressed: _submitForms)
            ],
          ),
        ),
      ),
    );
  }
}
