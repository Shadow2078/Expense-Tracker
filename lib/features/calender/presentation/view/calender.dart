import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarView extends ConsumerStatefulWidget {
  const CalendarView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarViewState();
}

class _CalendarViewState extends ConsumerState<CalendarView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String _appBarTitle = DateFormat.yMMMM().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(_appBarTitle, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.white),
            onPressed: () {
              setState(() {
                _focusedDay = DateTime(
                    _focusedDay.year, _focusedDay.month - 1, _focusedDay.day);
                _appBarTitle = DateFormat.yMMMM().format(_focusedDay);
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.white),
            onPressed: () {
              setState(() {
                _focusedDay = DateTime(
                    _focusedDay.year, _focusedDay.month + 1, _focusedDay.day);
                _appBarTitle = DateFormat.yMMMM().format(_focusedDay);
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFFEDE4CF), // Background color similar to the image
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _appBarTitle = DateFormat.yMMMM().format(_focusedDay);
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                ),
                defaultDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                weekendDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                outsideDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronVisible: false,
                rightChevronVisible: false,
                titleTextStyle: TextStyle(color: Colors.transparent),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.black),
                weekendStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFFB8B8B8), // Gray background color for the bottom part
            ),
          ),
        ],
      ),
    );
  }
}
