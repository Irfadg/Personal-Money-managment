import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_managment/model/category/categeroty_model.dart';

const HIVE_DB_NAME = 'category_database';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getCategory();
  Future<void> insertCategory(CategoryModel value);
  Future<void> deleteCategory(String categoryID);
}

class CategoryDb implements CategoryDbFunctions {
  ValueNotifier<List<CategoryModel>> incomeCategoryListNotifyer =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategoryListNotifyer =
      ValueNotifier([]);

//single tun creation
  CategoryDb._internal();
  static CategoryDb instance = CategoryDb._internal();
  factory CategoryDb() {
    return instance;
  }
//-------------
  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(HIVE_DB_NAME);
    await _categoryDB.put(value.id, value);
    refreshUi();
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(HIVE_DB_NAME);
    return _categoryDB.values.toList();
  }

  Future<void> refreshUi() async {
    final allCatgeoryget = await getCategory();
    incomeCategoryListNotifyer.value.clear();
    expenseCategoryListNotifyer.value.clear();
    await Future.forEach(
      allCatgeoryget,
      (CategoryModel category) {
        if (category.type == CategoryType.income) {
          incomeCategoryListNotifyer.value.add(category);
        } else {
          expenseCategoryListNotifyer.value.add(category);
        }
      },
    );

    incomeCategoryListNotifyer.notifyListeners();
    expenseCategoryListNotifyer.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String categoryID) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(HIVE_DB_NAME);
    await _categoryDB.delete(categoryID);
    refreshUi();
  }
}
