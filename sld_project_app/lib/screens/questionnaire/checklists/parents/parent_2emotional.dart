import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sld_project_app/screens/questionnaire/checklists/parents/parent_3social.dart';
import 'package:sld_project_app/globals.dart';

class Parent_2Emotional extends StatefulWidget {
  @override
  _Parent_2EmotionalState createState() => _Parent_2EmotionalState();
}

class _Parent_2EmotionalState extends State<Parent_2Emotional> {
  String _selectedOption1 = '';
  String _selectedOption2 = '';
  String _selectedOption3 = '';
  String _selectedOption4 = '';
  String _selectedOption5 = '';

  List<int> selectedOptions_cat2 = List.generate(5, (_) => 0);

  void submitCategory() {
    print(selectedOptions_cat2);
    // print(progressCounter);

    // addresponses to global list
    parentResponses[12] = (_selectedOption1 == "YES" ? 1 : 0);
    parentResponses[13] = (_selectedOption2 == "YES" ? 1 : 0);
    parentResponses[14] = (_selectedOption3 == "YES" ? 1 : 0);
    parentResponses[15] = (_selectedOption4 == "YES" ? 1 : 0);
    parentResponses[16] = (_selectedOption5 == "YES" ? 1 : 0);
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
                  'Category 2: Emotional Dysregulation',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B383A)),
                ),
                const SizedBox(height: 16),
                Text(
                  '1. Does the child often express anxiety or frustration?',
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
                  '2. Does the child sometimes say she/he feels stupid or not as smart as other kids?',
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
                  '3. Does the child often complain of aches, pains or other discomforts?',
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

                // QUESTION 4
                Text(
                  '4. Does the child have difficulty with self-control when frustrated?',
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

                // QUESTION 5
                Text(
                  '5. Does the child often have trouble knowing how to share/express their feelings?',
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

                Center(
                    child: ElevatedButton(
                  child: Text("Next"),
                  onPressed: () {
                    if (_selectedOption1 == "YES") {
                      selectedOptions_cat2[0] = 1;
                    } else {
                      selectedOptions_cat2[0] = 0;
                    }
                    if (_selectedOption2 == "YES") {
                      selectedOptions_cat2[1] = 1;
                    } else {
                      selectedOptions_cat2[1] = 0;
                    }
                    if (_selectedOption3 == "YES") {
                      selectedOptions_cat2[2] = 1;
                    } else {
                      selectedOptions_cat2[2] = 0;
                    }
                    if (_selectedOption4 == "YES") {
                      selectedOptions_cat2[3] = 1;
                    } else {
                      selectedOptions_cat2[3] = 0;
                    }
                    if (_selectedOption5 == "YES") {
                      selectedOptions_cat2[4] = 1;
                    } else {
                      selectedOptions_cat2[4] = 0;
                    }
                    submitCategory();

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Parent_3Social()));
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
