import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sld_project_app/globals.dart';
import 'package:sld_project_app/screens/checklist_completed_screen.dart/checklist_completed_screen.dart';

class Parent_11Math extends StatefulWidget {
  @override
  _Parent_11MathState createState() => _Parent_11MathState();
}

class _Parent_11MathState extends State<Parent_11Math> {
  String _selectedOption1 = '';
  String _selectedOption2 = '';
  String _selectedOption3 = '';
  String _selectedOption4 = '';
  String _selectedOption5 = '';
  // String _selectedOption6 = '';

  List<int> selectedOptions_cat6 = List.generate(5, (_) => 0);

  void submitCategory() {
    print(selectedOptions_cat6);
    // print(progressCounter);
    parentResponses[26] = (_selectedOption1 == "YES" ? 1 : 0);
    parentResponses[27] = (_selectedOption2 == "YES" ? 1 : 0);
    parentResponses[28] = (_selectedOption3 == "YES" ? 1 : 0);
    parentResponses[29] = (_selectedOption4 == "YES" ? 1 : 0);
    parentResponses[30] = (_selectedOption5 == "YES" ? 1 : 0);
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
                  'Category 11: Math and Logic',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B383A)),
                ),
                const SizedBox(height: 16),
                Text(
                  '1. Does the child often reverse numbers? {e.g., 81 for 18}',
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
                  '2. Does the child often confuse math symbols and/or operations? {e.g., addition, subtraction, multiplication, division}',
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
                  "3. Does the child have trouble telling time (on either a digital or analog clock)?",
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
                  '4. Does the child often have difficulty with comparisons (e.g., less than, greater than)?',
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
                  '5. Does the child often struggle to differentiate facts from fantasy?',
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
                  '6. Does the child often have difficulty with simple counting and one-to-one correspondence between number symbols and objects?',
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
                  '7. Does the child often have difficulty learning and performing strategic counting activities (e.g., by 2, 5, 10, 100)?',
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
                  '8. Does the child often have difficulty estimating (e.g., quantity, value)?',
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
                  child: Text("SUBMIT"),
                  onPressed: () {
                    if (_selectedOption1 == "YES") {
                      selectedOptions_cat6[0] = 1;
                    } else {
                      selectedOptions_cat6[0] = 0;
                    }
                    if (_selectedOption2 == "YES") {
                      selectedOptions_cat6[1] = 1;
                    } else {
                      selectedOptions_cat6[1] = 0;
                    }
                    // if (_selectedOption3 == "YES") {
                    //   selectedOptions_cat6[2] = 1;
                    // } else {
                    //   selectedOptions_cat6[2] = 0;
                    // }
                    submitCategory();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ChecklistCompletedScreen()));
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
