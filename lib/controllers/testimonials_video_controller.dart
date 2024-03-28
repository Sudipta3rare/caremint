import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TestimonialsVideoController extends GetxController {
  RxList<String> videoUrls = <String>[].obs;

  @override
  void onInit() {
    fetchTestimonialsVideo();
    super.onInit();
  }

  void fetchTestimonialsVideo() async {
    try {
      String apiUrl = 'https://admindashboard.caremint.in/public/api/testimonials';
      Dio dio = Dio();
      final response = await dio.get(apiUrl);
      if (response.data is Map<String, dynamic>) {
        List<dynamic> testimonials = response.data['body'];
        List<String> urls = [];
        for (var testimonial in testimonials) {
          String? videoUrl = testimonial['video'] as String?;
          if (videoUrl != null) {
            urls.add(videoUrl);
          }
        }
        videoUrls.assignAll(urls);
      } else {
        print('Response data is not in the expected format.');
      }
    } catch (e) {
      print('Error fetching testimonials: $e');
    }
  }
}

