import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sld_project_app/screens/reports/report_screen.dart';
import 'package:sld_project_app/globals.dart' as globals;
// import 'package:tflite/tflite.dart';

class ReportTabScreen extends StatefulWidget {
  const ReportTabScreen();

  @override
  State<ReportTabScreen> createState() => _ReportTabScreenState();
}

class _ReportTabScreenState extends State<ReportTabScreen> {
  String childName = "";
  String contactNumber = "";
  String parentName = "";
  String email = "";
  String teacherEmail = "";

  bool isClicked = false;

  DateTime? parentTime;
  DateTime? teacherTime;

  // List<int> input = [
  //   0,
  //   0,
  //   0,
  //   1,
  //   1,
  //   0,
  //   1,
  //   1,
  //   0,
  //   1,
  //   0,
  //   1,
  //   1,
  //   1,
  //   1,
  //   0,
  //   1,
  //   1,
  //   0,
  //   0,
  //   1,
  //   1,
  //   0,
  //   1,
  //   1,
  //   0,
  //   0,
  //   0,
  //   1,
  //   0,
  //   0,
  //   0,
  //   1,
  //   0,
  //   1,
  //   1,
  //   1,
  //   0,
  //   0,
  //   1,
  //   0,
  //   1,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   1,
  //   0,
  //   1,
  //   0,
  //   0,
  //   1,
  //   0,
  //   0,
  //   1,
  //   0,
  //   0,
  //   0,
  //   1,
  //   1,
  //   1,
  //   1,
  //   0,
  //   0,
  //   1,
  //   1,
  //   0,
  //   0,
  //   0,
  //   1,
  //   0,
  //   1,
  //   1,
  //   0,
  //   1,
  //   0,
  //   0,
  //   1,
  //   1,
  //   1,
  //   1,
  //   0,
  //   1,
  //   0,
  //   0,
  //   1,
  //   0,
  //   1,
  //   0,
  //   1,
  //   1,
  //   1,
  //   0,
  //   1,
  //   1,
  //   1,
  //   0,
  //   1,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   1,
  //   0,
  //   1,
  //   1,
  //   1,
  //   0,
  //   0,
  //   1,
  //   1,
  //   1,
  //   0
  // ];

  String model = "assets/model/model.tflite";

  // List<ScoreCategory> scores = [
  //   ScoreCategory(categoryName: 'Category 1', score: 0.6),
  //   ScoreCategory(categoryName: 'Category 2', score: 0.3),
  //   ScoreCategory(categoryName: 'Category 3', score: 0.8),
  //   ScoreCategory(categoryName: 'Category 4', score: 0.2),
  //   ScoreCategory(categoryName: 'Category 5', score: 0.5),
  // ];

  @override
  void initState() {
    super.initState();
    getData();
    // loadModel();
  }

  // void loadModel() async {
  //   await Tflite.loadModel(model: model);
  //   classifyInput();
  // }

  // void classifyInput() async {
  //   var output =
  //       await Tflite.runModelOnBinary(binary: Uint8List.fromList(input));
  //   var probabilities = output![0];
  //   for (int i = 0; i < probabilities.length; i++) {
  //     print("Probability of class $i: ${probabilities[i]}");
  //   }
  // }

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  Future<void> getData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userEmail)
        .get();
    if (snapshot.exists) {
      final data = snapshot.data();
      if (mounted) {
        setState(() {
          childName = data!["childName"];
          contactNumber = data["contactNumber"];
          parentName = data["parentName"];
          email = data["email"];
          teacherEmail = data["teacherEmail"];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7EBE1),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "Welcome!",
                  style: TextStyle(
                      color: Color(0xFF1B383A),
                      fontSize: 35,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "$userEmail",
                  style: TextStyle(
                      color: Color(0xFF1B383A),
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Check out your reports here",
                  style: TextStyle(
                    color: Color(0xFF1B383A),
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isClicked = true;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ReportScreen()));
                    });
                    print(isClicked);
                    // Tflite.loadModel(model: 'assets/model.tflite');
                    // List<int> userResponseData = [
                    //   0,
                    //   0,
                    //   0,
                    //   1,
                    //   1,
                    //   0,
                    //   1,
                    //   1,
                    //   0,
                    //   1,
                    //   0,
                    //   1,
                    //   1,
                    //   1,
                    //   1,
                    //   0,
                    //   1,
                    //   1,
                    //   0,
                    //   0,
                    //   1,
                    //   1,
                    //   0,
                    //   1,
                    //   1,
                    //   0,
                    //   0,
                    //   0,
                    //   1,
                    //   0,
                    //   0,
                    //   0,
                    //   1,
                    //   0,
                    //   1,
                    //   1,
                    //   1,
                    //   0,
                    //   0,
                    //   1,
                    //   0,
                    //   1,
                    //   0,
                    //   0,
                    //   0,
                    //   0,
                    //   0,
                    //   0,
                    //   1,
                    //   0,
                    //   1,
                    //   0,
                    //   0,
                    //   1,
                    //   0,
                    //   0,
                    //   1,
                    //   0,
                    //   0,
                    //   0,
                    //   1,
                    //   1,
                    //   1,
                    //   1,
                    //   0,
                    //   0,
                    //   1,
                    //   1,
                    //   0,
                    //   0,
                    //   0,
                    //   1,
                    //   0,
                    //   1,
                    //   1,
                    //   0,
                    //   1,
                    //   0,
                    //   0,
                    //   1,
                    //   1,
                    //   1,
                    //   1,
                    //   0,
                    //   1,
                    //   0,
                    //   0,
                    //   1,
                    //   0,
                    //   1,
                    //   0,
                    //   1,
                    //   1,
                    //   1,
                    //   0,
                    //   1,
                    //   1,
                    //   1,
                    //   0,
                    //   1,
                    //   0,
                    //   0,
                    //   0,
                    //   0,
                    //   0,
                    //   0,
                    //   1,
                    //   0,
                    //   1,
                    //   1,
                    //   1,
                    //   0,
                    //   0,
                    //   1,
                    //   1,
                    //   1,
                    //   0
                    // ];
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const ParentsChecklistDisclaimer(),
                    // ));
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      width: double.infinity,
                      // margin: const EdgeInsets.only(top: 16, bottom: 16),
                      decoration: BoxDecoration(
                          color: Color(0xffCAF3E1),
                          borderRadius: BorderRadius.circular(24)),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Report",
                                  style: TextStyle(
                                      color: Color(0xff3A7D5F),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  softWrap: true,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Parent checklist filled by:',
                                  softWrap: true,
                                  style: TextStyle(
                                    color: Color(0xff3A7D5F),
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  '$userEmail',
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Color(0xff3A7D5F),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                // Text(
                                //   'Completed on:',
                                //   softWrap: true,
                                //   style: TextStyle(
                                //       color: Color(0xff3A7D5F), fontSize: 13),
                                // ),
                                // Text(
                                //   '24th March 2023 11:30 AM',
                                //   softWrap: true,
                                //   style: TextStyle(
                                //       color: Color(0xff3A7D5F),
                                //       fontSize: 13,
                                //       fontWeight: FontWeight.w600),
                                // ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Teacher checklist filled by:',
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Color(0xff3A7D5F), fontSize: 13),
                                ),
                                Text(
                                  'teacher_email@gmail.com',
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Color(0xff3A7D5F),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                // Text(
                                //   'Completed on:',
                                //   softWrap: true,
                                //   style: TextStyle(
                                //       color: Color(0xff3A7D5F), fontSize: 13),
                                // ),
                                // Text(
                                //   '23rd March 2023 11:30 AM',
                                //   softWrap: true,
                                //   style: TextStyle(
                                //       color: Color(0xff3A7D5F),
                                //       fontSize: 13,
                                //       fontWeight: FontWeight.w600),
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Click here to generate report",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff3A7D5F),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/updated_logos/My_reports-removebg-preview.png",
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.fitHeight,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.of(context).push(MaterialPageRoute(
                //     //   builder: (context) => const ParentsChecklistDisclaimer(),
                //     // ));
                //   },
                //   child: Card(
                //     elevation: 5,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(24)),
                //     child: Container(
                //       width: double.infinity,
                //       // margin: const EdgeInsets.only(top: 16, bottom: 16),
                //       decoration: BoxDecoration(
                //           color: Color(0xffD6F7FC),
                //           borderRadius: BorderRadius.circular(24)),
                //       padding: const EdgeInsets.all(16),
                //       child: Row(
                //         children: [
                //           Expanded(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   "Report",
                //                   style: TextStyle(
                //                       color: Color(0xff3A7D5F),
                //                       fontSize: 20,
                //                       fontWeight: FontWeight.bold),
                //                   softWrap: true,
                //                 ),
                //                 SizedBox(
                //                   height: 6,
                //                 ),
                //                 Text(
                //                   'Parent checklist filled by:',
                //                   softWrap: true,
                //                   style: TextStyle(
                //                     color: Color(0xff3A7D5F),
                //                     fontSize: 13,
                //                   ),
                //                 ),
                //                 Text(
                //                   '$userEmail',
                //                   softWrap: true,
                //                   style: TextStyle(
                //                       color: Color(0xff3A7D5F),
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.w600),
                //                 ),
                //                 Text(
                //                   'Completed on:',
                //                   softWrap: true,
                //                   style: TextStyle(
                //                       color: Color(0xff3A7D5F), fontSize: 13),
                //                 ),
                //                 Text(
                //                   '24th March 2023 11:30 AM',
                //                   softWrap: true,
                //                   style: TextStyle(
                //                       color: Color(0xff3A7D5F),
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.w600),
                //                 ),
                //                 SizedBox(
                //                   height: 12,
                //                 ),
                //                 Text(
                //                   'Teacher checklist filled by:',
                //                   softWrap: true,
                //                   style: TextStyle(
                //                       color: Color(0xff3A7D5F), fontSize: 13),
                //                 ),
                //                 Text(
                //                   '$teacherEmail',
                //                   softWrap: true,
                //                   style: TextStyle(
                //                       color: Color(0xff3A7D5F),
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.w600),
                //                 ),
                //                 Text(
                //                   'Completed on:',
                //                   softWrap: true,
                //                   style: TextStyle(
                //                       color: Color(0xff3A7D5F), fontSize: 13),
                //                 ),
                //                 Text(
                //                   '23rd March 2023 11:30 AM',
                //                   softWrap: true,
                //                   style: TextStyle(
                //                       color: Color(0xff3A7D5F),
                //                       fontSize: 13,
                //                       fontWeight: FontWeight.w600),
                //                 ),
                //                 SizedBox(
                //                   height: 10,
                //                 ),
                //                 Text(
                //                   "Click here to generate report",
                //                   style: TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       color: Color(0xff3A7D5F),
                //                       fontSize: 20),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Expanded(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.end,
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Image.asset(
                //                   "assets/updated_logos/My_reports-removebg-preview.png",
                //                   height: 120,
                //                   width: 120,
                //                   fit: BoxFit.fitHeight,
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Text("---------------- DEBUG ----------------------"),
                // Text("Test data for demonstration"),
                // Text(
                //     "[0,0,0,1,1,0,1,1,0,1,0,1,1,1,1,0,1,1,0,0,1,1,0,1,1,0,0,0,1,0,0,0,1,0,1,1,1,0,0,1,0,1,0,0,0,0,0,0,1,0,1,0,0,1,0,0,1,0,0,0,1,1,1,1,0,0,1,1,0,0,0,1,0,1,1,0,1,0,0,1,1,1,1,0,1,0,0,1,0,1,0,1,1,1,0,1,1,1,0,1,0,0,0,0,0,0,1,0,1,1,1,0,0,1,1,1,0]"),
                // Visibility(
                //   child: Text("output text"),
                //   visible: isClicked,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
