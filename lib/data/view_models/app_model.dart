import 'package:budgetsika/data/models/expense.dart';
import 'package:budgetsika/data/models/category.dart' as c;
import 'package:flutter/foundation.dart';

abstract class ABSAppModel extends ChangeNotifier{

  double _monthlyBudget = 0.0;

  List<Expense> _expenses;
  List<Expense> get expenses => _expenses;

  List<c.Category> _categories;
  List<c.Category> get categories => _categories;
  double get monthlyBudget => _monthlyBudget;

  set monthlyBudget(double value);
  set expenses(List<Expense> value);
  set categories(List<c.Category> value);
}

class AppModel extends ABSAppModel{

  @override
  set monthlyBudget(double value) {
    _monthlyBudget = value;
    notifyListeners();
  }

  @override
  set expenses(List<Expense> value) {
    _expenses = value;
    notifyListeners();
  }

  @override
  set categories(List<c.Category> value) {
    _categories = value;
    notifyListeners();
  }

}