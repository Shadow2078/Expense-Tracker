import 'package:expensetracker/features/all_transaction/data/model/transaction.dart';
import 'package:hive/hive.dart';


class TransactionRepository {
  final Box<Transaction> transactionBox;

  TransactionRepository(this.transactionBox);

  List<Transaction> getAllTransactions() {
    return transactionBox.values.toList();
  }

  void addTransaction(Transaction transaction) {
    transactionBox.add(transaction);
  }

  void deleteTransaction(int index) {
    transactionBox.deleteAt(index);
  }
}
