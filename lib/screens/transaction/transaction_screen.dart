import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.all(10),
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 50,
                child: Text("12\nDec",
                textAlign: TextAlign.center,),
                ),
              title: Text("100000"),
              subtitle: Text("Food"),
              trailing: Text("+"),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: 10);
  }
}
