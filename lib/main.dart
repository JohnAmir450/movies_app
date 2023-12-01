import 'package:flutter/material.dart';
import 'package:joflex/constats.dart';
import 'package:joflex/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colours.scaffoldColor, useMaterial3: true),
      title: 'JoFlex',
      home: const HomeView(),
    );
  }
}
