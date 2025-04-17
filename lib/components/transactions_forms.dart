import 'package:expensivesapp/components/adaptative_button.dart';
import 'package:expensivesapp/components/adaptative_date_picker.dart';
import 'package:expensivesapp/components/adaptative_text_fields.dart';
import 'package:flutter/material.dart';

class TransactionsForms extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionsForms(this.onSubmit);

  @override
  State<TransactionsForms> createState() => _TransactionsFormsState();
}

class _TransactionsFormsState extends State<TransactionsForms> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate;

  _submitForms() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate!);
  }

  final keyboardTypeNumber = TextInputType.numberWithOptions(decimal: true);

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
              AdaptativeTextFields(
                controller: _titleController,
                label: 'Título',
                onSubmitForms: (_) => _submitForms(),
              ),
              AdaptativeTextFields(
                controller: _valueController,
                label: 'Valor R\$',
                onSubmitForms: (_) => _submitForms(),
                keyboardType: keyboardTypeNumber,
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              SizedBox(height: 10),
              AdaptativeButton(
                label: 'Nova Transação',
                onPressed: _submitForms,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
