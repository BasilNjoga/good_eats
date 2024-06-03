import 'package:flutter/material.dart';
import 'package:good_eats/models/image_item.dart';
import 'package:good_eats/ui/login_screen.dart';

import 'package:good_eats/util/constants.dart' as constants;
import 'package:hive/hive.dart';

import 'dart:developer' as devtools;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? email;
  final _myBox = Hive.box('mybox');
  String readData(int no) {
   return _myBox.get(no);
  }
  @override
  void initState() {
    setState(() {
    name = readData(1);
    email = readData(2);
    });
    devtools.log(name.toString());
    devtools.log(email.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"),),
      body: Column(
        children: [
          Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset("images/member.png", height: 70,),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name ?? "basil", style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: "Lato"),),
                      Text(email ?? "basil@gmail.com")
                    ],
                  ),
                ],
              ),
            ),),
            const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(color: Colors.white,),
                  shrinkWrap: true,
                  itemCount: constants.menu.length,
                  itemBuilder: (BuildContext context, int position) {
                    return getRow(constants.menu[position]);
                  },
                )),
        ],
      ),
    );
  }

  Widget getRow(ImageItem item) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4),
      onTap: () {
        switch (item.code) {
          case 'log_out':
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Confirm logout"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        TextButton(
                            onPressed: ()  {
                              
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  LoginScreen.routeName, (r) => false);
                            },
                            child: const Text("Yes, Continue")),
                      ],
                    )
                    );
            break;
        }
      },
      leading: ImageIcon(
        AssetImage(item.image),
        color: Colors.black,
      ),
      title: Text(
        item.name,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: "Lato"),
      ),
    );
  }
}