//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_managment/db/categorydb/category_db_functions.dart';
import 'package:money_managment/model/category/categeroty_model.dart';

ValueNotifier<CategoryType> selectedCatgoryNotifyer =
    ValueNotifier(CategoryType.income);

final _nameEditingController = TextEditingController();

Future<void> CatgoryAddPopUp(BuildContext context) async {
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: Text("Add Category"),
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _nameEditingController,
                decoration: InputDecoration(
                  hintText: 'category name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  RadioButten(title: 'Incom', type: CategoryType.income),
                  RadioButten(title: 'Expenses', type: CategoryType.expense),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    final _type = selectedCatgoryNotifyer.value;
                    final _name = _nameEditingController.text;
                    if (_name.isEmpty) {
                      return;
                    }
                    final _category = CategoryModel(
                        id: DateTime.now().microsecondsSinceEpoch.toString(),
                        name: _name,
                        type: _type);
                    CategoryDb().insertCategory(_category);
                    Navigator.of(ctx).pop();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  child: Text("Add")),
            ),
          ],
        );
      });
}

class RadioButten extends StatelessWidget {
  final String title;
  final CategoryType type;
  RadioButten({Key? key, required this.title, required this.type})
      : super(key: key);

  CategoryType? _type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selectedCatgoryNotifyer,
            builder: (BuildContext context, CategoryType newCategoryType,
                Widget? _) {
              return Radio<CategoryType>(
                  value: type,
                  groupValue: newCategoryType,
                  onChanged: (Value) {
                    if (Value == null) {
                      return;
                    }
                    selectedCatgoryNotifyer.value = Value;
                    selectedCatgoryNotifyer.notifyListeners();
                  });
            }),
        Text(title)
      ],
    );
  }
}
