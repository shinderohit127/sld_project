import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  bool _isObscure = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                color: Color(0xFF76A25C),
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
                color: Color(0xFF76A25C),
              )),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFF76a25c),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
