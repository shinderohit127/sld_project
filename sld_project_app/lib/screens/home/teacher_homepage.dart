import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sld_project_app/data/data.dart';
import 'package:sld_project_app/model/speciality.dart';
import 'package:sld_project_app/screens/help/help_view.dart';
import 'package:flutter/services.dart';
import 'package:sld_project_app/screens/info_page/sld_info.dart';
import 'package:sld_project_app/screens/profile/profile_view.dart';
import 'package:sld_project_app/screens/questionnaire/disclaimers/parent_checklist_disclaimer.dart';
import 'package:sld_project_app/screens/questionnaire/disclaimers/teachers_checklist_disclaimer.dart';

//globals
import 'package:sld_project_app/globals.dart' as globals;

// firebase database
import 'package:firebase_database/firebase_database.dart';

import '../reports/report_tab_screen.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key});

  @override
  TeacherHomePageState createState() => TeacherHomePageState();
}

class TeacherHomePageState extends State<TeacherHomePage> {
  String name = "";
  String contactNumber = "";
  String email = "";
  List students = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  Future<void> getData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('teachers')
        .doc(userEmail)
        .get();
    if (snapshot.exists) {
      final data = snapshot.data();
      if (mounted) {
        setState(() {
          name = data!["name"];
          contactNumber = data["contactNumber"];
          email = data["email"];
          students = data["students"];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFFFDC5),
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              // systemNavigationBarColor: Colors.blue, // Navigation bar
              // statusBarColor: Color(0xffFBB97C), // Status bar
              ),
          iconTheme: const IconThemeData(color: Color(0xFF1B383A)),
          // actions: [
          //   // help view redirect
          //   IconButton(
          //     icon: const Icon(Icons.help_outline),
          //     iconSize: 26,
          //     onPressed: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => const HelpView(),
          //       ));
          //     },
          //     padding: const EdgeInsets.only(right: 8),
          //   ),
          // ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              DrawerHeader(
                child: Text(
                  "Welcome \n$name!",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Profile'),
                leading: Image.asset(
                  "assets/logos/profile.png",
                  scale: 1.0,
                  height: 25.0,
                  width: 25.0,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfileView(),
                  ));
                },
              ),
              // ListTile(
              //   leading: Image.asset(
              //     "assets/logos/sync.png",
              //     scale: 1.0,
              //     height: 25.0,
              //     width: 25.0,
              //   ),
              //   title: const Text('Sync your progress here'),
              //   onTap: () {
              //     // Update the state of the app.
              //   },
              // ),
              ListTile(
                  leading: Image.asset(
                    "assets/logos/logout.png",
                    scale: 1.0,
                    height: 25.0,
                    width: 25.0,
                  ),
                  title: const Text('Sign Out'),
                  onTap: () => {
                        globals.role = "",
                        FirebaseAuth.instance.signOut(),
                      }),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xffFFFDC5),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Find Your Consultation",
                  style: TextStyle(
                      color: Color(0xFF1B383A),
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFDC5),
                      borderRadius: BorderRadius.circular(14)),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search here",
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(20),
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Screening Phases",
                  style: TextStyle(
                      color: Color(0xFF1B383A),
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TeacherChecklistDisclaimer(),
                    ));
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Container(
                      width: double.infinity,
                      // margin: const EdgeInsets.only(top: 16, bottom: 16),
                      decoration: BoxDecoration(
                          color: Color(0xffFFD998),
                          borderRadius: BorderRadius.circular(24)),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Checklist for Teachers",
                                  style: TextStyle(
                                      color: Color(0xffCC630B),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  softWrap: true,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "This checklist is a tool designed to help teachers screen their students for signs of Specific Learning Disabilities (SLDs) at an early stage.",
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Color(0xffCC630B), fontSize: 13),
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                // Text(
                                //   "Progress: 70%",
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       color: Color(0xffCC630B),
                                //       fontSize: 16),
                                // ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/updated_logos/Checklists-removebg-preview.png",
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SLDInfoView(),
                    ));
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      width: double.infinity,
                      // margin: const EdgeInsets.only(top: 16, bottom: 16),
                      decoration: BoxDecoration(
                          color: Color(0xffFED2D2),
                          borderRadius: BorderRadius.circular(24)),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "General Information about Specific Learning Disabilities",
                                  style: TextStyle(
                                      color: Color(0xff721313),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  softWrap: true,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Find out more about SLDs. Click here to get started",
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Color(0xff721313), fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/updated_logos/General_Information-removebg-preview.png",
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ReportTabScreen()));
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      width: double.infinity,
                      // margin: const EdgeInsets.only(top: 16, bottom: 16),
                      decoration: BoxDecoration(
                          color: Color(0xffFDD7B1),
                          borderRadius: BorderRadius.circular(24)),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "My Reports",
                                  style: TextStyle(
                                      color: Color(0xff634D37),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  softWrap: true,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Check your reports here",
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Color(0xff634D37), fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SpecialistTile extends StatelessWidget {
  final String? imgAssetPath;
  final String? speciality;
  final String? description;
  final Color? backColor;
  SpecialistTile(
      {required this.imgAssetPath,
      required this.speciality,
      required this.description,
      required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(24)),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            speciality!,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            description!,
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          Image.asset(
            imgAssetPath!,
            height: 160,
            fit: BoxFit.fitHeight,
          )
        ],
      ),
    );
  }
}
