import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/pages/testimonial_page.dart';

class TestimonialsController extends GetxController {
  RxList<Widget> testimonials = <Widget>[].obs;

  String description = "";
  String name = "";
  String image = "";
  RxList<String> imageUrls = <String>[].obs;


  @override
  void onInit() {
    fetchTestimonials();
    super.onInit();
  }

  void fetchTestimonials() async {
    try {
      // Replace with the actual API endpoint
      String apiUrl = 'https://caremint.3raredynamics.com/public/api/testimonials';

      // Create a Dio instance
      Dio dio = Dio();

      // Make the API request
      final response = await dio.get(apiUrl);

      // Parse the response data into a list of testimonial cards
      List<dynamic> body = response.data['body'];
      testimonials.clear();
      body.forEach((testimonialData) {
        description = testimonialData['des'];
        name = testimonialData['name'];
        image = testimonialData['img'];

        List<String> urls = body.map((testimonialData) {
          return testimonialData['img'] as String;
        }).toList();

        // Store the image URLs
        imageUrls.assignAll(urls);

        testimonials.add(testimonialCard(description, name, image));
      });
    } catch (e) {
      // Handle any errors during data fetching
      print('Error fetching testimonials: $e');
    }
  }
}
