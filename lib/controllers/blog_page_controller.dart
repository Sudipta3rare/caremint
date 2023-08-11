import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../models/blog_model.dart';

class BlogController extends GetxController {
  RxList<Blog> blogs = <Blog>[].obs;

  @override
  void onInit() {
    fetchBlogs();
    super.onInit();
  }

  void fetchBlogs() async {
    try {
      // Replace with the actual API endpoint
      String apiUrl = 'https://caremint.3raredynamics.com/public/api/blogs';

      // Create a Dio instance
      Dio dio = Dio();

      // Make the API request
      final response = await dio.get(apiUrl);

      // Parse the response data into a list of Blog objects
      List<dynamic> body = response.data['body'];
      blogs.clear();
      body.forEach((blogData) {
        String image = blogData['img'];
        String image1 = blogData['img']; // Replace with the appropriate field from the API response
        String title = blogData['title'].toString(); // Use a unique identifier as the title
        String author = blogData['author'];
        String date = blogData['blog_date'];
        String read = blogData['des']; // Replace with the appropriate field from the API response
        String readTitle = ''; // Replace with the appropriate field from the API response

        blogs.add(Blog(
          image: image,
          image1: image1,
          title: title,
          author: author,
          date: date,
          read: read,
          readTitle: readTitle,
        ));
      });
    } catch (e) {
      // Handle any errors during data fetching
      print('Error fetching blogs: $e');
    }
  }
}
