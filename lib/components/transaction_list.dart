import 'package:despesas/model/Transaction.dart';
import 'package:flutter/material.dart';
import '../model/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  late final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty ?Column(
        children: [
          SizedBox(height: 20,),
          Text(
            'Nenhuma Transação cadastrada',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 20,),
          Container(
            height: 200,
            child: Image.asset('images/waiting.png',
            fit: BoxFit.cover,
            )
            ),
        ],
      ) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (contx,index){
          final tr = transactions[index];
          return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10
                        ),
                        child: Text(
                         'R\$ ${tr.value.toStringAsFixed(2)}',
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
                            DateFormat(' d MMM y').format(tr.date),
                            style: TextStyle(
                              color: Colors.grey
                            ),
                            )
                        ],
                      )
                    ]
                    ),
                );

        },
              
             
            ),
    );
  }
}
