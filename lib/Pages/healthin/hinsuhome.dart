import 'package:flutter/material.dart';
import 'package:insuranceapp/Pages/healthin/healthp1.dart';
import 'package:insuranceapp/Pages/healthin/healthp2.dart';
import 'package:insuranceapp/Pages/healthin/healthp3.dart';
import 'package:insuranceapp/chatbot/chatbot.dart';

class HealthInsuHome extends StatefulWidget {
  const HealthInsuHome({super.key});

  @override
  State<HealthInsuHome> createState() => _HealthInsuHomeState();
}

class _HealthInsuHomeState extends State<HealthInsuHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 183, 238, 255),
        title: const Text(
          "Choose One Package",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        color: Colors.lightBlue.shade50,
        child: Column(children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 250,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Hp1()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image.asset(
                              'assets/images/50.png',
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              alignment: Alignment.center,
                              color: const Color.fromARGB(255, 148, 195, 248),
                              height: 50,
                              width: 250,
                              child: const Text('1st Party Insurance'))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 250,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Hp2()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image.asset(
                              'assets/images/25.png',
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              alignment: Alignment.center,
                              color: const Color.fromARGB(255, 148, 195, 248),
                              height: 50,
                              width: 250,
                              child: const Text('2nd Party Insurance'))
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: 150,
            height: 250,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Hp3()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/images/15.png',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      alignment: Alignment.center,
                      color: const Color.fromARGB(255, 148, 195, 248),
                      height: 50,
                      width: 250,
                      child: const Text('3rd Party Insurance'))
                ],
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatBot()));
        },
        child: Icon(
          Icons.help_outline_sharp,
        ),
        backgroundColor: const Color.fromARGB(255, 183, 238, 255),
      ),
    );
  }
}

// class InsuracePackageCard extends StatelessWidget {
//   VoidCallback route;
//   final String priceInText;
//   final String imagelink;

//   InsuracePackageCard(
//       {required this.priceInText,
//       required this.imagelink,
//       required this.route});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       height: 250,
//       child: GestureDetector(
//         onTap: () {
//           route;
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Flexible(
//               child: Image.asset(
//                 imagelink,
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Container(
//                 alignment: Alignment.center,
//                 color: Color.fromARGB(255, 148, 195, 248),
//                 height: 50,
//                 width: 250,
//                 child: Text(priceInText))
//           ],
//         ),
//       ),
//     );
//   }
// }
