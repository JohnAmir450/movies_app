import 'package:flutter/material.dart';

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      'This is the first page',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    ),
    backgroundColor: Colors.amber,
  ));
}
