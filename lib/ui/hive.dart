import 'package:flutter/material.dart';

class HivePage extends StatefulWidget {
  const HivePage({super.key});

  @override
  State<HivePage> createState() => _HivePageState();
}

class _HivePageState extends State<HivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Row(children: [
        MaterialButton(onPressed: () {

          },
          color: Colors.blue,
          child: const Text("Write")),
          MaterialButton(onPressed: () {

          },
          color: Colors.blue,
          child: const Text("Read")),
          MaterialButton(onPressed: () {

          },
          color: Colors.blue,
          child: const Text("Delete"))
      ],)),);
  }
}