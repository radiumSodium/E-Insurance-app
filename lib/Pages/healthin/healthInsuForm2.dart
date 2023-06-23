import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insuranceapp/Local%20Data/localdata.dart';
import 'package:insuranceapp/Pages/healthin/healthCompleteScreen.dart';
import 'package:insuranceapp/Pages/payment.dart';

// import 'package:logsign/pages/CongratsStudent.dart';

class healthInsuForm2 extends StatefulWidget {
  const healthInsuForm2({Key? key}) : super(key: key);

  @override
  _healthInsuForm2State createState() => _healthInsuForm2State();
}

class _healthInsuForm2State extends State<healthInsuForm2> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var Name = "";
  var gender = "";
  var age = "";
  var presentAddress = "";
  var permanentAddress = "";
  var phoneNumber = "";
  var package = "";
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
  final packageController = TextEditingController();
  // final scoreController = TextEditingController();
  String? url;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    nameController.dispose();
    genderController.dispose();
    ageController.dispose();

    // scoreController.dispose();
    super.dispose();
  }

  // Adding Student
  CollectionReference pids =
      FirebaseFirestore.instance.collection('healthInsurance2');

  Future<void> addUser() async {
    // final imgurl = await uploadImage(_image!);
    isComplete = true;
    return pids
        .add({
          'email': email,
          'name': Name,
          'gender': gender,
          'age': age,
          'present address': presentAddress,
          'permanent address': permanentAddress,
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Health Insurance Form"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
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
                    focusColor: Colors.blue,
                    labelText: 'Name',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    )),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
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
                    focusColor: Colors.blue,
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
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
                    focusColor: Colors.blue,
                    labelText: 'Present Address',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
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
                    focusColor: Colors.blue,
                    labelText: 'Permanent Address',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
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
                    focusColor: Colors.blue,
                    labelText: 'Gender',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
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
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Age',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
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
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Package',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: packageController,
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
                                builder: (context) => Payment2nd()));
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() async {
                            email = emailController.text;
                            presentAddress = presentAddressController.text;
                            Name = nameController.text;
                            gender = genderController.text;
                            permanentAddress = permanentAddressController.text;
                            age = ageController.text;
                            addUser();

                            // await UserSharedPreference()
                            //     .setUserName(userNameController.text);
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
    );
  }
}
