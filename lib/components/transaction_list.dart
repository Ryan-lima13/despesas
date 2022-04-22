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
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('R\$${tr.value}')),
                ),
              ),
              title: Text(
                tr.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
                
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(tr.date),
              ),
              
            ),
          );

        },
              
             
            ),
    );
  }
}
