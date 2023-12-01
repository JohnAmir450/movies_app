import 'package:flutter/material.dart';

class AdultCircleAvatar extends StatelessWidget {
  const AdultCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(backgroundColor: Colors.red,child: Text('+18',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),);
  }
}
