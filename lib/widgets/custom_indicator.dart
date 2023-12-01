import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: SizedBox(
      height: 24,width: 24,
      child: CircularProgressIndicator(color: Colors.red,)));
  }
}
