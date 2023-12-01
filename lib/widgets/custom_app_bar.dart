import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar customAppBat() {
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
      centerTitle: true,
    );
  }