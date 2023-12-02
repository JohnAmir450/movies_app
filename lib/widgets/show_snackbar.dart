import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,{required String text,required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    content: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    ),
    backgroundColor: color,
  ));
}
