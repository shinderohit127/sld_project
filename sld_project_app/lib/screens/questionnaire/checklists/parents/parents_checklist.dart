import 'package:flutter/material.dart';

class ParentsChecklist extends StatelessWidget {
  const ParentsChecklist({super.key});

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
                'Question 1',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Has any parent (or both parents) of the child ever been diagnosed with a learning disability?',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 3,
                child: ListView(
                  children: const [
                    ListTile(
                      // leading: const Icon(
                      //   Icons.east,
                      //   color: Color(0xFF558B2F),
                      //   size: 32,
                      // ),
                      title: Text("YES"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      // leading: const Icon(
                      //   Icons.east,
                      //   color: Color(0xFF558B2F),
                      //   size: 32,
                      // ),
                      title: Text("NO"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      // leading: const Icon(
                      //   Icons.east,
                      //   color: Color(0xFF558B2F),
                      //   size: 32,
                      // ),
                      title: Text("NOT SURE"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Row(
              //   children: [
              //     Checkbox(
              //       value: _isChecked,
              //       onChanged: (value) {
              //         setState(() {
              //           _isChecked = value!;
              //         });
              //         // print(_isChecked);
              //       },
              //     ),
              //     const Expanded(
              //       child: Text(
              //         "By using our app, you agree to the above disclaimers and acknowledge that you have read and understood them.",
              //       ),
              //     )
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              ElevatedButton(
                onPressed: () {},
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
                child: const Text("Next"),
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
