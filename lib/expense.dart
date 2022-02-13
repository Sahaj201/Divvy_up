import 'package:flutter/material.dart';

class Expense {
  Expense({
    required this.expenseName,
    required this.expenseID,
    required this.category,
    required this.expense,
  });
  int expenseID;
  int category;
  String expenseName;
  int expense;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> expenseAsMap = {
      "expenseID": expenseID,
      "expenseName": expenseName,
      "category": category,
      "expenses": expense
    };
    return (expenseAsMap);
  }

  static Expense fromMap(Map<String, dynamic> expenseAsMap) {
    print("from map");
    Expense expense = Expense(
        expenseName: expenseAsMap["expenseName"],
        expenseID: expenseAsMap["expenseID"],
        category: expenseAsMap["category"],
        expense: expenseAsMap["expenses"]);
    return (expense);
  }
}
