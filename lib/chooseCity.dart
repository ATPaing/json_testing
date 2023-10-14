import 'package:flutter/material.dart';

import 'JsonLocal/getLocalJson.dart';

class CityDropDown extends StatefulWidget {
  final String region;

  const CityDropDown({super.key, required this.region});

  @override
  State<CityDropDown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  String _dropdownValue = '';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readLocalJson('json_asset/myanmar-townships.json'),
         builder: (BuildContext context, snapshot) {
           if(snapshot.hasData) {
             final dynamic jsonVar = snapshot.data;

             return DropdownButton(
               itemHeight: 50.0,
               isExpanded: true,
               hint: const Text('Choose State'),
               items: jsonVar[widget.region] != null
                   ? List<DropdownMenuItem<String>>.generate(
                        jsonVar[widget.region].length,
                        ( int index) => DropdownMenuItem(
                           value: jsonVar[widget.region][index],
                           child: Text(jsonVar[widget.region][index]),
                         ),
                      )
                  : const <DropdownMenuItem<String>>[],
               value: _dropdownValue.isNotEmpty ? _dropdownValue : null,
               onChanged: dropdownCallback,
             );
           } else if (snapshot.hasError) {
             // Handle the error, and display an error message
             return Text('Error Occurred: ${snapshot.error.toString()}');
           }else {
             return const Text('Error Occurred');
           }
         }
    );
  }
    void dropdownCallback(dynamic selectedValue) {
      if (selectedValue is String) {
        setState(() {
          _dropdownValue = selectedValue;
        });
      }
    }
}