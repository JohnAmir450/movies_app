import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joflex/constats.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/login_screen.dart';

AppBar customAppBat(context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      'JOFLIX',
      style: GoogleFonts.sairaStencilOne(
        fontWeight: FontWeight.w600,
        fontSize: 35,
        color: Colors.red,
      ),
    ),
    actions: [
      IconButton(
          onPressed: () async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.setBool(isLoggedInSharedData, false);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false);
          },
          icon: const Icon(Icons.logout_outlined))
    ],
    centerTitle: true,
  );
}
