import 'package:flutter/material.dart';
import 'package:sld_project_app/screens/home/user_homepage.dart';

class ChecklistCompletedScreen extends StatelessWidget {
  const ChecklistCompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7EBE1),
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Thank You For Attempting the Checklist!",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B383A)),
                ),
                SizedBox(
                  height: 12,
                ),
                Image.asset(
                  'assets/updated_logos/Good_Results-removebg-preview.png',
                  height: 200,
                  width: 200,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Please head over to Reports tab to check the results!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B383A)),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  child: Text("Go to Homepage"),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => UserHomePage()));
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(16.0),
                    ),
                    minimumSize: MaterialStateProperty.all(const Size(355, 40)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF558B2F)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
