

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

  final List<Transaction> _transactions = [];
  
  List<Transaction> get _recentTrasanctions {
    return _transactions .where((tr){
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));

    }).toList();
  }

   _addTrasaction(String title, double value, DateTime date){

    final newTransaction = Transaction(
      id: Random().nextDouble().toString(), 
      title: title, 
      value: value, 
      date: date,
      );
      setState(() {
        _transactions.add(newTransaction);

      });
      Navigator.of(context).pop();
  }
  _removeTransaction(String id){
    setState(() {
        _transactions.removeWhere((tr) => tr.id == id);
    });

  }
_openTransactionFormModel(BuildContext context){
  showModalBottomSheet(
    context: context,
     builder: (_) {
       return TransactionForm(_addTrasaction);

     },
     );
}

  @override
  Widget build(BuildContext context) {
    final appBar =  AppBar(
        title: const Text("Despesas Pessoais"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModel(context),
          )
          
        ],
        
        );

    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
         
          children: [
            Container(
              height: availableHeight * 0.3,
              child: Chart(_recentTrasanctions )
              ),

            Container(
              height: availableHeight * 0.7,

              child: TransactionList(_transactions,_removeTransaction)),
            
            
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
