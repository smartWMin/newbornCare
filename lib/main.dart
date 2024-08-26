import 'package:flutter/material.dart';
import 'package:newbornCare/consist/Header.dart';
import 'package:newbornCare/consist/MyTimePicker.dart';

void main() {
  runApp(const NewBornCare());
}

class NewBornCare extends StatelessWidget {
  const NewBornCare({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: double.infinity,
        maxWidth: double.infinity,
      ),
      alignment: Alignment.center,
      child: const Column(
        children: [
          Header(height: 100),
          MyTimePicker(height: 100)
        ],
      ),
    );
  }
}
