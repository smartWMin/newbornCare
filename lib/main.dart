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
    return const Header();
  }
}
