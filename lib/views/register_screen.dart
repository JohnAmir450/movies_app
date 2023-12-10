// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:joflex/widgets/show_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constats.dart';
import '../widgets/custom_bottom.dart';
import '../widgets/custom_text_field.dart';
import 'home_view.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email, password, phoneNumber, name;

  bool isLoading = false;
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
                name = value;
              },
              labelText: 'Name',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onChanged: (value) {
                phoneNumber = value;
              },
              labelText: 'Phone Number',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 16,
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
              onChanged: (value) {
                password = value;
              },
              labelText: 'Password',
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 60,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.red,
                  ))
                : CustomBottom(
                    text: 'Register',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          isLoading = true;
                          setState(() {});
                          await registerUser();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeView()),
                              (route) => false);
                              SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                              sharedPreferences.setBool(isLoggedInSharedData, true);
                          showSnackBar(context,
                              text: 'Email created successfully',
                              color: Colors.green);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(context,
                                text: 'The password provided is too weak.',
                                color: Colors.red);
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context,
                                text:
                                    'The account already exists for that email!',
                                color: Colors.amber);
                          }
                        } catch (e) {
                          showSnackBar(context,
                              text: e.toString(), color: Colors.red);
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    },
                  ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Login Now',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
