import 'package:flutter/material.dart';
import '../widgets/profile.dart';
import '../widgets/settings_content/setting_widget.dart';
import '../courses/course.dart';

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const List<Widget> widgetOptions = <Widget>[
  // Text(
  //   'Index 1: Business',
  //   style: optionStyle,
  // ),
  Course(),
  Profile(),
  SettingWidget(),
];
