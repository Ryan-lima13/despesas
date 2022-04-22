

import 'package:despesas/components/transaction_form.dart';
import 'package:despesas/components/transaction_list.dart';

import './model/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/Transaction.dart';
import 'dart:math';
import 'components/Chart.dart';

void main(){
  runApp(Home());
  
}

class Home extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        
      ),
      home: Despesas(),
      
    );
  }
}
class Despesas extends StatefulWidget {

  @override
  State<Despesas> createState() => _DespesasState();
}

class _DespesasState extends State<Despesas> {

  final List<Transaction> _transactions = [
    Transaction(
      id: 't0',
      title: 'Conta antiga', 
      value: 400.0,
       date: DateTime.now().subtract(Duration(days:33))
    ),
    Transaction(
      id: 't1',
      title: 'tenis', 
      value: 400.0,
       date: DateTime.now().subtract(Duration(days:3))
    ),
      Transaction(
      id: 't2',
      title: 'Conta luz', 
     value: 211.30,
      date: DateTime.now().subtract(Duration(days:4))
      ),


  ];
  List<Transaction> get _recentTrasanctions {
    return _transactions .where((tr){
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));

    }).toList();
  }

   _addTrasaction(String title, double value){

    final newTransaction = Transaction(
      id: Random().nextDouble().toString(), 
      title: title, 
      value: value, 
      date: DateTime.now()
      );
      setState(() {
        _transactions.add(newTransaction);

      });
      Navigator.of(context).pop();
  }
_openTransactionFormModel(BuildContext context){
  showModalBottomSheet(
    context: context,
     builder: (_) {
       return TransactionForm(_addTrasaction);

     }
     );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModel(context),
          )
          
        ],
        
        ),
      body: SingleChildScrollView(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
         
          children: [
            Chart(_recentTrasanctions ),

            TransactionList(_transactions),
            
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModel(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
