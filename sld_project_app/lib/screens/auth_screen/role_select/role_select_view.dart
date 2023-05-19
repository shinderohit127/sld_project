import 'package:flutter/material.dart';
import 'package:sld_project_app/screens/auth_screen/register_screen.dart';
import 'package:sld_project_app/screens/auth_screen/teacher_register_screen.dart';
import 'package:sld_project_app/screens/auth_screen/user_register_screen.dart';
import 'package:sld_project_app/main.dart';

class RoleSelectView extends StatefulWidget {
  const RoleSelectView({super.key});

  @override
  State<RoleSelectView> createState() => _RoleSelectViewState();
}

class _RoleSelectViewState extends State<RoleSelectView> {
  bool isParentTapped = false;
  bool isTeacherTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFDC5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SELECT YOUR ROLE",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isParentTapped = true;
                  isTeacherTapped = false;
                });
              },
              child: Container(
                  width: double.infinity,
                  height: 150,
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade200,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: isParentTapped ? Colors.red : Colors.transparent,
                        width: 2,
                      )),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/parent-png.png"),
                      Text(
                        "Parent",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isParentTapped = false;
                  isTeacherTapped = true;
                });
              },
              child: Container(
                  width: double.infinity,
                  height: 150,
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade200,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color:
                            isTeacherTapped ? Colors.red : Colors.transparent,
                        width: 2,
                      )),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/Teacher-PNG.png"),
                      Text(
                        "Teacher",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (isParentTapped) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserRegistrationScreen(),
                    ),
                  );
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TeacherRegistrationScreen()));
                }
              },
              child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                  minimumSize: MaterialStateProperty.all(const Size(250, 30)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF558B2F))),
            )
          ],
        ),
      ),
    );
  }
}
