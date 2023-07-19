import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../controllers/blog_page_controller.dart';
import '../../models/blog_model.dart';
import '../components/text_componets.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppStyle.buttonColor),
        backgroundColor: Colors.blue[50],
        title: TextComponet().headingText("Blogs"),
        elevation: 0,
      ),
      backgroundColor: Colors.blue[50],
      body: GetBuilder<BlogController>(
        init: BlogController(), // Instantiate the BlogController
        builder: (blogController) {
          return Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: blogController.blogs.length,
              itemBuilder: (context, index) {
                Blog blog = blogController.blogs[index];
                return ReadingListCard(blog: blog);
              },
            ),
          );
        },
      ),
    );
  }
}

class ReadingListCard extends StatelessWidget {
  final Blog blog;

  ReadingListCard({required this.blog});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.black;

    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      height: 265,
      width: 240,
      child: Stack(
        children: <Widget>[
          Container(
            height: 265,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5, 10),
                  blurRadius: 30,
                  color: Colors.blue[900]!.withOpacity(0.5),
                ),
              ],
            ),
          ),
          CachedNetworkImage(
            imageUrl: blog.image,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: 170,
            // height: 190,
          ),
          // Positioned(
          //   top: 50,
          //   right: 10,
          //   child: Column(
          //     children: <Widget>[
          //       IconButton(
          //         icon: Icon(
          //           Icons.favorite_border,
          //           color: color,
          //         ),
          //         onPressed: () {},
          //       ),
          //       // BookRating(score: rating),
          //     ],
          //   ),
          // ),
          Positioned(
            top: 160,
            child: Container(
              height: 110,
              width: 240,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 0,
                      bottom: 0,
                    ),
                    child: RichText(
                      overflow: TextOverflow.clip,
                      maxLines: 5,
                      text: TextSpan(
                        style: TextStyle(color: Colors.blue[900]),
                        children: [
                          TextSpan(
                            text: "${blog.title}\n",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: blog.author,
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 110,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text(
                            blog.date,
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: twoSideRoundedButton(
                          context,
                          "Read",
                          showReadDialog,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showReadDialog() {
    Get.to(
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppStyle.buttonColor),
          backgroundColor: Colors.blue[50],
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  color: AppStyle.backgroundColor,
                  child: ExpandableNotifier(
                    child: Column(
                      children: [
                        Expandable(
                          collapsed: ExpandableButton(
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: blog.image1,
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                  //width: 170,
                                  //height: 190,
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  blog.read,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.poppins(
                                    color: AppStyle.blue900,
                                    textStyle: TextStyle(
                                      // Additional text style properties can be added here
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                Icon(
                                  Icons.expand_more,
                                  color: AppStyle().gradientColor2,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          expanded: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: blog.image1,
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                                //width: 170,
                                //height: 190,
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                blog.read,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.poppins(
                                  color: AppStyle.blue900,
                                  textStyle: TextStyle(
                                    // Additional text style properties can be added here
                                  ),
                                ),
                              ),
                              // Add any additional widgets you want to display in the expanded state
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ),

                SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Center(
                    child: Container(
                      width: 150,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        gradient: LinearGradient(
                          colors: [
                            AppStyle().gradientColor1,
                            AppStyle().gradientColor2
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Close",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget twoSideRoundedButton(
    BuildContext context, String text, void Function()? press) {
  return GestureDetector(
    onTap: press,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        gradient: LinearGradient(
          colors: [AppStyle().gradientColor1, AppStyle().gradientColor2],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
