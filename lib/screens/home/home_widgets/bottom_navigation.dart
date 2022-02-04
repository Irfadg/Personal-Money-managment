import 'package:flutter/material.dart';
import 'package:money_managment/screens/home/home_screen.dart';

class MoneyManagmentBottomNavigation extends StatelessWidget {
  const MoneyManagmentBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HomeScreen.selectedIndexNotifier,
      builder: (BuildContext ctx, int updatedindex,   Widget? _) {
        return BottomNavigationBar(
          selectedItemColor: Colors.redAccent[700],
          unselectedItemColor: Colors.grey[900],
            currentIndex: updatedindex,
            onTap: (newindex) {
              HomeScreen.selectedIndexNotifier.value = newindex;
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.money),
                label: 'Transaction',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categorys',
              )
            ]);
      },
    );
  }
}
