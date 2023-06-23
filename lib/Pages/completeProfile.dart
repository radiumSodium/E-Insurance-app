import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insuranceapp/Local%20Data/localdata.dart';
import 'package:insuranceapp/Pages/complete.dart';
import 'package:insuranceapp/Pages/constants.dart';
import 'package:insuranceapp/chatbot/chatbotConstants.dart';

// import 'package:logsign/pages/CongratsStudent.dart';

class completeProfile extends StatefulWidget {
  const completeProfile({Key? key}) : super(key: key);

  @override
  _completeProfileState createState() => _completeProfileState();
}

class _completeProfileState extends State<completeProfile> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var Name = "";
  var gender = "";
  var phoneNumber = "";
  var age = "";
  var presentAddress = "";
  var permanentAddress = "";
  bool isComplete = false;

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final presentAddressController = TextEditingController();
  final permanentAddressController = TextEditingController();
  // final scoreController = TextEditingController();
  String? url;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    nameController.dispose();
    genderController.dispose();
    phoneController.dispose();
    ageController.dispose();
    presentAddressController.dispose();
    permanentAddressController.dispose();

    // scoreController.dispose();
    super.dispose();
  }

  // Adding Student
  CollectionReference pids = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() async {
    final imgurl = await uploadImage(_image!);
    isComplete = true;
    return pids
        .add({
          'email': email,
          'name': Name,
          'gender': gender,
          'phone number': phoneNumber,
          'age': age,
          'present address': presentAddress,
          'permanent address': permanentAddress,
          'image url': url,
          // 'score': score,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  File? _image;
  final picker = ImagePicker();
  String? downloadUrl;

  Future imagePicker() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pick != null) {
          _image = File(pick.path);
        }
      });
    } catch (e) {}
  }

  Future uploadImage(File _image) async {
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();

    Reference refrence =
        FirebaseStorage.instance.ref().child('images').child('user$imgId');
    await refrence.putFile(_image);
    url = await refrence.getDownloadURL();
  }

  @override
  void initState() {
    phoneController.text = UserSharedPreference().getNumber() ?? "";
    permanentAddressController.text =
        UserSharedPreference().getPermanentAddress() ?? "";
    presentAddressController.text =
        UserSharedPreference().getPresentAddress() ?? "";
    emailController.text = UserSharedPreference().getEmail() ?? "";
    nameController.text = UserSharedPreference().getName() ?? "";
    genderController.text = UserSharedPreference().getGender() ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: const Text("Complete your profile"),
      ),
      body: Container(
        color: kAppbarBackground.withOpacity(.3),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                    height: 250,
                    width: 250,
                    child: Column(
                      children: [
                        const Text(
                          "",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.lightBlue,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: _image == null
                                        ? Center(
                                            child: Image.asset(
                                            "assets/images/profilepic.png",
                                            height: 150,
                                            width: 150,
                                          ))
                                        : Image.file(_image!,
                                            height: 150,
                                            width: 150,
                                            fit: BoxFit.contain),
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  kBorderColor)),
                                      onPressed: () {
                                        imagePicker();
                                      },
                                      child: const Text(
                                        "Upload Picture",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height: 20),
                Container(
                  // this container is the value box for taking inputs
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      focusColor: kBorderColor,
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kBorderColor,
                          width: 1,
                        ),
                      ),
                      errorStyle: TextStyle(color: kBorderColor, fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                    ),
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Give your name';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      focusColor: kBorderColor,
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: kBorderColor,
                        width: 1,
                      )),
                      errorStyle: TextStyle(color: kBorderColor, fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                    ),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Give your email';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      focusColor: kBorderColor,
                      labelText: 'Present Address',
                      labelStyle: TextStyle(
                          fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: kBorderColor,
                        width: 1,
                      )),
                      errorStyle: TextStyle(color: kBorderColor, fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                    ),
                    controller: presentAddressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Give your present address';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      focusColor: kBorderColor,
                      labelText: 'Permanent Address',
                      labelStyle: TextStyle(
                          fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: kBorderColor,
                        width: 1,
                      )),
                      errorStyle: TextStyle(color: kBorderColor, fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                    ),
                    controller: permanentAddressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Give your permanent address';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      focusColor: kBorderColor,
                      labelText: 'Gender',
                      labelStyle: TextStyle(
                          fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: kBorderColor,
                        width: 1,
                      )),
                      errorStyle: TextStyle(color: kBorderColor, fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                    ),
                    controller: genderController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Male/Female ?';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      focusColor: kBorderColor,
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: kBorderColor,
                        width: 1,
                      )),
                      errorStyle: TextStyle(color: kBorderColor, fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                    ),
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Give your phone number';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      focusColor: kBorderColor,
                      labelText: 'Age',
                      labelStyle: TextStyle(
                          fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: kBorderColor,
                        width: 1,
                      )),
                      errorStyle: TextStyle(color: kBorderColor, fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kBorderColor,
                        ),
                      ),
                    ),
                    controller: ageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Give your age';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profilecom()));

                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState!.validate()) {
                            setState(() async {
                              email = emailController.text;
                              presentAddress = presentAddressController.text;
                              Name = nameController.text;
                              gender = genderController.text;
                              permanentAddress =
                                  permanentAddressController.text;
                              phoneNumber = phoneController.text;
                              age = ageController.text;

                              // score = scoreController.text;
                              addUser();

                              // await UserSharedPreference()
                              //     .setUserName(userNameController.text);

                              await UserSharedPreference()
                                  .setAge(ageController.text);
                              await UserSharedPreference()
                                  .setNumber(phoneController.text);
                              await UserSharedPreference().setPresentAddress(
                                  presentAddressController.text);
                              await UserSharedPreference().setPermanentAddress(
                                  permanentAddressController.text);

                              await UserSharedPreference()
                                  .setName(nameController.text);

                              await UserSharedPreference()
                                  .setEmail(emailController.text);
                              await UserSharedPreference()
                                  .setGender(genderController.text);
                            });
                          }
                        },
                        child: const Text(
                          'Complete',
                          style: TextStyle(fontSize: 22.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
