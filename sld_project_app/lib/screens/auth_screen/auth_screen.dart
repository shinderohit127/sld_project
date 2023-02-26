import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sld_project_app/screens/auth_screen/role_select/role_select_view.dart';
import 'package:sld_project_app/screens/home/teacher_homepage.dart';
import 'package:sld_project_app/screens/home/user_homepage.dart';
import '../../main.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isObscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String role = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7EBE1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 120,
              ),
              const Text(
                "Welcome Back",
                style: TextStyle(
                    color: Color(0xFF1B383A),
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text(
                    "New to this app?",
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
                          builder: (context) => const RoleSelectView()));
                    },
                    child: Text(
                      "Sign Up",
                      style: const TextStyle(
                              color: Color(0xFF1B383A),
                              fontWeight: FontWeight.bold,
                              fontSize: 17)
                          .copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: emailController,
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
                      controller: passwordController,
                      obscureText: true ? _isObscure : false,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Password",
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff132137),
                        )),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xff132137),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: signIn,
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xff132137),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkRole(String emailId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('teachers')
          .doc(emailId)
          .get();
      if (snapshot.exists) {
        // print('role is teacher');
        role = "teacher";
      } else {
        role = "user";
      }
      print(
          " ------------------------------- role is $role ------------------------------ ");
    } catch (e) {
      print('user not found');
    }
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      await checkRole(emailController.text.trim());
      print(
          " ------------------------------- role is $role ------------------------------ ");
      if (role == "teacher") {
        print('redirecting to teacher homepage');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const TeacherHomePage()));
      } else {
        print('redirecting to user homepage');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const UserHomePage()));
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    // Navigator.of(context) not working!
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

// Scaffold(
//       backgroundColor: const Color(0xfff8eee4),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(
//                 Icons.health_and_safety_rounded,
//                 size: 100,
//                 color: Color(0xFF558B2F),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               // greeting text
//               const Text(
//                 'Welcome!',
//                 style: TextStyle(
//                   fontSize: 36,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 'Sign in to get started',
//                 style: TextStyle(fontSize: 24),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),

//               // email textfield
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: const Color(0xFFEEEEEE),
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20.0),
//                     child: TextField(
//                       controller: emailController,
//                       textInputAction: TextInputAction.next,
//                       decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Email',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),

//               // password textfield
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: const Color(0xFFEEEEEE),
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20.0),
//                     child: TextField(
//                       controller: passwordController,
//                       textInputAction: TextInputAction.done,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Password',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),

//               // sign in button
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               //   child: Container(
//               //     padding: const EdgeInsets.all(20),
//               //     decoration: BoxDecoration(
//               //       color: const Color(0xff81C784),
//               //       borderRadius: BorderRadius.circular(12.0),
//               //     ),
//               //     child: const Center(
//               //         child: Text(
//               //       'Sign In',
//               //       style: TextStyle(
//               //           color: Colors.white,
//               //           fontSize: 18,
//               //           fontWeight: FontWeight.bold),
//               //     )),
//               //   ),
//               // ),
//               ElevatedButton(
//                 onPressed: signIn,
//                 style: ButtonStyle(
//                   textStyle: MaterialStateProperty.all(
//                     const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//                   ),
//                   padding: MaterialStateProperty.all(
//                     const EdgeInsets.all(16.0),
//                   ),
//                   minimumSize: MaterialStateProperty.all(const Size(355, 40)),
//                   backgroundColor:
//                       MaterialStateProperty.all(const Color(0xFF558B2F)),
//                 ),
//                 child: const Text("Sign In"),
//               ),

//               // ElevatedButton.icon(
//               //   icon: const Icon(
//               //     Icons.done_outline,
//               //     size: 24,
//               //   ),
//               //   style: ElevatedButton.styleFrom(
//               //       minimumSize: const Size.fromHeight(18),
//               //       padding: const EdgeInsets.all(16.0)),
//               //   label: const Text(
//               //     "Sign In",
//               //     style: TextStyle(fontSize: 18),
//               //   ),
//               //   onPressed: signIn,
//               // ),
//               const SizedBox(
//                 height: 20,
//               ),

//               // sign up text
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Not a member? ',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   RichText(
//                       text: TextSpan(children: <TextSpan>[
//                     TextSpan(
//                         text: "Register Now!",
//                         style: linkStyle,
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             // debugPrint('Register text clicked');
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: ((context) =>
//                                     const RoleSelectView())));
//                           })
//                   ])),
//                   // Text(
//                   //   'Register Now!',
//                   //   style: TextStyle(
//                   //       fontWeight: FontWeight.bold, color: Colors.blueAccent),
//                   // ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );