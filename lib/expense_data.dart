import 'package:divvyup/expense.dart';
import 'package:divvyup/sqlite.dart';
import 'package:flutter/cupertino.dart';
import 'expense.dart';

class ExpenseData extends ChangeNotifier {
  Map<String, double> dataMap = {
    "Food": 0,
    "Shopping": 0,
    "Bills": 0,
    "Others": 0,
  };
  List<dynamic> allExpense = [];
  double totalExpense = 0;

  ExpenseData() {
    initExpenseData();
  }

  void initExpenseData() async {
    allExpense = await SqliteDB.getAllExpense();
    for (var i in allExpense) {
      totalExpense = totalExpense + i.expense;
      if (i.category == 1) {
        dataMap["Food"] = (dataMap["Food"]! + i.expense);
      } else if (i.category == 2) {
        dataMap["Shopping"] = (dataMap["Shopping"]! + i.expense);
      } else if (i.category == 3) {
        dataMap["Bills"] = (dataMap["Bills"]! + i.expense);
      } else {
        dataMap["Others"] = (dataMap["Others"]! + i.expense);
      }
      notifyListeners();
    }
  }

  void addExpense(expense) async {
    var expenseAsMap = expense.toMap();
    print(expense);
    expenseAsMap.remove("expenseID");
    int? id = await SqliteDB.insertExpense(expenseAsMap);
    if (id == null) {
      print("could not insert into database");
    } else {
      expense.expenseID = id;
      totalExpense = totalExpense + expense.expense;
      if (expense.category == 1) {
        dataMap["Food"] = (dataMap["Food"]! + expense.expense);
      } else if (expense.category == 2) {
        dataMap["Shopping"] = (dataMap["Shopping"]! + expense.expense);
      } else if (expense.category == 3) {
        dataMap["Bills"] = (dataMap["Bills"]! + expense.expense);
      } else {
        dataMap["Others"] = (dataMap["Others"]! + expense.expense);
      }
      notifyListeners();
    }
  }
}
