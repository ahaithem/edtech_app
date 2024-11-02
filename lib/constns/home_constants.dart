import 'package:flutter/material.dart';
import '../widgets/profile.dart';
import '../widgets/settings_content/setting_widget.dart';

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const List<Widget> widgetOptions = <Widget>[
  Profile(),
  SettingWidget(),
  Text(
    'Index 1: Business',
    style: optionStyle,
  ),
  // Text(
  //   'Index 2: School',
  //   style: optionStyle,
  // ),
];
