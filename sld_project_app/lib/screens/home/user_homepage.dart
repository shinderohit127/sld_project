import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sld_project_app/data/data.dart';
import 'package:sld_project_app/model/speciality.dart';
import 'package:sld_project_app/screens/auth_screen/auth_screen.dart';
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

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  UserHomePageState createState() => UserHomePageState();
}

class UserHomePageState extends State<UserHomePage> {
  String childName = "";
  String contactNumber = "";
  String parentName = "";
  String email = "";
  String teacherEmail = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  final userEmail = FirebaseAuth.instance.currentUser!.email;
  // Map<String, dynamic> docRef = {
  //   "childName": "",
  //   "contactNumber": "",
  //   "parentName": "",
  //   "email": "",
  //   "teacherEmail": ""
  // };
  // getData() async {
  //   final db = FirebaseFirestore.instance;
  //   this.docRef = await db
  //       .collection("users")
  //       .doc(userEmail)
  //       .get()
  //       .then((DocumentSnapshot doc) {
  //     final data = doc.data() as Map<String, dynamic>;
  //     print(data);
  //     return data;
  //   });
  //   print(this.docRef["parentName"]);
  // }

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

  // final db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    getData();
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF7EBE1),
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.blue, // Navigation bar
            // statusBarColor: Color(0xffFBB97C), // Status bar
          ),
          iconTheme: const IconThemeData(color: Color(0xFF1B383A)),
          actions: [
            // help view redirect
            IconButton(
              icon: const Icon(Icons.help_outline),
              iconSize: 26,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HelpView(),
                ));
              },
              padding: const EdgeInsets.only(right: 8),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              DrawerHeader(
                child: Text(
                  "Welcome \n$parentName!",
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
              ListTile(
                leading: Image.asset(
                  "assets/logos/sync.png",
                  scale: 1.0,
                  height: 25.0,
                  width: 25.0,
                ),
                title: const Text('Sync your progress here'),
                onTap: () {
                  // Update the state of the app.
                },
              ),
              ListTile(
                  leading: Image.asset(
                    "assets/logos/logout.png",
                    scale: 1.0,
                    height: 25.0,
                    width: 25.0,
                  ),
                  title: const Text('Sign Out'),
                  onTap: () async => {
                        globals.role = "",
                        print("---------- sign out action called ----------"),
                        print(globals.role),
                        await FirebaseAuth.instance.signOut().then((value) {
                          print("sign out success");
                        }).catchError((error) {
                          print("sign out failed");
                        }),
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthScreen()),
                            (route) => false)
                      }),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xffF7EBE1),
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
                      color: const Color(0xffF7EBE1),
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
                  "Screening Phases for \n$childName",
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
                      builder: (context) => const ParentsChecklistDisclaimer(),
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
                          color: Color(0xffCAF3E1),
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
                                  "Checklist for Parents",
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
                                  'Here is a brief description about the checklist. Checklist description needed here.',
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Color(0xff3A7D5F), fontSize: 13),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Progress: 40%",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff3A7D5F),
                                      fontSize: 16),
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
                          color: Color(0xffD6F7FC),
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
                                      color: Color(0xff337889),
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
                                      color: Color(0xff337889), fontSize: 13),
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
                  onTap: () {},
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      width: double.infinity,
                      // margin: const EdgeInsets.only(top: 16, bottom: 16),
                      decoration: BoxDecoration(
                          color: Color(0xffE0DAFE),
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
                                  "Gamified Checklist for Children",
                                  style: TextStyle(
                                      color: Color(0xff7264BC),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  softWrap: true,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "This is a Gamified checklist intented for children to take. Click here to get started",
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Color(0xff7264BC), fontSize: 13),
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
                                  "assets/updated_logos/Gamification-removebg-preview.png",
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
                  onTap: () {},
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      width: double.infinity,
                      // margin: const EdgeInsets.only(top: 16, bottom: 16),
                      decoration: BoxDecoration(
                          color: Color(0xffD2E1FE),
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
                                      color: Color(0xff2550A0),
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
                                      color: Color(0xff2550A0), fontSize: 13),
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
                // Text(
                //   "Doctos",
                //   style: TextStyle(
                //       color: Colors.black87.withOpacity(0.8),
                //       fontSize: 25,
                //       fontWeight: FontWeight.w600),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // DoctorsTile()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signOut() async {
    await _auth.signOut();
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
