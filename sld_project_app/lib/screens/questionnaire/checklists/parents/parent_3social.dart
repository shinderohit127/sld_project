import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sld_project_app/screens/questionnaire/checklists/parents/parent_3social.dart';
import 'package:sld_project_app/globals.dart';

class Parent_3Social extends StatefulWidget {
  @override
  _Parent_3SocialState createState() => _Parent_3SocialState();
}

class _Parent_3SocialState extends State<Parent_3Social> {
  String _selectedOption1 = '';
  String _selectedOption2 = '';
  String _selectedOption3 = '';

  List<int> selectedOptions_cat3 = List.generate(3, (_) => 0);

  void submitCategory() {
    print(selectedOptions_cat3);
    // print(progressCounter);
    parentResponses[17] = (_selectedOption1 == "YES" ? 1 : 0);
    parentResponses[18] = (_selectedOption2 == "YES" ? 1 : 0);
    parentResponses[19] = (_selectedOption3 == "YES" ? 1 : 0);
  }

  int progressCounter = 0;

  // final userEmail = FirebaseAuth.instance.currentUser!.email;
  // void updateProgress(Map<String, dynamic> progress) {
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(userEmail)
  //       .set({'progress': progress});
  // }

  final List<String> _options = ['YES', 'NO'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7EBE1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // QUESTION 1
                const Text(
                  'Category 3: Social',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B383A)),
                ),
                const SizedBox(height: 16),
                Text(
                  '1. Does the child often resist authority? {e.g., argue with or frequently disobey parents and/or other elders and/or teachers}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B383A)),
                ),
                SizedBox(height: 8),
                ..._options.map(
                  (option) => RadioListTile(
                    title: Text(option),
                    value: option,
                    groupValue: _selectedOption1,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption1 = value!;
                        progressCounter++;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),

                // QUESTION 2
                Text(
                  '2. Does the child often appear to not pick up on other people’s moods/feelings (e.g., may say the wrong thing at the wrong time)?',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B383A)),
                ),
                SizedBox(height: 8),
                ..._options.map(
                  (option) => RadioListTile(
                    title: Text(option),
                    value: option,
                    groupValue: _selectedOption2,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption2 = value!;
                        progressCounter++;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),

                // QUESTION 3
                Text(
                  '3. Does the child have difficulty engaging in play with their peers and maintaining or initiating positive verbal communication/conversation with them?',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B383A)),
                ),
                SizedBox(height: 8),
                ..._options.map(
                  (option) => RadioListTile(
                    title: Text(option),
                    value: option,
                    groupValue: _selectedOption3,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption3 = value!;
                        progressCounter++;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),

                Center(
                    child: ElevatedButton(
                  child: Text("Next"),
                  onPressed: () {
                    if (_selectedOption1 == "YES") {
                      selectedOptions_cat3[0] = 1;
                    } else {
                      selectedOptions_cat3[0] = 0;
                    }
                    if (_selectedOption2 == "YES") {
                      selectedOptions_cat3[1] = 1;
                    } else {
                      selectedOptions_cat3[1] = 0;
                    }
                    if (_selectedOption3 == "YES") {
                      selectedOptions_cat3[2] = 1;
                    } else {
                      selectedOptions_cat3[2] = 0;
                    }
                    submitCategory();
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //     builder: (context) => Parent_3Social()));
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
                )),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
