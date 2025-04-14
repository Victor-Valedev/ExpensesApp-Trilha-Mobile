import 'dart:math';
import 'package:expensivesapp/components/chart.dart';
import 'package:expensivesapp/components/transactions_forms.dart';
import 'package:expensivesapp/components/transactions_list.dart';
import 'package:expensivesapp/models/transactions.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  final ThemeData tema = ThemeData(
    fontFamily: 'RobotoSlab',
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      primary: Colors.blue,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: tema,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> _transactions = [
    Transactions(
      id: 't0',
      title: 'Conta antiga',
      date: DateTime.now().subtract(Duration(days: 33)),
      value: 220.85,
    ),
    Transactions(
      id: 't1',
      title: 'Tênis Nike AirForce',
      date: DateTime.now().subtract(Duration(days: 3)),
      value: 220.85,
    ),
    Transactions(
      id: 't2',
      title: 'Macbook M1',
      date: DateTime.now().subtract(Duration(days: 4)),
      value: 8500.85,
    ),
  ];

  List<Transactions> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ));
    }).toList();
  }

  void _addTransactions(String title, double value) {
    final newTransactions = Transactions(
      id: Random().nextDouble().toString(),
      title: title,
      date: DateTime.now(),
      value: value,
    );

    setState(() {
      _transactions.add(newTransactions);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionsForms(_addTransactions);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionsList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
