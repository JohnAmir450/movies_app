import 'package:flutter/material.dart';
import 'package:joflex/constats.dart';

class CustomBackButtom extends StatelessWidget {
  const CustomBackButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.all(8.0),
      decoration: BoxDecoration(color: Colours.scaffoldColor,borderRadius: BorderRadius.circular(12)),
      
      child: IconButton(
        onPressed: (){
        Navigator.pop(context);
      }, icon:  const Icon(Icons.arrow_back_ios_new)),
    );
  }
}