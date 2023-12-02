import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: const Center(
          child: SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Colors.red,
              ))),
    );
  }
}
