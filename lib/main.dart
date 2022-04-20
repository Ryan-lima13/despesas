import 'package:despesas/model/Transaction.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
        
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
       
        children: [
          Container(
          
            child: Card(
              color: Colors.blue,
              child: Text("grafico"),
              elevation: 5,

            ),
          ),
          Column(
            children: _transactions.map((tr){
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                      ),
                      child: Text(
                        tr.value.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,

                        ),
                        ),
                        decoration: BoxDecoration(
                          border:  Border.all(
                            color: Colors.purple,
                            width: 2,

                            )
                          ),
                          padding: EdgeInsets.all(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                          ),
                        Text(
                          tr.date.toString(),
                          style: TextStyle(
                            color: Colors.grey
                          ),
                          )
                      ],
                    )
                  ]
                  ),
              );

            }).toList(),
           
          )
        ],
      )
    );
  }
}
