import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sld_project_app/globals.dart';
import 'package:sld_project_app/screens/questionnaire/checklists/parents/parent_8listening.dart';

class Parent_7Spatial extends StatefulWidget {
  @override
  _Parent_7SpatialState createState() => _Parent_7SpatialState();
}

class _Parent_7SpatialState extends State<Parent_7Spatial> {
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
                  'Category 7: Spatial and Directional',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B383A)),
                ),
                const SizedBox(height: 16),
                Text(
                  '1. Does the child often confuse their left and right hands/feet, etc?',
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
                  '2. Does the child often confuse left and right in the sense of directions, i.e while on the street, or while pointing out the relative positions of objects?',
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
                  "3. Is the child familiar with their daily travel routes, like the general route to school (if their school is not too far from their home), the directions to their friend's close relative's house (whom they visit often), the route to their extracurricular classes (tuitions, sports coaching, art class, dance class, etc)?",
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
                  '4. Does the child find it hard to judge speed and distance?',
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
                  '5. Does the child have trouble learning their way around a new place; or are they easily lost or confused in unfamiliar surroundings?',
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
                        builder: (context) => Parent_8Listening()));
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
