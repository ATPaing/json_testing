import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'JsonLocal/getLocalJson.dart';
import 'chooseCity.dart';
import 'dropDown.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedRegion = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Json Dropdown testing'),
      ),
      body:  ListView(
        children: [
          DropDownWidget(
            onRegionSelected: (region) {
              setState(() {
                selectedRegion = region; // Step 3: Set the selected region
              });
            },
          ),
          CityDropDown(region: selectedRegion),
        ],
      ),
    );
  }
}