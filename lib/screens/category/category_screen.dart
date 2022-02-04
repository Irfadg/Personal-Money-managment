import 'package:flutter/material.dart';
import 'package:money_managment/screens/category/expense_category_list.dart';
import 'package:money_managment/screens/category/income_category_list.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    _tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            controller: _tabcontroller,
            tabs: [
              Tab(
                text: 'INCOME',
              ),
              Tab(
                text: 'EXPENSES',
              )
            ]),
        Expanded(
          child: TabBarView(
            controller:_tabcontroller,
            children: [
              
              IncomeList(), 
              ExpenseList(),
            
            ],
          ),
        )
      ],
    );
  }
}
