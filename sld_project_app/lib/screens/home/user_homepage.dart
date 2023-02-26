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

// firebase database
import 'package:firebase_database/firebase_database.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  UserHomePageState createState() => UserHomePageState();
}

class UserHomePageState extends State<UserHomePage> {
  @override
  void initState() {
    super.initState();
  }

  final userEmail = FirebaseAuth.instance.currentUser!.email;
  Map<String, dynamic> docRef = {
    "childName": "",
    "contactNumber": "",
    "parentName": "",
    "email": "",
    "teacherEmail": ""
  };
  getData() async {
    final db = FirebaseFirestore.instance;
    this.docRef = await db
        .collection("users")
        .doc(userEmail)
        .get()
        .then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print(data);
      return data;
    });
    print(this.docRef["parentName"]);
  }

  // final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
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
                "Welcome \n${this.docRef["parentName"]}!",
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
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
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
                "Screening Phases",
                style: TextStyle(
                    color: Color(0xFF1B383A),
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ParentsChecklistDisclaimer(),
                  ));
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  decoration: BoxDecoration(
                      color: Color(0xffFBB97C),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              softWrap: true,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Here is a brief description about the checklist. Checklist description needed here.',
                              softWrap: true,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Progress: 40%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                              "assets/img1.png",
                              height: 160,
                              fit: BoxFit.fitHeight,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SLDInfoView(),
                  ));
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  decoration: BoxDecoration(
                      color: Color(0xffEACBCB),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              softWrap: true,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Find out more about SLDs. Click here to get started",
                              softWrap: true,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
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
                              "assets/img3.png",
                              height: 160,
                              fit: BoxFit.fitHeight,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  decoration: BoxDecoration(
                      color: Color(0xffFBB97C),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              softWrap: true,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "This is a Gamified checklist intented for children to take. Click here to get started",
                              softWrap: true,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
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
                              "assets/img2.png",
                              height: 160,
                              fit: BoxFit.fitHeight,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  decoration: BoxDecoration(
                      color: Colors.pink[200],
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              softWrap: true,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Check your reports here",
                              softWrap: true,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
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
                              "assets/img1.png",
                              height: 160,
                              fit: BoxFit.fitHeight,
                            ),
                          ],
                        ),
                      ),
                    ],
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
