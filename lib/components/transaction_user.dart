import 'dart:math';

import 'package:flutter/material.dart';

import '../model/Transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
class TransactionUser extends StatefulWidget {
 

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(_addTrasaction),

      ],
      
    );
  }
}