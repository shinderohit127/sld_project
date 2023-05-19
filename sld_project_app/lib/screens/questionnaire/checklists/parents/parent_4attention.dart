import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sld_project_app/globals.dart';
import 'package:sld_project_app/screens/questionnaire/checklists/parents/parent_5organization.dart';

class Parent_4Attention extends StatefulWidget {
  @override
  _Parent_4AttentionState createState() => _Parent_4AttentionState();
}

class _Parent_4AttentionState extends State<Parent_4Attention> {
  String _selectedOption1 = '';
  String _selectedOption2 = '';
  String _selectedOption3 = '';
  String _selectedOption4 = '';
  String _selectedOption5 = '';
  String _selectedOption6 = '';

  List<int> selectedOptions_cat4 = List.generate(6, (_) => 0);

  void submitCategory() {
    print(selectedOptions_cat4);
    // print(progressCounter);
    parentResponses[20] = (_selectedOption1 == "YES" ? 1 : 0);
    parentResponses[21] = (_selectedOption2 == "YES" ? 1 : 0);
    parentResponses[22] = (_selectedOption3 == "YES" ? 1 : 0);
    parentResponses[23] = (_selectedOption4 == "YES" ? 1 : 0);
    parentResponses[24] = (_selectedOption5 == "YES" ? 1 : 0);
    parentResponses[25] = (_selectedOption6 == "YES" ? 1 : 0);
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
                  'Category 4: Attention',
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

                // QUESTION 3
                Text(
                  '3. Does the child often not appear to listen when spoken to directly?',
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

                // QUESTION 3
                Text(
                  '4. Is the child easily distracted by sounds, motion, or other stimuli?',
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
                    groupValue: _selectedOption4,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption4 = value!;
                        progressCounter++;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),

                // QUESTION 3
                Text(
                  '5. Does the child often avoid, dislike, and/or is reluctant to engage in tasks that require sustained mental effort (e.g., homework, organizing work tasks)?',
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
                    groupValue: _selectedOption5,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption5 = value!;
                        progressCounter++;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),

                // QUESTION 3
                Text(
                  '6. Does the child fail to pay close attention to details or makes careless mistakes in their homework or other activities?',
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
                    groupValue: _selectedOption6,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption6 = value!;
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
                      selectedOptions_cat4[0] = 1;
                    } else {
                      selectedOptions_cat4[0] = 0;
                    }
                    if (_selectedOption2 == "YES") {
                      selectedOptions_cat4[1] = 1;
                    } else {
                      selectedOptions_cat4[1] = 0;
                    }
                    if (_selectedOption3 == "YES") {
                      selectedOptions_cat4[2] = 1;
                    } else {
                      selectedOptions_cat4[2] = 0;
                    }
                    if (_selectedOption4 == "YES") {
                      selectedOptions_cat4[3] = 1;
                    } else {
                      selectedOptions_cat4[3] = 0;
                    }
                    if (_selectedOption5 == "YES") {
                      selectedOptions_cat4[4] = 1;
                    } else {
                      selectedOptions_cat4[4] = 0;
                    }
                    if (_selectedOption6 == "YES") {
                      selectedOptions_cat4[5] = 1;
                    } else {
                      selectedOptions_cat4[5] = 0;
                    }
                    submitCategory();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Parent_5Organization()));
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
