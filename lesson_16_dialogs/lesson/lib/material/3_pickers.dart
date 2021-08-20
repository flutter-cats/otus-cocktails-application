import 'package:flutter/material.dart';

import '../content.dart';

class PickersSample extends StatefulWidget {
  @override
  _PickersSampleState createState() => _PickersSampleState();
}

class _PickersSampleState extends State<PickersSample> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    items.add(
      TextButton(
        onPressed: _showDateTimePicker,
        child: Text('Show DatePicker'),
      ),
    );
    items.add(
      TextButton(
        onPressed: () =>
            _showDateTimeRangePicker(entryMode: DatePickerEntryMode.calendar),
        child: Text('Show DateRangePicker'),
      ),
    );

    items.add(
      TextButton(
        onPressed: () =>
            _showDateTimeRangePicker(entryMode: DatePickerEntryMode.input),
        child: Text('Show DateRangePicker'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Material Dialogs'),
      ),
      body: ListView(
        children: items,
      ),
    );
  }

  void _showDateTimePicker() {
    showDatePicker(
        context: context,
        builder: (context, child) {
          return Column(
            children: [child!],
          );
        },
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  }

  void _showDateTimeRangePicker({required DatePickerEntryMode entryMode}) {
    showDateRangePicker(
        context: context,
        locale: Locale('ru'),
        initialEntryMode: entryMode,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  }
}
