import 'package:flutter/material.dart';
import '../widgets/profile.dart';

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const List<Widget> widgetOptions = <Widget>[
  Profile(),
  Text(
    'Index 1: Business',
    style: optionStyle,
  ),
  Text(
    'Index 2: School',
    style: optionStyle,
  ),
];
