import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import './TransactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Transactions, start adding some!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 30),
                Container(
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                  height: constraints.maxHeight * 0.6,
                ),
              ],
            );
          })
        : ListView(
            children: <Widget>[
              ...transactions
                  .map((tx) => TransactionItem(
                        key: ValueKey(tx.id),
                        transaction: tx,
                        deleteTx: deleteTx,
                      ))
                  .toList(),
            ],
          );
  }
}
