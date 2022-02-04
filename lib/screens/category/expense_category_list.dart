import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemBuilder: (ctx, index) {
        return Card(
          child: ListTile(
            title: Text("Expense catyegopry $index"),
            trailing: IconButton(onPressed: (){},
             icon: Icon(Icons.delete)),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return SizedBox(
          height: 10,
        );
      },
      itemCount: 50,
    );
  }
}
