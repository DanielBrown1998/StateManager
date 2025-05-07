import 'package:flutter/material.dart';
import 'package:app_bloc/screens/home.dart';
import 'package:app_bloc/themes/my_themes.dart';

void main() {
  runApp(const BilheteriaPanucci());
}

class BilheteriaPanucci extends StatelessWidget {
  const BilheteriaPanucci({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bilheteria Panucci',
      theme: MyThemes.getTheme("default"),
      home: const Home(),
    );
  }
}
