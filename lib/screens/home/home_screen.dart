import 'package:flutter/material.dart';
import 'package:money_managment/db/categorydb/category_db_functions.dart';
import 'package:money_managment/model/category/categeroty_model.dart';
import 'package:money_managment/screens/category/addCategoryPopup.dart';
import 'package:money_managment/screens/category/category_screen.dart';
import 'package:money_managment/screens/home/home_widgets/bottom_navigation.dart';
import 'package:money_managment/screens/transaction/transaction_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = [TransactionScreen(), CategoryScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("MONEY MANAGER"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: const MoneyManagmentBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (BuildContext context, int updatedindex, _) {
              return _pages[updatedindex];
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print("transaction selected");
          } else {
            /*
            final sample = CategoryModel(
                id: DateTime.now().microsecondsSinceEpoch.toString(),
                name: 'salary',
                type: CategoryType.income);
            CategoryDb().insertCategory(sample); 
             */
            CatgoryAddPopUp(context);

            print("category selected");
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
