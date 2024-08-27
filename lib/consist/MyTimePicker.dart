import 'package:flutter/material.dart';
import 'package:newbornCare/components/CustomText.dart';
import 'package:newbornCare/utils/CustomDateUtils.dart';

class MyTimePicker extends StatefulWidget {
  const MyTimePicker({super.key, required this.height});
  final double height;

  @override
  State createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> {

  DateTime? _date = DateTime.now();

  void _showTimePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale('zh'),

    );
    if (pickedDate != null && pickedDate != _date) {
      setState(() {
        _date = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back, size: 20.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: TextDirection.ltr,
              children: [
                CustomText(text: CustomDateUtils.formatDate(_date!), fontSize: 15.0),
                IconButton(
                  icon: const Icon(Icons.date_range, size: 24.0),
                  onPressed: _showTimePicker,
                ),
              ],
            ),
            const Icon(Icons.arrow_forward, size: 20.0),
          ]
        )
    );
  }
}


