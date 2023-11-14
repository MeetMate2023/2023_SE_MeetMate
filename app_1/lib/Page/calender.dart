import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
  String text = '';
  String eventday ='';

  Event(this.text, this.eventday);
}

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);
  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  Map<DateTime, List<Event>> events = {
    DateTime.utc(2023, 9, 13): [Event('여행가기', '10시30분')],
    DateTime.utc(2023, 9, 27): [Event('축구하기', '10시30분')],
    DateTime.utc(2023, 10, 27): [Event('축구하기', '10시30분')],
  };

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  String eventText = '';
  String eventdate = '';

  void _getEvent(List<Event> eventday) {
    setState(() {
      eventText = '';
      eventdate = '';
      if (eventday.isNotEmpty) {
        for (Event event in eventday) {
          eventText = event.text;
          eventdate = event.eventday;
        }
      } else {
        eventText = '등록된 일정이 없습니다';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('123')),
        body: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2050, 12, 30),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _getEvent(_getEventsForDay(_focusedDay));
                });
              },
              eventLoader: _getEventsForDay,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.4,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('시간')),
                  DataColumn(label: Text('내용')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text(eventdate)),
                    DataCell(Text(eventText)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('')),
                    DataCell(Text('')),
                  ]),
                ],
              ),
            ),
          ],
        ));
  }
}
