import 'package:despesas/components/transaction_form.dart';
import 'package:despesas/components/transaction_list.dart';

import 'package:despesas/model/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/Transaction.dart';
import 'dart:math';

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

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tenis de corrida', 
      value: 310.0,
       date: DateTime.now()
      ),
      Transaction(
      id: 't2',
      title: 'Conta luz', 
      value: 211.30,
       date: DateTime.now()
      ),


  ];
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
            Container(
            
              child: Card(
                color: Colors.blue,
                child: Text("grafico"),
                elevation: 5,
      
              ),
            ),
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
