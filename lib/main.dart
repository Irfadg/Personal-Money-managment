import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_managment/db/categorydb/category_db_functions.dart';
import 'package:money_managment/model/category/categeroty_model.dart';
import 'package:money_managment/screens/home/home_screen.dart';

Future<void> main() async {
  final obj1 = CategoryDb();
  final obj2 = CategoryDb();

  print("COMPARE OBJECTS");
  print(obj1 == obj2);

  //Hive database using

  WidgetsFlutterBinding.ensureInitialized();
  //flutter cheaking all the plugin and packeges are ready for the project
  await Hive.initFlutter();

  //setup typeid:2 adapter
  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    //Hive registeration
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  ////setup typeid:1 adapter
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    //Hive registeration
    Hive.registerAdapter(CategoryModelAdapter());
  }
  //already registered
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
