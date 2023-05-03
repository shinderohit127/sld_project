import 'package:flutter/material.dart';

class SLDInfoView extends StatelessWidget {
  const SLDInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF7EB),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Card(
                elevation: 5,
                child: Image.asset(
                  "assets/1443.jpg",
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "What are SLDs ?",
                style: TextStyle(fontSize: 32, color: Color(0xFF1B383A)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Specific learning disabilities (SLDs) refer to a group of disorders that can affect a child's ability to read, write, do the math, and speak. These disorders are neurologically based and can occur in children with average intelligence and adequate schooling.",
                style: TextStyle(fontSize: 18, color: Color(0xFF1B383A)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Some of the most common SLDs include dyslexia, dysgraphia, dyscalculia, and language processing disorder. Dyslexia is a disorder that affects a child's ability to read, dysgraphia affects a child's ability to write, and dyscalculia affects a child's ability to do the math. Language processing disorder affects a child's ability to process and understand spoken language.",
                style: TextStyle(fontSize: 18, color: Color(0xFF1B383A)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Children with SLDs often struggle in school and may experience difficulties with basic academic tasks, such as reading, writing, and math. They may also experience social and emotional difficulties, which can impact their self-esteem and overall well-being.",
                style: TextStyle(fontSize: 18, color: Color(0xFF1B383A)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Early identification and intervention are important for children with SLDs. With the right support and accommodations, children with SLDs can learn and succeed in school and in life. Our app is designed to help identify potential SLDs in children and provide guidance for addressing them. It is not a substitute for a professional assessment or diagnosis but can be used as a screening tool to gain valuable insights into a child's learning abilities.",
                style: TextStyle(fontSize: 18, color: Color(0xFF1B383A)),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
