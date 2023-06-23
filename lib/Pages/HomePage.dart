import 'package:flutter/material.dart';
import 'package:insuranceapp/CallUs/callUs.dart';
import 'package:insuranceapp/Map/mapScreen.dart';
import 'package:insuranceapp/Pages/carin/carinsuhome.dart';

import 'package:insuranceapp/Pages/completeProfile.dart';
import 'package:insuranceapp/Pages/constants.dart';
import 'package:insuranceapp/Pages/healthin/hinsuhome.dart';
import 'package:insuranceapp/Towing/towingService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kAppbarBackground,
          title: const Text(
            "Dashboard",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 4,
        ),
        body: Column(children: [
          Container(
            color: Colors.lightBlue.shade50,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Insurance Program",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InsuranceProgramGrid(
                          image: 'assets/images/healthInsuranceD.png',
                          insuranceProgramTitle: 'Health Insurance',
                          insuranceHomeRoute: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HealthInsuHome()));
                          },
                        ),
                        InsuranceProgramGrid(
                          image: 'assets/images/carInsuranceD.png',
                          insuranceProgramTitle: 'Car Insurance',
                          insuranceHomeRoute: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarInsuHome()));
                          },
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),

          //  ------------------------ Emergency Program ----------------

          Expanded(
            child: Container(
              color: Colors.green.shade50.withOpacity(.5),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: const Text(
                      "Emergency Program",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  EmergencyProgramTile(
                      title: 'Ambulance',
                      tileRoute: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapScreen()));
                      }),
                  const SizedBox(
                    height: 25,
                  ),
                  EmergencyProgramTile(
                    title: 'Towing Services',
                    tileRoute: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TowingService()));
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  EmergencyProgramTile(
                      title: 'Emergency Contact',
                      tileRoute: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CallUs()));
                      }),
                  const SizedBox(
                    height: 25,
                  ),
                  EmergencyProgramTile(
                    title: 'Complete Profile',
                    tileRoute: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => completeProfile()));
                    },
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}

class InsuranceProgramGrid extends StatelessWidget {
  final String insuranceProgramTitle;
  final VoidCallback insuranceHomeRoute;
  final String image;

  InsuranceProgramGrid(
      {required this.insuranceProgramTitle,
      required this.insuranceHomeRoute,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      child: GestureDetector(
        onTap: insuranceHomeRoute,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                image,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(insuranceProgramTitle),
          ],
        ),
      ),
    );
  }
}

class EmergencyProgramTile extends StatelessWidget {
  final String title;
  VoidCallback tileRoute;
  EmergencyProgramTile({required this.title, required this.tileRoute});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      color: const Color.fromARGB(255, 183, 238, 255),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: GestureDetector(
          onTap: tileRoute,
          child: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
