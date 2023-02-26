import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sld_project_app/screens/auth_screen/auth_screen.dart';

// firebase auth packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sld_project_app/screens/home/homepage.dart';
import 'package:sld_project_app/screens/home/teacher_homepage.dart';

class TeacherRegistrationScreen extends StatefulWidget {
  const TeacherRegistrationScreen({super.key});

  @override
  State<TeacherRegistrationScreen> createState() =>
      _TeacherRegistrationScreenState();
}

class _TeacherRegistrationScreenState extends State<TeacherRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPassObscure = true;
  bool _isConfirmObscure = true;
  // input controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _password = '';
  String _confirmPassword = '';
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8eee4),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 70,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Create Account",
              style: TextStyle(
                  color: Color(0xFF1B383A),
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                const Text(
                  "Already a member?",
                  style: TextStyle(
                      color: Color(0xFF59706F),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AuthScreen(),
                    ));
                  },
                  child: Text(
                    "Log In",
                    style: const TextStyle(
                            color: Color(0xFF1B383A),
                            fontSize: 18,
                            fontWeight: FontWeight.w700)
                        .copyWith(
                            decoration: TextDecoration.underline,
                            decorationThickness: 1),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Name",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff132137),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff132137),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true ? _isPassObscure : false,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length <= 6) {
                          return 'Password must have 6 or more characters!';
                        }
                        _password = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff132137),
                        )),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPassObscure = !_isPassObscure;
                            });
                          },
                          icon: Icon(
                            _isPassObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xff132137),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true ? _isConfirmObscure : false,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _password) {
                          return 'Passwords do not match!';
                        }
                        _confirmPassword = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff132137),
                        )),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isConfirmObscure = !_isConfirmObscure;
                            });
                          },
                          icon: Icon(
                            _isConfirmObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xff132137),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: "Phone Number",
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        // print(phone.completeNumber);
                        _phoneNumber = phone.completeNumber;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        print(_nameController.text.trim());
                        // print(_parentNameController.text.trim());
                        print(_emailController.text.trim());
                        print(_confirmPassword);
                        print(_phoneNumber);
                        // print(_teacherEmailController.text.trim());

                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: _emailController.text.trim(),
                                  password: _confirmPassword);
                          FirebaseFirestore.instance
                              .collection('teachers')
                              .doc(_emailController.text.trim())
                              .set({
                            'name': _nameController.text.trim(),
                            'email': _emailController.text.trim(),
                            'contactNumber': _phoneNumber,
                            'students': [""],
                          });

                          // navigate to homepage
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TeacherHomePage()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('weak password');
                          } else if (e.code == 'email-already-in-use') {
                            print('email already in use');
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xff132137),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ]),
      ),
    );
  }
}
