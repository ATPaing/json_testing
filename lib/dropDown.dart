import 'package:flutter/material.dart';

import 'chooseCity.dart';


class DropDownWidget extends StatefulWidget {
  final void Function(String) onRegionSelected; // Step 1: Define a callback function
  const DropDownWidget({super.key, required this.onRegionSelected});

  @override
  State<StatefulWidget> createState() => _DropDownState();

}

class _DropDownState extends State<DropDownWidget>{

  List<String> cityArr = [
    'Magway Region',
    'Mandalay Region',
    'Naypyidaw Union Territory',
    'Kayah State',
    'Shan State',
    'Ayeyarwady Region',
    'Bago Region',
    'Yangon Region',
    'Kachin State',
    'Sagaing Region',
    'Kayin State',
    'Mon State',
    'Tanintharyi Region',
    'Chin State',
    'Rakhine State'
  ];

  String _dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
            itemHeight: 50.0,
            isExpanded: true,
            hint: const Text('Choose Region'),
            items: [
              for(int i = 0; i < cityArr.length; i++)
                DropdownMenuItem(
                    value: cityArr[i],
                    child: Text(cityArr[i])

                )
            ],
            value: _dropdownValue.isNotEmpty ? _dropdownValue : null,
            onChanged:  dropdownCallback,
          );
    }
  void dropdownCallback(dynamic selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
        CityDropDown(region: _dropdownValue);
        widget.onRegionSelected(_dropdownValue);
      });
    }

  }
}

