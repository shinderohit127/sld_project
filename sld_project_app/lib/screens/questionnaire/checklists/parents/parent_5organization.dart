import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sld_project_app/globals.dart';
import 'package:sld_project_app/screens/questionnaire/checklists/parents/parent_6gfm.dart';

class Parent_5Organization extends StatefulWidget {
  @override
  _Parent_5OrganizationState createState() => _Parent_5OrganizationState();
}

class _Parent_5OrganizationState extends State<Parent_5Organization> {
  String _selectedOption1 = '';
  String _selectedOption2 = '';
  // String _selectedOption3 = '';
  // String _selectedOption4 = '';
  // String _selectedOption5 = '';
  // String _selectedOption6 = '';

  List<int> selectedOptions_cat5 = List.generate(2, (_) => 0);

  void submitCategory() {
    print(selectedOptions_cat5);
    // print(progressCounter);
    parentResponses[26] = (_selectedOption1 == "YES" ? 1 : 0);
    parentResponses[27] = (_selectedOption2 == "YES" ? 1 : 0);
    // parentResponses[22] = (_selectedOption3 == "YES" ? 1 : 0);
    // parentResponses[23] = (_selectedOption4 == "YES" ? 1 : 0);
    // parentResponses[24] = (_selectedOption5 == "YES" ? 1 : 0);
    // parentResponses[25] = (_selectedOption6 == "YES" ? 1 : 0);
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
                  'Category 5: Organization',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B383A)),
                ),
                const SizedBox(height: 16),
                Text(
                  '1. Does the child often lose track of time while performing daily activities like getting ready for school, tidying their room, or while doing simple household tasks that you ask them to perform: like setting the table for dinner, getting groceries from a neighbourhood shop, etc?',
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
                  '2. Does the child have difficulty maintaining attention for more than 15 minutes while doing schoolwork or even while playing?',
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

                // // QUESTION 3
                // Text(
                //   '3. Does the child often not appear to listen when spoken to directly?',
                //   style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: Color(0xFF1B383A)),
                // ),
                // SizedBox(height: 8),
                // ..._options.map(
                //   (option) => RadioListTile(
                //     title: Text(option),
                //     value: option,
                //     groupValue: _selectedOption3,
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedOption3 = value!;
                //         progressCounter++;
                //       });
                //     },
                //   ),
                // ),
                // SizedBox(height: 16),

                // // QUESTION 3
                // Text(
                //   '4. Is the child easily distracted by sounds, motion, or other stimuli?',
                //   style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: Color(0xFF1B383A)),
                // ),
                // SizedBox(height: 8),
                // ..._options.map(
                //   (option) => RadioListTile(
                //     title: Text(option),
                //     value: option,
                //     groupValue: _selectedOption3,
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedOption3 = value!;
                //         progressCounter++;
                //       });
                //     },
                //   ),
                // ),
                // SizedBox(height: 16),

                // // QUESTION 3
                // Text(
                //   '5. Does the child often avoid, dislike, and/or is reluctant to engage in tasks that require sustained mental effort (e.g., homework, organizing work tasks)?',
                //   style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: Color(0xFF1B383A)),
                // ),
                // SizedBox(height: 8),
                // ..._options.map(
                //   (option) => RadioListTile(
                //     title: Text(option),
                //     value: option,
                //     groupValue: _selectedOption3,
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedOption3 = value!;
                //         progressCounter++;
                //       });
                //     },
                //   ),
                // ),
                // SizedBox(height: 16),

                // // QUESTION 3
                // Text(
                //   '6. Does the child fail to pay close attention to details or makes careless mistakes in their homework or other activities?',
                //   style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: Color(0xFF1B383A)),
                // ),
                // SizedBox(height: 8),
                // ..._options.map(
                //   (option) => RadioListTile(
                //     title: Text(option),
                //     value: option,
                //     groupValue: _selectedOption3,
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedOption3 = value!;
                //         progressCounter++;
                //       });
                //     },
                //   ),
                // ),
                // SizedBox(height: 16),

                Center(
                    child: ElevatedButton(
                  child: Text("Next"),
                  onPressed: () {
                    if (_selectedOption1 == "YES") {
                      selectedOptions_cat5[0] = 1;
                    } else {
                      selectedOptions_cat5[0] = 0;
                    }
                    if (_selectedOption2 == "YES") {
                      selectedOptions_cat5[1] = 1;
                    } else {
                      selectedOptions_cat5[1] = 0;
                    }
                    // if (_selectedOption3 == "YES") {
                    //   selectedOptions_cat5[2] = 1;
                    // } else {
                    //   selectedOptions_cat5[2] = 0;
                    // }
                    submitCategory();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Parent_6GFM()));
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
