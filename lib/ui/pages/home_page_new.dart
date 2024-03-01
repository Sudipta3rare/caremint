import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../bottombar/custom_bottom_bar.dart';
import '../../constants/app_colors.dart';
import '../../controllers/categories_controller/exterior_service_controller.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/home_page_new_controller.dart';
import '../components/custom_button.dart';
import '../widget/login_snackbar.dart';

class HomePageNew extends StatelessWidget {
  final HomePageNewController controller = Get.put(HomePageNewController());

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: const Color(0XFFFFFFF),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/homepageheader.png",
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, right: 20, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/logo.png",
                              width: 90,
                              height: 41.29,
                            ),
                            Image.asset(
                              "assets/images/drawernavicon.png",
                              width: 30,
                              height: 30,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: locationWidget(context)),
                  Text("Why Choose Us?",
                      style: TextStyle(
                          color: Color(0XFF005797),
                          fontSize: 18,
                          fontFamily: "PoppinsSemiBold")),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Caremint helps protect",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.3,
                                    fontFamily: "PoppinsSemiBold")),
                            Text("your car from",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.3,
                                    fontFamily: "PoppinsSemiBold")),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/righticon.png",
                                      width: 12,
                                      height: 13.33,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Rusting",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontFamily: "PoppinsSemiBold")),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/righticon.png",
                                      width: 12,
                                      height: 13.33,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Paint Fading",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontFamily: "PoppinsSemiBold")),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/righticon.png",
                                      width: 12,
                                      height: 13.33,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Swirl Marks",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontFamily: "PoppinsSemiBold")),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/righticon.png",
                                      width: 12,
                                      height: 13.33,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Water Spots  ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontFamily: "PoppinsSemiBold")),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text("Contributes to the society",
                                style: TextStyle(
                                    color: Color(0XFF005797),
                                    fontSize: 12,
                                    fontFamily: "PoppinsSemiBold")),
                            Text("by saving water",
                                style: TextStyle(
                                    color: Color(0XFF005797),
                                    fontSize: 12,
                                    fontFamily: "PoppinsSemiBold")),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/images/savewater.png",
                        width: 171,
                        height: 171,
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: categoryWidget(context)),
                  Padding(padding: EdgeInsets.only(right: 20,left: 20),child: serviceWidget(context)),
                  SizedBox(height: 50),
                ],
              ),
            )),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }

  /// Section Widget
/*  Widget _buildJobListingSlider() {
    return Obx(
          () => CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: 0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 2),
          viewportFraction: 0.7,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {

          },
        ),
        itemCount: ,
        itemBuilder: (context, index, realIndex) {
        },
      ),
    );
  }*/

  Widget serviceWidget(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
            color: Color(0XFFFFFFFF),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 20,
                color: Colors.blueGrey.withOpacity(0.6),
              )
            ]),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("Service Process",
                style: TextStyle(
                    color: Color(0XFF005797),
                    fontSize: 18,
                    fontFamily: "PoppinsSemiBold")),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/chooseandscheduleservices.png",
                      fit: BoxFit.fill,
                      height: 136,
                      width: 113,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 15.50,
                      child: Container(
                        height: 65,
                        width: 100,
                        color: Colors.black.withOpacity(0.75),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Choose Services",
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                            Image.asset(
                              "assets/images/splasharrow.png",
                              fit: BoxFit.fill,
                              height: 24,
                              width: 34,
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/doorstepservices.png",
                      fit: BoxFit.fill,
                      height: 136,
                      width: 120,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      child: Container(
                        height: 65,
                        width: 100,
                        color: Colors.black.withOpacity(0.75),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Doorstep Services",
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                            Image.asset(
                              "assets/images/splasharrow.png",
                              fit: BoxFit.fill,
                              height: 24,
                              width: 34,
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/payonlineorcod.png",
                      fit: BoxFit.fill,
                      height: 136,
                      width: 113,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 65,
                        width: 98,
                        color: Colors.black.withOpacity(0.75),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Pay Online",
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                            Image.asset(
                              "assets/images/splasharrow.png",
                              fit: BoxFit.fill,
                              height: 24,
                              width: 34,
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  Widget categoryWidget(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration: BoxDecoration(
            color: Color(0XFF164378),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 20,
                color: Colors.blueGrey.withOpacity(0.6),
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter, // Start from the top
                end: Alignment.bottomCenter,
                colors: [Color(0XFF2768B4), Color(0XFFBCE886)])),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("Categories",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            Expanded(
                child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: <Widget>[
                Column(
                  children: [
                    Image.asset(
                      "assets/images/interior.png",
                      fit: BoxFit.fill,
                      height: 80,
                      width: 80,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Interior Service",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/exterior.png",
                      fit: BoxFit.fill,
                      height: 80,
                      width: 80,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Exterior Service",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/interiorandexterior.png",
                      fit: BoxFit.fill,
                      height: 80,
                      width: 80,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Interior + Exterior",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/deepcleaning.png",
                      fit: BoxFit.fill,
                      height: 63,
                      width: 63,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Deep Cleaning",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/monthlysub.png",
                      fit: BoxFit.fill,
                      height: 63,
                      width: 63,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Monthly Subscription",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/ceramic.png",
                      fit: BoxFit.fill,
                      height: 63,
                      width: 63,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Ceramic Coating",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
      );
    });
  }

  Widget locationWidget(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration: BoxDecoration(
          color: Color(0XFF164378),
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 20,
              color: Colors.blueGrey.withOpacity(0.6),
            )
          ],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Search Service Provider",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  formBuild(
                      context,
                      Icon(Icons.location_city_outlined,
                          color: Color(0XFFB5F446)),
                      "City",
                      ctrl.city),
                  // formBuild(context, Icon(Icons.category), "Category"),
                  formBuild(
                      context,
                      Icon(Icons.pin_drop_outlined, color: Color(0XFFB5F446)),
                      "Pin code",
                      ctrl.pincode),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: DropdownButtonFormField(
                dropdownColor: Color(0XFF164378),
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.category_outlined, color: Color(0XFFB5F446)),
                ),
                hint: Text(
                  "Select Category",
                  style: AppStyle().paraTextStyle,
                ),
                value: ctrl.currentItem,
                items: ctrl.selectItems
                    .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (String? value) {
                  ctrl.currentItem = value!;
                  ctrl.update();
                },
              ),
            ),
            GetBuilder<ExteriorServiceController>(builder: (exCtrl) {
              return GestureDetector(
                  onTap: () {
                    if (ctrl.isLoggedIn.value) {
                      if (ctrl.pincode.text.isEmpty ||
                          ctrl.city.text.isEmpty ||
                          ctrl.currentItem == 'Category') {
                        Get.snackbar(
                          "Error",
                          "Please enter proper value in all fields",
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Color(0xffffffff),
                          backgroundColor: AppStyle().gradientColor2,
                          duration: Duration(seconds: 2),
                        );
                        ctrl.update();
                      } else {
                        exCtrl.gotoService(
                            ctrl.selectItems
                                .indexOf(ctrl.currentItem)
                                .toString(),
                            ctrl.city.text,
                            ctrl.pincode.text);
                      }
                    } else {
                      LoginSnackBar().loginSnackBar(context);
                    }
                  },
                  child: CustomButton().customButton200(context, "Search"));
            }),
            SizedBox(
              height: 2,
            )
          ],
        ),
      );
    });
  }

  Widget formBuild(BuildContext context, Icon icon, String title,
      TextEditingController ctrl) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextFormField(
          controller: ctrl,
          // enabled: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(1, 1, 12, 10),
            hintText: title,
            hintStyle: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w500),
            icon: icon,
            iconColor: AppStyle.buttonColor,
            border: const UnderlineInputBorder(),
            // labelText: '$title',
          ),
        ),
      ),
    );
  }
}
