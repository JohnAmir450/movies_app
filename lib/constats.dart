import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Colours{
  static const scaffoldColor=Color(0xff23272E);
    static const ratingColor=Color(0xffFFC107);

}

const String imageBasic='https://image.tmdb.org/t/p/w500';
    sharedData({required bool value})async
 {
  SharedPreferences isLoggedIn=await SharedPreferences.getInstance();
  
  isLoggedIn.setBool('isLoggedIn', value);
  if(value ==true) {
    return true;
  } else{
    return false;
  }
 }

