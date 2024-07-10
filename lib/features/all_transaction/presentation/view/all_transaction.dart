import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllTransactionView extends ConsumerStatefulWidget {
  const AllTransactionView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllTransactionViewState();
}

class _AllTransactionViewState extends ConsumerState<AllTransactionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Transaction',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          MonthSection(month: 'May 2024', transactions: [
            TransactionItem(day: 3, amount: 'Rs. 2,000', description: 'Travel', isExpense: true),
            TransactionItem(day: 4, amount: 'Rs. 10,000', description: 'Salary', isExpense: false),
          ]),
          MonthSection(month: 'April 2024', transactions: [
            TransactionItem(day: 7, amount: 'Rs. 3,000', description: 'Food', isExpense: true),
            TransactionItem(day: 8, amount: 'Rs. 2,000', description: 'Clothing', isExpense: true),
            TransactionItem(day: 8, amount: 'Rs. 10,000', description: 'Salary', isExpense: false),
          ]),
          BalanceSummary(balance: 'Rs. 15,000', income: 'Rs. 20,000', expenses: 'Rs. 5,000'),
        ],
      ),
    );
  }
}

class MonthSection extends StatelessWidget {
  final String month;
  final List<TransactionItem> transactions;

  const MonthSection({required this.month, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          color: Colors.grey.shade300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(month, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        ...transactions,
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  final int day;
  final String amount;
  final String description;
  final bool isExpense;

  const TransactionItem({
    required this.day,
    required this.amount,
    required this.description,
    required this.isExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4),
      color: Colors.grey.shade200,
      child: Row(
        children: [
          CircleAvatar(
            child: Text(day.toString(), style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.black,
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(amount, style: TextStyle(color: isExpense ? Colors.red : Colors.green, fontWeight: FontWeight.bold)),
              Text(description, style: TextStyle(color: isExpense ? Colors.red : Colors.green)),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}

class BalanceSummary extends StatelessWidget {
  final String balance;
  final String income;
  final String expenses;

  const BalanceSummary({
    required this.balance,
    required this.income,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.black,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Balance : $balance', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Income', style: TextStyle(color: Colors.green)),
              Text(income, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Expenses', style: TextStyle(color: Colors.red)),
              Text(expenses, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}


