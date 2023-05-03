import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sld_project_app/screens/questionnaire/checklists/parents/parent_2emotional.dart';

class Parent_1Family extends StatefulWidget {
  @override
  _Parent_1FamilyState createState() => _Parent_1FamilyState();
}

class _Parent_1FamilyState extends State<Parent_1Family> {
  String _selectedOption1 = '';
  String _selectedOption2 = '';
  String _selectedOption3 = '';
  String _selectedOption4 = '';
  String _selectedOption5 = '';
  String _selectedOption6 = '';
  String _selectedOption7 = '';
  String _selectedOption8 = '';
  String _selectedOption9 = '';
  String _selectedOption10 = '';
  String _selectedOption11 = '';
  String _selectedOption12 = '';

  List<int> selectedOptions_cat1 = List.generate(12, (_) => 0);

  void submitCategory() {
    print(selectedOptions_cat1);
    print(progressCounter);
  }

  int progressCounter = 0;

  final userEmail = FirebaseAuth.instance.currentUser!.email;
  void updateProgress(Map<String, dynamic> progress) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(userEmail)
        .set({'progress': progress});
  }

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
                  'Category 1: Family History and Development',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B383A)),
                ),
                const SizedBox(height: 16),
                Text(
                  '1. Has any parent (or both parents) of the child ever been diagnosed with a learning disability?',
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
                  '2. Has any parent (or both parents) of the child been diagnosed with any neurodevelopmental disorder(s) like Autism, ADHD, AuADHD, etc?',
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
                  '3. Has any sibling (or siblings) of the child ever been diagnosed with a learning disability?',
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
                  '4. Has any sibling (or siblings) been diagnosed with any neurodevelopmental disorder(s) like Autism, ADHD, AuADHD, etc?',
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
                  '5. Does the child have any physical disabilities or handicaps?',
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

                // QUESTION 6
                Text(
                  '6. Does the child have any intellectual disability?',
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

                // QUESTION 7
                Text(
                  '7. Is the child hearing impaired?',
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
                    groupValue: _selectedOption7,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption7 = value!;
                        progressCounter++;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),

                // QUESTION 8
                Text(
                  '8. Does the child have eyesight problems?',
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
                    groupValue: _selectedOption8,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption8 = value!;
                        progressCounter++;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),

                // QUESTION 9
                Text(
                  '9. Does the child have speech problems?',
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
                    groupValue: _selectedOption9,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption9 = value!;
                        progressCounter++;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),

                // QUESTION 10
                Text(
                  '10. Has the child been diagnosed with any neurodevelopmental disorder(s) like Autism, ADHD, AuADHD, etc?',
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
                    groupValue: _selectedOption10,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption10 = value!;
                        progressCounter++;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),

                // QUESTION 11
                Text(
                  '11. Has the child ever experienced/witnessed any traumatic event(s) like the death of someone close to them, separation or divorce of parents, any forms of abuse, etc?',
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
                    groupValue: _selectedOption11,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption11 = value!;
                        progressCounter++;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),

                // QUESTION 12
                Text(
                  '12. Has the child ever been diagnosed with any anxiety disorders?',
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
                    groupValue: _selectedOption12,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption12 = value!;
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
                      selectedOptions_cat1[0] = 1;
                    } else {
                      selectedOptions_cat1[0] = 0;
                    }
                    if (_selectedOption2 == "YES") {
                      selectedOptions_cat1[1] = 1;
                    } else {
                      selectedOptions_cat1[1] = 0;
                    }
                    if (_selectedOption3 == "YES") {
                      selectedOptions_cat1[2] = 1;
                    } else {
                      selectedOptions_cat1[2] = 0;
                    }
                    if (_selectedOption4 == "YES") {
                      selectedOptions_cat1[3] = 1;
                    } else {
                      selectedOptions_cat1[3] = 0;
                    }
                    if (_selectedOption5 == "YES") {
                      selectedOptions_cat1[4] = 1;
                    } else {
                      selectedOptions_cat1[4] = 0;
                    }
                    if (_selectedOption6 == "YES") {
                      selectedOptions_cat1[5] = 1;
                    } else {
                      selectedOptions_cat1[5] = 0;
                    }
                    if (_selectedOption7 == "YES") {
                      selectedOptions_cat1[6] = 1;
                    } else {
                      selectedOptions_cat1[6] = 0;
                    }
                    if (_selectedOption8 == "YES") {
                      selectedOptions_cat1[7] = 1;
                    } else {
                      selectedOptions_cat1[7] = 0;
                    }
                    if (_selectedOption9 == "YES") {
                      selectedOptions_cat1[8] = 1;
                    } else {
                      selectedOptions_cat1[8] = 0;
                    }
                    if (_selectedOption10 == "YES") {
                      selectedOptions_cat1[9] = 1;
                    } else {
                      selectedOptions_cat1[9] = 0;
                    }
                    if (_selectedOption11 == "YES") {
                      selectedOptions_cat1[10] = 1;
                    } else {
                      selectedOptions_cat1[10] = 0;
                    }
                    if (_selectedOption12 == "YES") {
                      selectedOptions_cat1[11] = 1;
                    } else {
                      selectedOptions_cat1[11] = 0;
                    }
                    submitCategory();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Parent_2Emotional()));
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
