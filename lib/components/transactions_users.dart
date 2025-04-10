import 'package:expensivesapp/components/transactions_forms.dart';
import 'package:expensivesapp/components/transactions_list.dart';
import 'package:expensivesapp/models/transactions.dart';
import 'package:flutter/material.dart';

class TransactionsUsers extends StatefulWidget {


  @override
  State<TransactionsUsers> createState() => _TransactionsUsersState();
}

class _TransactionsUsersState extends State<TransactionsUsers> {

    final _transactions = [
    Transactions(
      id: 't1',
      title: 'Tênis Nike AirForce',
      date: DateTime.now(),
      value: 220.85,
    ),
    Transactions(
      id: 't2',
      title: 'Macbook M1',
      date: DateTime.now(),
      value: 8500.85,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget>[
        TransactionsList(transactions: _transactions),
        TransactionsForms(),
      ],
    );
  }
}