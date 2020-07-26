import 'package:flutter/material.dart';
import './transaction_item.dart';
import '../models/transaction_model.dart';


class TransactionList extends StatelessWidget {
  final List<TransactionModel> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constrainsts) {
              return Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    'Nenhuma Transação Cadastrada',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: constrainsts.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : 
        ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(tr),
                 tr: tr, 
                 onRemove: onRemove,
              );
            },
          );
        //ListView(
        //  children: transactions.map((tr) {
        //    return TransactionItem(
        //      key: ValueKey(tr.id),
        //      tr: tr, 
        //      onRemove: onRemove,
        //      );
        //  }).toList(),
        //);
  }
}

