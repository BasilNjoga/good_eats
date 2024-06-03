import 'package:flutter/material.dart';
import 'package:good_eats/ui/home_screen.dart';
import 'package:good_eats/ui/register_screen.dart';
import 'package:good_eats/ui/widgets/button.dart';
import 'package:good_eats/ui/widgets/input_field.dart';

import 'dart:developer' as devtools;

import 'package:hive/hive.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isPassHidden = true;
  ValueNotifier<bool> loading = ValueNotifier(false);

  // reference hive box
  final _myBox = Hive.box('mybox');

  // write data
  void writeData(int no,String text) {
    _myBox.put(no, text);
    //_myBox.put(2, "koko");
    devtools.log(_myBox.get(1));
    //devtools.log(_myBox.get(2));
  }

  // read data
  void readData() {
    _myBox.get(1);
  }

  // delete data
  void deleteData() {

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
                  ],
                ),
              ),
        
              Button(
                title: "Login",
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
                    writeData(2, _emailController.text);
                    //writeData(2, _passController.text);
                    
                    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
                  }
                  
                },
                
              ),
        
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: const Text("Dont have an account ? Register now"))
        ],),
      ),
    );
  }
}