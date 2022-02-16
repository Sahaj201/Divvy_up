import 'package:flutter/material.dart';

class Expense {
  Expense({
    required this.expenseName,
    required this.expenseID,
    required this.category,
    required this.expense,
    required this.friends,
    required this.paid,
  });
  int expenseID;
  int category;
  String expenseName;
  int expense;
  int friends;
  String paid;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> expenseAsMap = {
      "expenseID": expenseID,
      "expenseName": expenseName,
      "category": category,
      "expenses": expense,
      "friends": friends,
      "paid": paid,
    };
    return (expenseAsMap);
  }

  static Expense fromMap(Map<String, dynamic> expenseAsMap) {
    print("from map");
    Expense expense = Expense(
        expenseName: expenseAsMap["expenseName"],
        expenseID: expenseAsMap["expenseID"],
        category: expenseAsMap["category"],
        expense: expenseAsMap["expenses"],
        friends: expenseAsMap["friends"],
        paid: expenseAsMap["paid"]);
    return (expense);
  }
}
