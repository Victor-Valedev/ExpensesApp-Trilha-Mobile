import 'package:expensivesapp/models/transactions.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(title: Text('Despesas Pessoais')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.lightBlue,
              child: Text('Gráfico Widget'),
              elevation: 5,
            ),
          ),
          Column(
            children:
                _transactions.map((tr) {
                  return Card(
                    child: Row(
                      children: <Widget> [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2
                            )
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            tr.value.toString()
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(tr.title),
                            Text(tr.date.toString())
                          ],
                        )
                      ],
                    )
               );
             }).toList(),
          ),
        ],
      ),
    );
  }
}
