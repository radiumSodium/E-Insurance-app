import 'package:flutter/material.dart';
import 'package:insuranceapp/Pages/carin/carpack1.dart';
import 'package:insuranceapp/Pages/carin/carpack2.dart';
import 'package:insuranceapp/Pages/carin/carpack3.dart';
import 'package:insuranceapp/chatbot/chatbot.dart';
import 'package:insuranceapp/chatbot/chatbotConstants.dart';

class CarInsuHome extends StatefulWidget {
  const CarInsuHome({super.key});

  @override
  State<CarInsuHome> createState() => _CarInsuHomeState();
}

class _CarInsuHomeState extends State<CarInsuHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 183, 238, 255),
        title: Text(
          "Choose One Package",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        color: kAppBarColor.withOpacity(.3),
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
                            MaterialPageRoute(builder: (context) => Cp1()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image.asset(
                              "assets/images/15.png",
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              alignment: Alignment.center,
                              color: Color.fromARGB(255, 148, 195, 248),
                              height: 50,
                              width: 250,
                              child: Text("15  RMT"))
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
                            MaterialPageRoute(builder: (context) => Cp2()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image.asset(
                              "assets/images/25.png",
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              alignment: Alignment.center,
                              color: Color.fromARGB(255, 148, 195, 248),
                              height: 50,
                              width: 250,
                              child: Text("25  RMT"))
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
                    context, MaterialPageRoute(builder: (context) => Cp3()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      "assets/images/50.png",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      alignment: Alignment.center,
                      color: Color.fromARGB(255, 148, 195, 248),
                      height: 50,
                      width: 250,
                      child: Text("50  RMT"))
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
        child: Icon(Icons.help_outline_rounded),
        backgroundColor: Color.fromARGB(255, 183, 238, 255),
      ),
    );
  }
}
