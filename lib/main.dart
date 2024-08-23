import 'package:flutter/material.dart';
import 'package:newborncare/Header.dart';

void main() {
  runApp(const NewBornCare());
}

class NewBornCare extends StatelessWidget {
  const NewBornCare({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Column(
        children: [
          Header(),
          Text("NewBornCare", textDirection: TextDirection.ltr),
        ],
      ),
    );
  }
}
