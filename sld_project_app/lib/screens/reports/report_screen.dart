import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportScreen extends StatefulWidget {
  ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final List<ScoreCategory> categories = [
    ScoreCategory(categoryName: 'Normal', score: 0.8944334),
    ScoreCategory(categoryName: 'Dyslexia', score: 0.23203345),
    ScoreCategory(categoryName: 'Dyscalculia', score: 0.01989391),
    ScoreCategory(categoryName: 'Dysgraphia', score: 0.3383573),
    ScoreCategory(categoryName: 'Dyspraxia', score: 0.05409073),
  ];

  String childName = "";
  String contactNumber = "";
  String parentName = "";
  String email = "";
  String teacherEmail = "";

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
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          height: 900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Report For test child name',
                style: TextStyle(
                    color: Color(0xFF1B383A),
                    fontSize: 35,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Scores by Category',
                style: TextStyle(
                    color: Color(0xFF1B383A),
                    fontSize: 35,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: charts.BarChart(
                  _createSeriesData(),
                  animate: true,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "test child name is most prone to being NORMAL",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Recommended Actions:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<charts.Series<ScoreCategory, String>> _createSeriesData() {
    List<ScoreCategory> data = categories;

    return [
      charts.Series<ScoreCategory, String>(
        id: 'Scores',
        domainFn: (ScoreCategory score, _) => score.categoryName,
        measureFn: (ScoreCategory score, _) => score.score,
        data: data,
        labelAccessorFn: (ScoreCategory score, _) => '${score.score}',
      )
    ];
  }
}

class ScoreCategory {
  final String categoryName;
  final double score;

  ScoreCategory({required this.categoryName, required this.score});
}
