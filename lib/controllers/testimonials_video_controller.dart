import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TestimonialsVideoController extends GetxController {

  int id = 0;
  String description = "";
  String name = "";
  String video = "";
  RxList<String> videoUrls = <String>[].obs;

  @override
  void onInit() {
    fetchTestimonialsVideo();
    super.onInit();
  }

  void fetchTestimonialsVideo() async {
    try {
      // Replace with the actual API endpoint
      String apiUrl = 'https://admindashboard.caremint.in/public/api/testimonials';

      // Create a Dio instance
      Dio dio = Dio();

      // Make the API request
      final response = await dio.get(apiUrl);

      // Check if response data is a Map
      if (response.data is Map<String, dynamic>) {
        // Extract the 'body' field which contains the list of testimonials
        List<dynamic> testimonials = response.data['body'];

        // Loop through each testimonial
        for (var testimonial in testimonials) {
          // Extract required fields
          id = testimonial['id'];
          name = testimonial['name'];
          description = testimonial['des'];
          video = testimonial['video'];

          // Print values
          print('Testimonial ID: $id');
          print('Testimonial Name: $name');
          print('Testimonial Description: $description');
          print('Testimonial Video URL: $video');

          List<String> urls = testimonials.map((testimonialData) {
            return testimonialData['video'] as String;
          }).toList();

          // Store the image URLs
          videoUrls.assignAll(urls);

        }
      } else {
        print('Response data is not in the expected format.');
      }
    } catch (e) {
      // Handle any errors during data fetching
      print('Error fetching testimonials: $e');
    }
  }

}
