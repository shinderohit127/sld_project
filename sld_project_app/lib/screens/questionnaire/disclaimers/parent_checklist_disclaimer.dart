import 'package:flutter/material.dart';
import 'package:sld_project_app/screens/questionnaire/checklists/parents/parents_checklist.dart';

class ParentsChecklistDisclaimer extends StatefulWidget {
  const ParentsChecklistDisclaimer({super.key});

  @override
  State<ParentsChecklistDisclaimer> createState() =>
      _ParentsChecklistDisclaimerState();
}

class _ParentsChecklistDisclaimerState
    extends State<ParentsChecklistDisclaimer> {
  bool _isChecked = false;
  @override
  void initState() {
    super.initState();
    // bool _isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Disclaimer',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Please read the information given below carefully',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 8,
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.east,
                        color: Color(0xFF558B2F),
                        size: 32,
                      ),
                      title: RichText(
                        text: const TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Disclaimer of Medical Advice\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text:
                                  'Our app is designed to provide information and insights into potential learning disabilities in children. However, it is not intended to replace professional medical advice or diagnosis. It is important to consult with a qualified healthcare provider if you have any concerns about your child\'s health or learning abilities.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.east,
                        color: Color(0xFF558B2F),
                        size: 32,
                      ),
                      title: RichText(
                        text: const TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'No Guarantee of Accuracy\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text:
                                  'While we have taken every effort to ensure the accuracy of our app, we cannot guarantee that the results are 100% accurate. Our app is not a substitute for a professional assessment and is meant to be used only as a screening tool.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.east,
                        color: Color(0xFF558B2F),
                        size: 32,
                      ),
                      title: RichText(
                        text: const TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Limitations of the App\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text:
                                  'Our app is not a comprehensive evaluation of a child\'s learning abilities. It is designed to detect specific learning disabilities and is not intended to be used as a diagnostic tool for other developmental or cognitive disorders.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.east,
                        color: Color(0xFF558B2F),
                        size: 32,
                      ),
                      title: RichText(
                        text: const TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Privacy and Data Protection\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text:
                                  'We take privacy and data protection very seriously. We will not share any personal information about you or your child with third parties without your consent. However, it is important to note that the app collects data for research purposes and may use it to improve the app\'s functionality.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.east,
                        color: Color(0xFF558B2F),
                        size: 32,
                      ),
                      title: RichText(
                        text: const TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Parental Supervision\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text:
                                  'Children under the age of 18 should only use this app under the supervision of a parent or guardian. It is important to ensure that the child fully understands the purpose of the app and how to use it before starting the screening process.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                      // print(_isChecked);
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "By using our app, you agree to the above disclaimers and acknowledge that you have read and understood them.",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_isChecked) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ParentsChecklist(),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please tick the checkbox to proceed"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(16.0),
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(355, 40)),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF558B2F)),
                ),
                child: const Text("Continue to Checklist"),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
