import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyboardType = TextInputType.emailAddress,
    required this.labelText,
    this.onChanged,  this.obscureText=false, this.suffix,
  });
  final TextInputType? keyboardType;
  final String labelText;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget?suffix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        obscureText: obscureText,
        validator: (data){
          if(data!.isEmpty){
            return 'this field can\'t be empty';
          }
        },
        onChanged: onChanged,
        keyboardType: keyboardType,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon: suffix,
          
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Colors.amber.withOpacity(0.5))),
        ),
      ),
    );
  }
}
