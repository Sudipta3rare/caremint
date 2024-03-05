import 'package:caremint/controllers/categories_controller/category_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../bottombar/custom_bottom_bar.dart';
import '../../widget/custom_app_bar.dart';

class CategoryPage extends StatelessWidget {
  final CategoryPageController controller = Get.put(CategoryPageController());

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: const Color(0XFF164378),
          child: Column(
            children: [
              SizedBox(height: 30),
              categoryWidget(context)
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }

  Widget categoryWidget(BuildContext context) {
    return Container(
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 15),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.90,
              mainAxisSpacing: 0.10,
            ),
            children: <Widget>[
              buildCategoryItem(context,"assets/images/interiorimg.png", "Interior Service"),
              buildCategoryItem(context,"assets/images/exteriorimg.png", "Exterior Service"),
              buildCategoryItem(context,"assets/images/interiorandexteriorimg.png", "Interior + Exterior"),
              buildCategoryItem(context,"assets/images/deepcleaningimg.png", "Deep Cleaning"),
              buildCategoryItem(context,"assets/images/monthlysubimg.png", "Monthly Subscription"),
              buildCategoryItem(context,"assets/images/ceramicimg.png", "Ceramic Coating"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryItem(BuildContext context, String imagePath, String label) {
    double containerHeight = MediaQuery.of(context).size.height * 0.3; // Adjust as needed
    double containerWidth = MediaQuery.of(context).size.width * 0.4; // Adjust as needed

    return Padding(
      padding: EdgeInsets.all(10), // Adjust as needed
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.fill, // Use BoxFit.cover to fill the container
            height: containerHeight,
            width: containerWidth,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              width: containerWidth,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0XFFFFFFFF),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: Color(0XFF005797),
                  fontSize: 12,
                  fontFamily: "PoppinsSemiBold",
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 40,
      leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              Get.offAllNamed("/homenew");
            },
            child: Image.asset(
              "assets/images/backbutton.png",
              width: 20,
              height: 20,
            ),
          )),
      centerTitle: true,
      title: Text("Category",
          style: TextStyle(
            color: Color(0XFFB5F446),
            fontSize: 25,
            fontFamily: "PoppinsSemiBold",
          )),
    );
  }

}



