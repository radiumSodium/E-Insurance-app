import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insuranceapp/Pages/carin/completeci.dart';
import 'package:insuranceapp/Pages/pdfform.dart';

class Payment2nd extends StatefulWidget {
  const Payment2nd({
    Key? key,
  }) : super(key: key);

  @override
  State<Payment2nd> createState() => _Payment2ndState();
}

class _Payment2ndState extends State<Payment2nd> {
  final _formKey = GlobalKey<FormState>();

  var a = "";
  var b = "";
  var c = "";
  var d = "";
  final aController = TextEditingController();
  final bController = TextEditingController();
  final cController = TextEditingController();
  final dController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    aController.dispose();
    bController.dispose();
    cController.dispose();
    dController.dispose();

    super.dispose();
  }

  Future storeReq() async {
    adduserDetails(
      aController.text.trim(),
      bController.text.trim(),
      cController.text.trim(),
      dController.text.trim(),
    );
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PdfGeneratorPage()));
  }

  Future adduserDetails(
    String a,
    String b,
    String c,
    String d,
  ) async {
    await FirebaseFirestore.instance.collection('carddetails').add({
      'a': a,
      'b': b,
      'c': c,
      'd': d,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        shadowColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
// hello world

                SizedBox(height: 10),
                Text(
                  'Add Credit/Debit Card',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
//first name fieldtext

                SizedBox(height: 20),
// email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 238, 238),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: aController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Card Number',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
// email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 238, 238, 238),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: bController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Expire date',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 238, 238, 238),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: cController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'CVC',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
// email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 238, 238),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: dController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Payment Ammount',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: storeReq,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 194, 230, 255),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'ADD CARD',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
// not a member sign up button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
