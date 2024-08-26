import 'package:flutter/material.dart';
import 'package:newbornCare/components/CustomText.dart';

class MyTimePicker extends StatefulWidget {
  const MyTimePicker({super.key, required this.height});
  final double height;

  @override
  State createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State {

  

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        padding: const EdgeInsets.all(6.0),
        child: const Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back, size: 20.0, textDirection: TextDirection.ltr),
            CustomText(text: "12:00: ", fontSize: 15.0),
            Icon(Icons.arrow_forward, size: 20.0, textDirection: TextDirection.ltr),
          ]
        )
    );
  }
}
