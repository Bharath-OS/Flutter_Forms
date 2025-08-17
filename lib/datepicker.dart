import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  DateTime startingDate = DateTime.now();
  DateTime endingDate = DateTime(2025, 12, 25);
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = DateFormat('yMMMMd').format(date);
    startingDate = DateTime(
      startingDate.year,
      startingDate.month,
      startingDate.day,
    );
    // _controller.text = date.toLocal().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Date Picker")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(DateFormat('dd/MM/yyyy').format(date)),
              ElevatedButton(
                onPressed: () async {
                  DateTime? chosenDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                    barrierLabel: "Hello hi",
                  );
                  if (chosenDate != null) {
                    setState(() {
                      date = chosenDate;
                    });
                  }
                },
                child: Text("Choose the date"),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _controller,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  readOnly: true,
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2025, 08, 10),
                      firstDate: DateTime(2025, 1, 1),
                      lastDate: DateTime(2050, 10, 10),
                      // currentDate: DateTime.now()
                      // initialEntryMode: DatePickerEntryMode.calendarOnly,
                      helpText: "Pick you BirthDay",
                      cancelText: "Cancel Bro",
                      confirmText: "Confirm Bro",
                      barrierDismissible: false,
                      fieldLabelText: "Enter the date in month/day/year format",
                      fieldHintText: "hey",
                      errorInvalidText: "Error bro",
                      errorFormatText: "Format error bro",
                    );
                    if (newDate != null) {
                      setState(() {
                        _controller.text = DateFormat(
                          'dd/MM/yyyy',
                        ).format(newDate);
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 30),
              Text(time.format(context)),
              ElevatedButton(
                onPressed: () async {
                  TimeOfDay? chosenTime = await showTimePicker(
                    context: context,
                    initialTime: time,
                    initialEntryMode: TimePickerEntryMode.input,
                    hourLabelText: "Houur",
                    minuteLabelText: "Minuute",
                    errorInvalidText: "Watch what you type bro",
                  );
                  if (chosenTime != null) {
                    setState(() {
                      time = chosenTime;
                    });
                  }
                },
                child: Text("Choose the time"),
              ),
              SizedBox(height: 20),
              Text("Date Range Picker"),
              SizedBox(height: 10),
              Text(
                "Starting date: ${DateFormat('d/MMM/y').format(startingDate)} \nEnding date: ${DateFormat('d/MMM/y').format(endingDate)}",
              ),
              ElevatedButton(
                onPressed: () async {
                  DateTimeRange? date = await showDateRangePicker(
                    context: context,
                    firstDate: startingDate,
                    lastDate: endingDate,
                  );
                  if (date != null) {
                    setState(() {
                      startingDate = date.start;
                      endingDate = date.end;
                    });
                  }
                },
                child: Text("Choose Date Range"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
