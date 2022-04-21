import 'package:despesas/components/transaction_form.dart';
import 'package:despesas/components/transaction_list.dart';
import 'package:despesas/components/transaction_user.dart';
import 'package:despesas/model/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main(){
  runApp(Home());
  
}

class Home extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Despesas(),
    );
  }
}
class Despesas extends StatelessWidget {

   
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
        
        ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
       
        children: [
          Container(
          
            child: Card(
              color: Colors.blue,
              child: Text("grafico"),
              elevation: 5,

            ),
          ),
         TransactionUser()
          
        ],
      )
    );
  }
}
