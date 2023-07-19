import 'package:cached_network_image/cached_network_image.dart';
import 'package:caremint/ui/components/text_componets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../controllers/testimonials_controller.dart';

class Testimonials extends StatelessWidget {
  final TestimonialsController controller = Get.put(TestimonialsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppStyle.buttonColor),
        backgroundColor: Colors.blue[50],
        title: TextComponet().headingText("Testimonials"),
        elevation: 0,
      ),
      backgroundColor: Colors.blue[50],
      body: Obx(
            () => ListView(
          children: [
            SizedBox(height: 30),
            CarouselSlider(
              items: controller.testimonials.toList(),
              options: CarouselOptions(
                height: 500,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

Widget testimonialCard(String description, String name, String image) {
  return Container(
    margin: EdgeInsets.only(top: 16, bottom: 16),
    padding: EdgeInsets.all(8),
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          offset: Offset(3, 3),
          blurRadius: 20,
          color: Colors.blueAccent.withOpacity(0.5),
        ),
      ],
      gradient: LinearGradient(
        colors: [
          Colors.blueAccent,
          Colors.lightBlue[200]!,
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: Colors.white,
          child: CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
          ),
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}



