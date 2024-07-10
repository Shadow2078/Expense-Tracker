import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  String selectedCurrency = '\$';
  String selectedDateFormat = 'dd/MM/yyyy';

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
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Center(
              child: Text('General Settings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Divider(color: Colors.grey),
            ListTile(
              title: Text('Clear All Records', style: TextStyle(fontSize: 20, color: Color.fromRGBO(20, 110, 115, 1))),
              subtitle: Text('This will clear your all income expense entries'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {
                // Handle clear all records action
              },
            ),
            Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Currency', style: TextStyle(fontSize: 20, color: Color.fromRGBO(20, 110, 115, 1))),
            ),
            DropdownButton<String>(
              value: selectedCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCurrency = newValue!;
                });
              },
              items: <String>['\$', '€', '£', '₹']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Date Format', style: TextStyle(fontSize: 20, color: Color.fromRGBO(20, 110, 115, 1))),
            ),
            DropdownButton<String>(
              value: selectedDateFormat,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDateFormat = newValue!;
                });
              },
              items: <String>['dd/MM/yyyy', 'MM/dd/yyyy', 'yyyy/MM/dd']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Divider(color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
