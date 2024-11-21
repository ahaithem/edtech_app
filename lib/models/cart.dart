import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../courses/course_type.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cart with ChangeNotifier {
  List<CourseType> _courses = [];
  String? userId;

  Cart() {
    // Listen to auth state changes
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        userId = user.uid;
        fetchCartItems();
      } else {
        userId = null;
        _courses = [];
        notifyListeners(); // Clear cart when logged out
      }
    });
  }

  List<CourseType> get basketItems {
    return [..._courses];
  }

  int get count {
    return _courses.length;
  }

  Future<void> add(CourseType course) async {
    if (userId == null) return;

    try {
      await FirebaseFirestore.instance.collection('cart').add({
        'userId': userId,
        'courseTitle': course.courseTitle,
        'courseDuration': course.courseDuration,
        'courseDescription': course.courseDescription,
        'courseImageUrl': course.courseImageUrl,
        'coursePrice': course.coursePrice,
        'coursePlaylistId': course.coursePlaylistId,
      });

      _courses.add(course);
      notifyListeners();
    } catch (error) {
      throw Exception("Failed to add course to cart: $error");
    }
  }

  Future<void> remove(CourseType course) async {
    if (userId == null) return;

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('cart')
          .where('userId', isEqualTo: userId)
          .where('courseTitle', isEqualTo: course.courseTitle)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        await snapshot.docs.first.reference.delete();
      }

      _courses.remove(course);
      notifyListeners();
    } catch (error) {
      throw Exception("Failed to remove course from cart: $error");
    }
  }

  Future<void> fetchCartItems() async {
    if (userId == null) return;

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('cart')
          .where('userId', isEqualTo: userId)
          .get();

      _courses = snapshot.docs.map((doc) {
        final data = doc.data();
        return CourseType(
          courseTitle: data['courseTitle'],
          courseDuration: data['courseDuration'],
          courseDescription: data['courseDescription'],
          courseImageUrl: data['courseImageUrl'],
          coursePrice: data['coursePrice'],
          coursePlaylistId: data['coursePlaylistId'],
        );
      }).toList();
      notifyListeners();
      print("Fetching cart items for user: $userId");
    } catch (error) {
      throw Exception("Failed to fetch cart items: $error");
    }
  }
}
