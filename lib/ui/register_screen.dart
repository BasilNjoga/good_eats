import 'package:flutter/material.dart';
import 'package:good_eats/ui/home_screen.dart';
import 'package:good_eats/ui/login_screen.dart';
import 'package:good_eats/ui/widgets/button.dart';
import 'package:good_eats/ui/widgets/input_field.dart';
import 'package:hive/hive.dart';

import 'dart:developer' as devtools;

class RegisterScreen extends StatefulWidget {
  static const routeName = "register-screen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  bool _isPassHidden = true;
  bool isConfirmHidden = true;
  ValueNotifier<bool> loading = ValueNotifier(false);
   final _myBox = Hive.box('mybox');

  // write data
  void writeData(int no,String text) {
    _myBox.put(no, text);
    //_myBox.put(2, "koko");
    devtools.log(_myBox.get(1));
    //devtools.log(_myBox.get(2));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
        const Text("Good Eats", style: TextStyle(fontSize: 25),),
        const SizedBox(height: 10,),
        Image.asset("images/good_eats.png", height: 100,),
        const SizedBox(height: 30,),
         Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputField(
                      type: TextInputType.emailAddress,
                      controller: _firstNameController,
                      isPassword: false,
                      hintText: "First Name",
                    ),
                    InputField(
                      type: TextInputType.emailAddress,
                      controller: _lastNameController,
                      isPassword: false,
                      hintText: "Last Name",
                    ),
                    InputField(
                      type: TextInputType.emailAddress,
                      controller: _emailController,
                      isPassword: false,
                      hintText: "Email",
                    ),
                    InputField(
                      isPassword: _isPassHidden,
                      hintText: "Password",
                      controller: _passController,
                      icon: IconButton(
                        icon: Icon( _isPassHidden ? Icons.visibility : Icons.visibility_off, color: Colors.black38,),
                        onPressed: () {
                          setState(() {
                            _isPassHidden = !_isPassHidden;
                          });
                        },
                      ),
                    ),
                    InputField(
                      isPassword: isConfirmHidden,
                      controller: _confirmPassController,
                      icon: IconButton(
                        icon:   Icon( isConfirmHidden ? Icons.visibility : Icons.visibility_off, color: Colors.black38,),
                        onPressed: () {
                          setState(() {
                            isConfirmHidden = !isConfirmHidden;
                          });
                        },
                      ),
                      hintText: "Confirm Password",
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Field is required';
                        }
                        if (val != _passController.text) {
                          return 'Password not matching';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
        
              Button(
                title: "Register",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      loading.value = true;
                    });
                    _formKey.currentState!.save();
                    var request = {
                      "email": _emailController.text,
                      "password": _passController.text,
                    };

                    devtools.log(request.toString());
                    writeData(1, _firstNameController.text);
                    writeData(2, _emailController.text);
                    //writeData(2, _passController.text);
                    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
                  }
                  
                },
                
              ),
        
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: const Text("Already registered ? , login"))
        ],),
      ),
    );
  }
}