import 'package:flutter/material.dart';

class Parent_2Emotional extends StatefulWidget {
  @override
  _Parent_2EmotionalState createState() => _Parent_2EmotionalState();
}

class _Parent_2EmotionalState extends State<Parent_2Emotional> {
  String _selectedOption1 = '';
  String _selectedOption2 = '';
  String _selectedOption3 = '';
  String _selectedOption4 = '';

  List<int> selectedOptions_cat2 = [];

  void submitCategory() {
    print(selectedOptions_cat2);
  }

  final List<String> _options = ['YES', 'NO'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Category 2: Emotional Dysregulation',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  '1. Does the child often express anxiety or frustration?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Question 2',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Question 3',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Question 4',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      selectedOptions_cat2.add(1);
                    } else {
                      selectedOptions_cat2.add(0);
                    }
                    if (_selectedOption2 == "YES") {
                      selectedOptions_cat2.add(1);
                    } else {
                      selectedOptions_cat2.add(0);
                    }
                    if (_selectedOption3 == "YES") {
                      selectedOptions_cat2.add(1);
                    } else {
                      selectedOptions_cat2.add(0);
                    }
                    if (_selectedOption4 == "YES") {
                      selectedOptions_cat2.add(1);
                    } else {
                      selectedOptions_cat2.add(0);
                    }
                    print(selectedOptions_cat2);
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
