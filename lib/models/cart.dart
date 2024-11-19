import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../courses/course_type.dart';

class Cart with ChangeNotifier {
  List<CourseType> _courses = [];

  void add(CourseType course) {
    _courses.add(course);
    notifyListeners();
  }

  void remove(CourseType course) {
    _courses.remove(course);
    notifyListeners();
  }

  int get count {
    return _courses.length;
  }

  List<CourseType> get bascketitems {
    return _courses;
  }
}
