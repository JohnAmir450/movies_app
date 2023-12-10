// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joflex/views/home_view.dart';
import 'package:joflex/views/register_screen.dart';
import 'package:joflex/widgets/custom_bottom.dart';
import 'package:joflex/widgets/show_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constats.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  String? email, password;
  bool isObscure = true;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Text('JOFLIX',
                    style: GoogleFonts.sairaStencilOne(
                      fontWeight: FontWeight.w600,
                      fontSize: 45,
                      color: Colors.red,
                    )),
              ),
            ),
            Text(
              'Welcome to the world of movies',
              style: GoogleFonts.sairaStencilOne(fontSize: 18),
            ),
            const SizedBox(
              height: 80,
            ),
            CustomTextField(
              onChanged: (value) {
                email = value;
              },
              labelText: 'Email',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onChanged: (value) {
                password = value;
              },
              labelText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: isObscure,
              suffix: isObscure
                  ? GestureDetector(
                      onTap: () {
                        isObscure = !isObscure;
                        setState(() {});
                      },
                      child: const Icon(Icons.visibility))
                  : GestureDetector(
                      onTap: () {
                        isObscure = !isObscure;
                        setState(() {});
                      },
                      child: const Icon(Icons.visibility_off)),
            ),
            const SizedBox(
              height: 80,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  )
                : CustomBottom(
                    text: 'Login',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          isLoading = true;
                          setState(() {});
                          await userLogin();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeView()),
                              (route) => false);
                              SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                              sharedPreferences.setBool(isLoggedInSharedData, true);
                          showSnackBar(context,
                              text: 'Logged in successfully',
                              color: Colors.green);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context,
                                text: 'No user found for that email.',
                                color: Colors.red);
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context,
                                text: 'Wrong password provided for that user.',
                                color: Colors.red);
                          }
                        } catch (e) {
                          showSnackBar(context,
                              text: e.toString(), color: Colors.red);
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                  ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account? '),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }

  Future<void> userLogin() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
