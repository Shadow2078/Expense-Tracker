import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';


class AddIncomeView extends ConsumerStatefulWidget {
  const AddIncomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddIncomeViewState();
}

class _AddIncomeViewState extends ConsumerState<AddIncomeView> {
  String selectedCategory = 'Business';
  String selectedMode = 'Cash';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.black,
  iconTheme: IconThemeData(
    color: Colors.white, // Set the color of the back button to white
  ),
  titleTextStyle: TextStyle(
    color: Colors.white, // Set the color of the title text to white
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
  leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  title: Text('Add Income'),
  actions: [
    IconButton(
      icon: Icon(Icons.check),
      color: Colors.white, // Set the color of the check button to white
      onPressed: () {
        // Handle save action
      },
    ),
  ],
),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Ads running', style: TextStyle(fontSize: 14)),
                  ),
                  // SvgPicture.asset(
                  //   'assets/images/vector.svg',
                  //   width: 24,
                  //   height: 24,
                  // ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text('Type', style: TextStyle(fontSize: 20, color: Color.fromRGBO(20, 110, 115, 1))),
            Row(
              children: [
                Radio(value: 'Income', groupValue: 'Income', onChanged: (value) {}),
                Text('Income'),
                Radio(value: 'Expense', groupValue: 'Income', onChanged: (value) {}),
                Text('Expense'),
              ],
            ),
            Divider(color: Colors.grey),
            Text('Amount', style: TextStyle(fontSize: 20, color: Color.fromRGBO(20, 110, 115, 1))),
            TextField(
              decoration: InputDecoration(
                hintText: 'Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            Divider(color: Colors.grey),
            Text('Category', style: TextStyle(fontSize: 20, color: Color.fromRGBO(20, 110, 115, 1))),
            DropdownButton<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: <String>['Business', 'Personal', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Divider(color: Colors.grey),
            Text('Date & Time', style: TextStyle(fontSize: 20, color: Color.fromRGBO(20, 110, 115, 1))),
            Row(
              children: [
                TextButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null && pickedDate != selectedDate)
                      setState(() {
                        selectedDate = pickedDate;
                      });
                  },
                  child: Text(DateFormat('dd/MM/yyyy').format(selectedDate)),
                ),
                SizedBox(width: 20.0),
                TextButton(
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(selectedDate),
                    );
                    if (pickedTime != null)
                      setState(() {
                        final now = DateTime.now();
                        selectedDate = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );
                      });
                  },
                  child: Text(DateFormat('hh:mm a').format(selectedDate)),
                ),
              ],
            ),
            Divider(color: Colors.grey),
            Text('Mode', style: TextStyle(fontSize: 20, color: Color.fromRGBO(20, 110, 115, 1))),
            DropdownButton<String>(
              value: selectedMode,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMode = newValue!;
                });
              },
              items: <String>['Cash', 'Card', 'Online']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Divider(color: Colors.grey),
            Text('Note', style: TextStyle(fontSize: 20, color: Color.fromRGBO(20, 110, 115, 1))),
            TextField(
              decoration: InputDecoration(
                hintText: 'Note',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(33, 35, 50, 1),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
