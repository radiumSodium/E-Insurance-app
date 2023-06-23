import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insuranceapp/Local%20Data/localdata.dart';
import 'package:insuranceapp/Pages/carin/completeci.dart';
import 'package:insuranceapp/Pages/constants.dart';
import 'package:insuranceapp/Pages/payment.dart';
import 'package:insuranceapp/chatbot/chatbotConstants.dart';

// import 'package:logsign/pages/CongratsStudent.dart';

class carInsuForm1 extends StatefulWidget {
  const carInsuForm1({Key? key}) : super(key: key);

  @override
  _carInsuForm1State createState() => _carInsuForm1State();
}

class _carInsuForm1State extends State<carInsuForm1> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var Name = "";
  var gender = "";
  var phoneNumber = "";
  var age = "";
  var presentAddress = "";
  var permanentAddress = "";
  var carModel = "";
  var carNumber = "";
  var engineNumber = "";
  var cacisNumber = "";
  bool isComplete = false;

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final institutionController = TextEditingController();
  final classController = TextEditingController();
  final cityController = TextEditingController();
  final presentAddressController = TextEditingController();
  final permanentAddressController = TextEditingController();
  final cacisNumberController = TextEditingController();
  final engineNumberController = TextEditingController();
  final carModelNumberController = TextEditingController();
  final carNumberController = TextEditingController();
  // final scoreController = TextEditingController();
  String? url;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    userNameController.dispose();
    nameController.dispose();
    genderController.dispose();
    phoneController.dispose();
    ageController.dispose();
    // scoreController.dispose();
    super.dispose();
  }

  // Adding Student
  CollectionReference pids =
      FirebaseFirestore.instance.collection('carInsurance1');

  Future<void> addUser() async {
    // final imgurl = await uploadImage(_image!);
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
          'car model': carModel,
          'car number': carNumber,
          'engine number': engineNumber,
          'cacis number': cacisNumber,
          // 'image url': url,
          // 'score': score,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  // File? _image;
  // final picker = imagePicker();
  // String? downloadUrl;

  // Future imagePicker() async {
  //   try {
  //     final pick = await picker.pickImage(source: ImageSource.gallery);
  //     setState(() {
  //       if (pick != null) {
  //         _image = File(pick.path);
  //       }
  //     });
  //   } catch (e) {}
  // }

  // Future uploadImage(File _image) async {
  //   String imgId = DateTime.now().microsecondsSinceEpoch.toString();

  //   Reference refrence =
  //       FirebaseStorage.instance.ref().child('images').child('user$imgId');
  //   await refrence.putFile(_image);
  //   url = await refrence.getDownloadURL();
  // }

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
    ageController.text = UserSharedPreference().getAge() ?? "";

    // url = UserSharedPreference().getImageStudent() ?? "";

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
        color: kAppBarColor.withOpacity(.3),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                // Container(
                //     height: 250,
                //     width: 250,
                //     child: Column(
                //       children: [
                //         const Text(
                //           "ছবি যুক্ত করুন",
                //           style: TextStyle(
                //               fontSize: 22, fontWeight: FontWeight.bold),
                //         ),
                //         Expanded(
                //           flex: 2,
                //           child: Container(
                //             width: 250,
                //             height: 250,
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(20),
                //                 border: Border.all(
                //                     color: const Color.fromARGB(255, 255, 0, 0))),
                //             child: Center(
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Padding(
                //                     padding: const EdgeInsets.all(8.0),
                //                     child: _image == null
                //                         ? Center(
                //                             child: Image.asset(
                //                             "assets/images/profile.png",
                //                             height: 150,
                //                             width: 150,
                //                           ))
                //                         : Image.file(_image!,
                //                             height: 150,
                //                             width: 150,
                //                             fit: BoxFit.contain),
                //                   ),
                //                   ElevatedButton(
                //                       style: ButtonStyle(
                //                           backgroundColor:
                //                               MaterialStateProperty.all(
                //                                   const Color.fromARGB(
                //                                       255, 255, 0, 0))),
                //                       onPressed: () {
                //                         imagePicker();
                //                       },
                //                       child: const Text("ছবি সিলেক্ট করুন")),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     )),
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
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      focusColor: kBorderColor,
                      labelText: 'Car Number',
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
                    controller: carNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Give your car number';
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
                      labelText: 'Car Model',
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
                    controller: carModelNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Give your car model';
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
                      labelText: 'Engine Number',
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
                    controller: engineNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Give your engine number';
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
                      labelText: 'Cacis Number',
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
                    controller: cacisNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Give your cacis number';
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
                                  builder: (context) => Payment2nd()));
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
                              carModel = carModelNumberController.text;
                              carNumber = carNumberController.text;
                              engineNumber = engineNumberController.text;
                              cacisNumber = cacisNumberController.text;

                              // score = scoreController.text;
                              addUser();

                              // await UserSharedPreference()
                              //     .setUserName(userNameController.text);
                              // await UserSharedPreference().setStudentInstitution(
                              //     institutionController.text);
                              // await UserSharedPreference().setImageStudent(url!);
                              // await UserSharedPreference()
                              //     .setAge(ageController.text);
                              // await UserSharedPreference()
                              //     .setNumber(phoneController.text);
                              // await UserSharedPreference()
                              //     .setCity(cityController.text);
                              // await UserSharedPreference()
                              //     .setDetailsAddress(addressController.text);
                              // await UserSharedPreference()
                              //     .setClassStudent(classController.text);
                              // await UserSharedPreference()
                              //     .setName(nameController.text);
                              // await UserSharedPreference()
                              //     .setReligion(religionController.text);
                              // await UserSharedPreference()
                              //     .setEmail(emailController.text);
                              // await UserSharedPreference()
                              //     .setGender(genderController.text);
                              // // await UserSharedPreference()
                              // //     .setScore(scoreController.text);
                              // Get.to(const CongratsStudent());
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
