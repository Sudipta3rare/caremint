import 'package:cloud_firestore/cloud_firestore.dart';
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
      // Fetch data from Firestore collection
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('Blog').get();

      // Clear existing blogs
      blogs.clear();

      // Iterate through the documents and create blog objects
      snapshot.docs.forEach((doc1) {
        String image = doc1['image'];
        String image1 = doc1['image1'];
        String title = doc1['title'];
        String author = doc1['auth'];
        String date = doc1['date'];
        String read = doc1['read'];
        String readTitle = doc1['readTitle'];

        blogs.add(Blog(
          image: image,
          image1: image1,
          title: title,
          author: author,
          date: date,
          read: read,
          readTitle: readTitle
        ));
      });
    } catch (e) {
      // Handle any errors during data fetching
      print('Error fetching blogs: $e');
    }
  }
}




