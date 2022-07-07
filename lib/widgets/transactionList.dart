// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../models/transactions.dart';

// class TransactionList extends StatelessWidget {
//   final List<Transactions> transactions;

//   TransactionList(this.transactions);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 520,
//       child: ListView(
//         children: transactions.map((tx) {
//           return Card(
//             child: Row(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                     vertical: 15,
//                   ),
//                   decoration: BoxDecoration(
//                       border:
//                           Border.all(color: Colors.deepPurpleAccent, width: 2)),
//                   padding: const EdgeInsets.all(5),
//                   child: Text(
//                     '\$ ${tx.amount}',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Colors.purple),
//                   ),
//                 ),
//                 Column(
//                   // mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,

//                   children: [
//                     Text(
//                       tx.title,
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       DateFormat.yMMMd().format(tx.date),
//                       // tx.date.toString(),
//                       style: TextStyle(color: Colors.purple[600], fontSize: 15),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// (Another way to do this using ListView.builder())

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../models/transactions.dart';

// class TransactionList extends StatelessWidget {
//   final List<Transactions> transactions;

//   TransactionList(this.transactions);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 660,
//       child: transactions.isEmpty
//           ? Column(
//               children: [
//                 Text(
//                   'No Transactions added yet',
//                   style: Theme.of(context).textTheme.subtitle1,
//                 ),
//                 SizedBox(
//                   height: 100,
//                 ),
//                 Container(
//                   height: 500,
//                   child: Image.asset(
//                     'assets/images/waiting.png',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             )
//           : ListView.builder(
//               itemBuilder: (ctx, index) {
//                 return Card(
//                   child: Row(
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.symmetric(
//                           horizontal: 15,
//                           vertical: 15,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Colors.deepPurpleAccent, width: 2),
//                         ),
//                         padding: const EdgeInsets.all(5),
//                         child: Text(
//                           '\₹ ${transactions[index].amount.toStringAsFixed(2)}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Colors.purple),
//                         ),
//                       ),
//                       Column(
//                         // mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,

//                         children: [
//                           Text(
//                             transactions[index].title,
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             DateFormat.yMMMd().format(transactions[index].date),
//                             // tx.date.toString(),
//                             style: TextStyle(
//                                 color: Colors.purple[600], fontSize: 15),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 );
//               },
//               itemCount: transactions.length,
//               // children: transactions.map((tx) {
//             ),
//     );
//   }
// }

//Another way to do this

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 660,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions added yet',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 500,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.all(6),
                  child: ListTile(
                    // style: ListTileStyle(Color: Colors.amber),
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '₹ ${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      '${transactions[index].title}',
                    ),
                    subtitle: Text(
                        '${DateFormat.yMMMd().format(transactions[index].date)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        deleteTx(transactions[index].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
              // children: transactions.map((tx) {
            ),
    );
  }
}
