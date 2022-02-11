import 'package:flutter/material.dart';
import 'package:money_managment/db/categorydb/category_db_functions.dart';
import 'package:money_managment/model/category/categeroty_model.dart';

class IncomeList extends StatelessWidget {
  const IncomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return ValueListenableBuilder(
      valueListenable: CategoryDb().incomeCategoryListNotifyer,
      builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
        return ListView.separated(
          padding: EdgeInsets.all(10),
          itemBuilder: (ctx, index) {
            final category = newList[index];
            return Card(
              child: ListTile(
                title: Text(category.name),
                trailing:
                    IconButton(onPressed: () {
                      CategoryDb.instance.deleteCategory(category.id);
                    }, icon: Icon(Icons.delete)),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: newList.length,
        );
      },
    );
  }
}
