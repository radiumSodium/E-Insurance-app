import 'package:flutter/material.dart';
import 'package:insuranceapp/Pages/constants.dart';
import 'package:insuranceapp/Pages/healthin/healthInsuForm3.dart';
import 'package:insuranceapp/chatbot/chatbotConstants.dart';

class Hp3 extends StatefulWidget {
  const Hp3({super.key});

  @override
  State<Hp3> createState() => _Hp3State();
}

class _Hp3State extends State<Hp3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 183, 238, 255),
        title: Text(
          "Tarms and Condition",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        color: kAppBarColor.withOpacity(.3),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: Text(
                  'The Company will indemnify the insured against loss or damage to the vehicle insured hereunder and / or its accessories whilst thereon'),
            ),
            Container(
              child: Text(
                  'Rate of Depreciation for Painting: In the case of painting, the depreciation rateof 50% shall be applied only on the material cost of total painting charges. Incase of a consolidated bill for painting charges, the material component shallbe considered as 25% of the total painting charges for the purpose of applying the depreciation'),
            ),
            Container(
              child: Text(
                  'The Insured’s Declared Value (IDV) of the vehicle will be deemed to be the ‘SUM INSURED’ for the purpose of this policy which is fixed at the commencement of each policy period for the insured vehicle.The IDV of the vehicle and accessories if any fitted to the vehicle is to be fixed on the basis of the manufacturer’s listed selling price of the brand and model as the vehicle insured at the commencement of insurance/renewal and adjusted for depreciation (as per schedule below).'),
            ),
            Container(
              child: Text(
                  'The schedule of age-wise depreciation as shown below is applicable for the purpose ofTotal Loss/Constructive Total Loss TL/CTL claims only.'),
            ),
            ElevatedButton(
                style: kButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => healthInsuForm3()));
                },
                child: Text("Next")),
          ],
        ),
      ),
    );
  }
}
