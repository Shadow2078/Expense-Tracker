import 'package:flutter_riverpod/flutter_riverpod.dart';

final financialStateProvider = StateNotifierProvider<FinancialStateNotifier, FinancialState>(
  (ref) => FinancialStateNotifier(),
);

class FinancialState {
  final double income;
  final double expenses;
  final double balance;

  FinancialState({
    this.income = 10000,
    this.expenses = 2000,
    this.balance = 8000, // Default balance can be computed as income - expenses
  });

  FinancialState copyWith({
    double? income,
    double? expenses,
    double? balance,
  }) {
    return FinancialState(
      income: income ?? this.income,
      expenses: expenses ?? this.expenses,
      balance: balance ?? (income ?? this.income) - (expenses ?? this.expenses),
    );
  }
}

class FinancialStateNotifier extends StateNotifier<FinancialState> {
  FinancialStateNotifier() : super(FinancialState());

  void updateIncome(double newIncome) {
    state = state.copyWith(income: newIncome);
  }

  void updateExpenses(double newExpenses) {
    state = state.copyWith(expenses: newExpenses);
  }
}
