import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  late String type; // "income" or "expense"

  @HiveField(1)
  late double amount;

  @HiveField(2)
  late String category;

  @HiveField(3)
  late DateTime dateTime;

  @HiveField(4)
  late String mode;

  @HiveField(5)
  late String note;
}
