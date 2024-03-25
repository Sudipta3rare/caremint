import 'package:cached_network_image/cached_network_image.dart';
import 'package:caremint/app_routes.dart';
import 'package:caremint/controllers/testimonials_controller.dart';
import 'package:caremint/ui/pages/categories/category_page.dart';
import 'package:caremint/ui/pages/testimonial_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../bottombar/custom_bottom_bar.dart';
import '../../constants/app_colors.dart';
import '../../controllers/categories_controller/exterior_service_controller.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/my_orders_controller/my_order_controller.dart';
import '../../models/userDataModel.dart';
import '../components/custom_button.dart';
import '../widget/login_snackbar.dart';
import '../widget/signup_snackbar.dart';

class HomePageNew extends StatelessWidget {
  final HomeController ctrl = Get.put(HomeController());
  final TestimonialsController testimonialsCtrl =
      Get.put(TestimonialsController());

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            elevation: 0,
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Image.asset(
                    "assets/images/drawernavicon.png",
                    width: 30,
                    height: 30,
                    color: AppStyle().gradientColor2,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
            backgroundColor: Colors.blue[50],
            title: Row(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 80,
                  height: 80,
                ),
              ],
            ),
          ),
        ),
        endDrawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.5,
          surfaceTintColor: Colors.blue[900],
          backgroundColor: Colors.blue[50],
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(

                    // borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                  AppStyle().gradientColor1,
                  AppStyle().gradientColor2
                ])),
                child: Visibility(
                  child: Center(
                    child: Text(
                      "${ctrl.showName(ctrl.userDetails)}",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  visible: ctrl.isLoggedIn.value,
                  replacement: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Account',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  LoginSnackBar().loginSnackBar(context);
                                },
                                child: CustomButton()
                                    .customButtonWhiteB(context, "Log In")),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                                onTap: () {
                                  SignUpSnackBar().signUpSnackBar(context);
                                },
                                child: CustomButton()
                                    .customButtonWhiteB(context, "Sign Up")),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GetBuilder<MyOrderController>(builder: (ordCtrl) {
                return Visibility(
                  visible: ctrl.isLoggedIn.value,
                  child: ListTile(
                    title: const Text('My Orders'),
                    onTap: () {
                      // ordCtrl.isLoading.value = true;

                      // ordCtrl.getUserOrders();
                      // Update the state of the app.
                      // ...
                      ordCtrl.gotoMyOrders();
                    },
                  ),
                );
              }),

              // Note: For blogs Tile

              // ListTile(
              //   title: const Text('Blogs'),
              //   onTap: () {
              //     // Update the state of the app.
              //     // ...
              //     Get.to(BlogPage());
              //   },
              // ),

              /*ListTile(
                title: const Text('Testimonials'),
                onTap: () {
                  Get.to(Testimonials());
                  // Update the state of the app.
                  // ...
                },
              ),*/
              Visibility(
                visible: ctrl.isLoggedIn.value,
                child: ListTile(
                  title: const Text('Logout'),
                  onTap: () {
                    Get.defaultDialog(
                      title: 'Account',
                      titleStyle: TextStyle(
                        color: AppStyle()
                            .gradientColor2, // Replace with your desired color
                      ),
                      middleTextStyle: AppStyle().subHeadBlueTextStyle,
                      content: Text(
                        'Do you want to exit?',
                        style: AppStyle().paraTextStyle,
                      ),
                      textCancel: 'Cancel',
                      textConfirm: 'OK',
                      buttonColor: AppStyle.buttonColor,
                      cancelTextColor: AppStyle().gradientColor4,
                      confirmTextColor: AppStyle().gradientColor4,
                      onCancel: () {
                        Get.back();
                      },
                      onConfirm: () async {
                        ctrl.userDetails = UserDataModel();
                        ctrl.store.write("user_token", "");
                        ctrl.store.write("user_name", "");
                        ctrl.store.write("user_email", "");
                        ctrl.store.write("user_pincode", "");
                        ctrl.store.write("user_role", "");
                        ctrl.store.write("user_phone", "");
                        ctrl.isLoggedIn.value = false;
                        Get.offAllNamed('/homenew');
                        ctrl.update();
                        // perform logout
                        //   print(ctrl.store.read("user_token"));
                        // ApiRequest(url: Constant.baseUrl+"/api/user-logout", frmData: null).postToken(
                        //     beforeSend: () => {},
                        //     onSuccess: (response){
                        //   print(response.data);
                        //       ctrl.userDetails = UserDataModel();
                        //       ctrl.store.write("user_token", "");
                        //       ctrl.store.write("user_name", "");
                        //       ctrl.store.write("user_email","");
                        //       ctrl.store.write("user_pincode", "");
                        //       ctrl.store.write("user_role", "");
                        //       ctrl.store.write("user_phone", "");
                        //       ctrl.isLoggedIn.value =false;
                        //       Get.offAllNamed('/home');
                        //     ctrl.update();
                        //     },
                        //     onError: (error) => {
                        //       print("error")
                        //     });

                        // await auth.signOut().then((value) => Get.offAllNamed('/home'));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.blue[50],
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    fit: BoxFit.cover,
                    width: 650,
                    height: 450,
                    "assets/images/homepageheader.png",
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
                  serviceWidget(context),
                  testimonialsWidget(context),
                  clientReviewWidget(context),
                  SizedBox(height: 20),
                ],
              ),
            )),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }

  Widget clientReviewWidget(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Column(
        children: [
          SizedBox(height: 20),
          Text("What clients say",
              style: TextStyle(
                  color: Color(0XFF005797),
                  fontSize: 18,
                  fontFamily: "PoppinsSemiBold")),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 150,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ctrl.reviews.map((review) {

                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),child: Container(
                        height: 115,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0XFFB5F446),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/lisa.png",
                                  width: 49,
                                  height: 50,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    children: List.generate(double.parse(review.rating).toInt(), (index) {
                                      return Icon(Icons.star, color: Color(0XFFFFD700), size: 12);
                                    }),
                                  ),
                                ),

                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                    review.review,
                                    style: TextStyle(
                                        color: Color(0XFF005797),
                                        fontSize: 8,
                                        fontFamily: "PoppinsRegular"))),
                            Padding(
                                padding: EdgeInsets.only(left: 5, top: 5),
                                child: Text('"${review.userLogin}"',
                                    style: TextStyle(
                                        color: Color(0XFF005797),
                                        fontSize: 12,
                                        fontFamily: "PoppinsBold"))),
                          ],
                        ),
                      ));
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/loadingindecator.png",
                color: Color(0XFF164378),
                width: 24,
                height: 24,
              ),
              Image.asset(
                "assets/images/loadingindecator.png",
                color: Color(0XFFB5F446),
                width: 24,
                height: 24,
              ),
              Image.asset(
                "assets/images/loadingindecator.png",
                color: Color(0XFF164378),
                width: 24,
                height: 24,
              ),
            ],
          )
        ],
      );
    });
  }


  Widget testimonialsWidget(BuildContext context) {
    final TestimonialsController testimonialsCtrl =
        Get.put(TestimonialsController());
    return Column(
      children: [
        Text(
          "Testimonials",
          style: TextStyle(
            color: Color(0XFF005797),
            fontSize: 18,
            fontFamily: "PoppinsSemiBold",
          ),
        ),
        SizedBox(height: 10),
        Container(
            // Wrap ListView.builder with Container
            height: 150, // Specify a height for the ListView
            child: Obx(() => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: testimonialsCtrl.imageUrls.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Get.to(Testimonials());
                        },
                        child: Container(
                          height: 120,
                          width: 190,
                          margin: EdgeInsets.all(8),
                          // Add margin between images
                          decoration: BoxDecoration(
                            color: Color(0XFFFFFF),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Color(0XFFB5F446),
                              width: 2,
                            ),
                          ),
                          child: Image.network(
                            testimonialsCtrl.imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ));
                  },
                ))),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/loadingindecator.png",
              color: Color(0XFF164378),
              width: 24,
              height: 24,
            ),
            Image.asset(
              "assets/images/loadingindecator.png",
              color: Color(0XFFB5F446),
              width: 24,
              height: 24,
            ),
            Image.asset(
              "assets/images/loadingindecator.png",
              color: Color(0XFF164378),
              width: 24,
              height: 24,
            ),
          ],
        )
      ],
    );
  }

  Widget serviceWidget(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Container(
        height: 300,
        /*decoration: BoxDecoration(
            color: Color(0XFFFFFFFF),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 20,
                color: Colors.blueGrey.withOpacity(0.6),
              )
            ]),*/
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("Service Process",
                style: TextStyle(
                    color: Color(0XFF005797),
                    fontSize: 18,
                    fontFamily: "PoppinsSemiBold")),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
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
                            height: 176,
                            width: 160,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 14,
                            child: Container(
                              height: 65,
                              width: 132,
                              color: Colors.black.withOpacity(0.75),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Schedule Services",
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
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/loadingindecator.png",
                  color: Color(0XFF164378),
                  width: 24,
                  height: 24,
                ),
                Image.asset(
                  "assets/images/loadingindecator.png",
                  color: Color(0XFFB5F446),
                  width: 24,
                  height: 24,
                ),
                Image.asset(
                  "assets/images/loadingindecator.png",
                  color: Color(0XFF164378),
                  width: 24,
                  height: 24,
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
        height: 320,
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
            SizedBox(height: 20),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: List.generate(
                  ctrl.categoryList.length,
                      (index) => Column(
                    children: [
                      if (ctrl.categoryList[index].img != null)
                        Image.network(
                          ctrl.categoryList[index].img.toString(),
                          fit: BoxFit.fill,
                          height: 63,
                          width: 63,
                        ),
                      SizedBox(height: 5),
                      if (ctrl.categoryList[index].categoryName != null)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            textAlign: TextAlign.center,
                            ctrl.categoryList[index].categoryName.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.to(CategoryPage());
              },
              child: Text("Show All",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF164378))),
            ),
            SizedBox(height: 10)
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
