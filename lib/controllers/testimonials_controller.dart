import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../ui/pages/testimonial_page.dart';

class TestimonialsController extends GetxController {
  RxList<Widget> testimonials = <Widget>[].obs;

  @override
  void onInit() {
    fetchTestimonials();
    super.onInit();
  }

  void fetchTestimonials() async {
    try {
      // Fetch data from Firestore collection
      QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('Testimonials').get();

      // Clear existing testimonials
      testimonials.clear();

      // Iterate through the documents and create testimonial cards
      snapshot.docs.forEach((doc) {
        String description = doc['description'];
        String name = doc['name'];
        String image = doc['image'];

        testimonials.add(testimonialCard(description, name, image));
      });
    } catch (e) {
      // Handle any errors during data fetching
      print('Error fetching testimonials: $e');
    }
  }
}

