import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../../../bottombar/custom_bottom_bar.dart';
import '../../../constants/app_colors.dart';
import '../../../controllers/categories_controller/exterior_service_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/login_snackbar.dart';

class CategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Scaffold(
              appBar: _buildAppBar(),
              body: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: const Color(0XFF164378),
                child: CustomScrollView(
                  // shrinkWrap: true,
                    slivers: [
                     categoryWidget(context)
                    ]),
              ),
              bottomNavigationBar: CustomBottomBar(),
            ),
          );
        });
  }

  Widget categoryWidget(BuildContext context) {
    final HomeController ctrl = Get.put(HomeController());
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.90,
            crossAxisSpacing: 0.10),
        delegate: SliverChildBuilderDelegate(
          childCount: ctrl.categoryList.length,
              (context, index) => homeCard(context,
            ctrl.categoryList[index].categoryName.toString(),
            ctrl.categoryList[index].id.toString(),
            ctrl.categoryList[index].img.toString()),
        ));
  }

  Widget homeCard(BuildContext context, String itemName, String catName, String catImg) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        final index = ctrl.categoryList.indexWhere((category) => category.categoryName == itemName);
        final isComingSoon = index == 4 || index == 5;

        return Card(
          color: AppStyle().gradientColor1,
          shadowColor: AppStyle().gradientColor2,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 4,
          margin: EdgeInsets.all(5),
          child: Center(
            child: GetBuilder<ExteriorServiceController>(
              builder: (exCtrl) {
                return GestureDetector(
                  onTap: () {
                    if (ctrl.isLoggedIn.value && !isComingSoon) {
                      exCtrl.gotoService(catName, itemName, ctrl.userDetails.pincode);
                    } else if (isComingSoon) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          Get.snackbar(
                            'Info',
                            'This item is coming soon!',
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: Color(0xffffffff),
                            backgroundColor: AppStyle().gradientColor2,
                            duration: Duration(seconds: 2),
                          ) as SnackBar
                        /* SnackBar(
                          content: Text("This item is coming soon!"),
                        ),*/
                      );
                    } else {
                      LoginSnackBar().loginSnackBar(context);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              RippleAnimation(
                                color: AppStyle().gradientColor4,
                                delay: const Duration(milliseconds: 3000),
                                repeat: true,
                                minRadius: 50,
                                ripplesCount: 4,
                                duration: const Duration(milliseconds: 7000),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppStyle().gradientColor2, width: 2), // Add a green border
                                  ),
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) => const CircularProgressIndicator(),
                                      imageUrl: catImg,
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                ),
                              ),
                              if (isComingSoon)
                                Positioned(
                                  child: Container(
                                    color: AppStyle().gradientColor4, // Background color of the "Coming Soon" label
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "Coming Soon",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppStyle().gradientColor3, // Text color of the "Coming Soon" label
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            itemName,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.blue[900],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
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



