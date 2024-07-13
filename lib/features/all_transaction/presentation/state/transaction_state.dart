import 'package:expensetracker/features/all_transaction/data/model/transaction.dart';
import 'package:expensetracker/features/all_transaction/data/repository/transaction_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';


final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  final transactionBox = Hive.box<Transaction>('transactions');
  return TransactionRepository(transactionBox);
});

final transactionListProvider = StateNotifierProvider<TransactionListNotifier, List<Transaction>>((ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return TransactionListNotifier(repository);
});

class TransactionListNotifier extends StateNotifier<List<Transaction>> {
  final TransactionRepository repository;

  TransactionListNotifier(this.repository) : super(repository.getAllTransactions());

  void addTransaction(Transaction transaction) {
    repository.addTransaction(transaction);
    state = repository.getAllTransactions();
  }

  void deleteTransaction(int index) {
    repository.deleteTransaction(index);
    state = repository.getAllTransactions();
  }
}
