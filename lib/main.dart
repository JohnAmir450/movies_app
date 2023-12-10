import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:joflex/constats.dart';
import 'package:joflex/views/home_view.dart';
import 'package:joflex/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isLoggedIn= sharedPreferences.getBool('isLoggedIN')??false;
  runApp( MyApp(isLoggedIn: isLoggedIn,));
}

class MyApp extends StatelessWidget {
   MyApp({super.key, required this.isLoggedIn});
final bool isLoggedIn;
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colours.scaffoldColor, useMaterial3: true),
      title: 'JoFlex',
      home: isLoggedIn? HomeView(): LoginScreen(),
    );
  }
}
