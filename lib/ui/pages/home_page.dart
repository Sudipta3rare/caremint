
import 'package:cached_network_image/cached_network_image.dart';
import 'package:caremint/constants/app_colors.dart';
import 'package:caremint/controllers/categories_controller/exterior_service_controller.dart';
import 'package:caremint/controllers/home_controller.dart';
import 'package:caremint/controllers/my_orders_controller/my_order_controller.dart';

import 'package:caremint/ui/components/custom_button.dart';
import 'package:caremint/ui/pages/testimonial_page.dart';
import 'package:caremint/ui/widget/login_snackbar.dart';
import 'package:caremint/ui/widget/signup_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:sizer/sizer.dart';

import '../../models/userDataModel.dart';
import '../components/loading_overlay_components.dart';
import '../components/text_componets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (ctrl) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: AppBar(
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.blue[900]),
                backgroundColor: Colors.blue[50],
                title: Row(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 100,
                      height: 100,
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
                        child: Text("${ctrl.showName(ctrl.userDetails)}",style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),),
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
                  GetBuilder<MyOrderController>(
                    builder: (ordCtrl) {
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
                    }
                  ),

                  // Note: For blogs Tile

                  // ListTile(
                  //   title: const Text('Blogs'),
                  //   onTap: () {
                  //     // Update the state of the app.
                  //     // ...
                  //     Get.to(BlogPage());
                  //   },
                  // ),

                  ListTile(
                    title: const Text('Testimonials'),
                    onTap: () {
                      Get.to(Testimonials());
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  Visibility(
                    visible: ctrl.isLoggedIn.value,
                    child: ListTile(
                      title: const Text('Logout'),
                      onTap: () {
                        Get.defaultDialog(
                          title: 'Account',
                          titleStyle: TextStyle(
                            color: AppStyle().gradientColor2, // Replace with your desired color
                          ),
                          middleTextStyle: AppStyle().subHeadBlueTextStyle,
                          content: Text(
                            'Do you want to exit?',
                            style: AppStyle().paraTextStyle,
                          ),
                          textCancel: 'Cancel',
                          textConfirm: 'OK',
                          buttonColor: AppStyle().gradientColor3,
                          cancelTextColor: AppStyle().gradientColor1,
                          confirmTextColor: AppStyle().gradientColor1,
                          onCancel: () {
                            Get.back();
                          },
                          onConfirm: () async {
                            ctrl.userDetails = UserDataModel();
                            ctrl.store.write("user_token", "");
                            ctrl.store.write("user_name", "");
                            ctrl.store.write("user_email","");
                            ctrl.store.write("user_pincode", "");
                            ctrl.store.write("user_role", "");
                            ctrl.store.write("user_phone", "");
                            ctrl.isLoggedIn.value = false;
                            Get.offAllNamed('/home');
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
            backgroundColor: Colors.blue.shade50,
            body:  LoadingOverlay(
                isLoading: ctrl.isLoading.value,
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
                    child: CustomScrollView(
                      // shrinkWrap: true,
                        slivers: [
                          SliverList(
                            delegate: SliverChildListDelegate([
                              headerBanner(context),
                              SizedBox(
                                height: 2.h,
                              ),
                              locationWidget(context),
                              SizedBox(
                                height: 2.h,
                              ),
                            ]),
                          ),
                          // SizedBox(
                          //   height: 5.h,
                          // ),
                          SliverGrid(
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.9,
                                    crossAxisSpacing: 5.0),
                                delegate: SliverChildBuilderDelegate(
                                  childCount: ctrl.categoryList.length,
                                      (context, index) => homeCard(context,
                                        ctrl.categoryList[index].categoryName.toString(),
                                        ctrl.categoryList[index].id.toString(),
                                        ctrl.categoryList[index].img.toString(), ),
                                )),

                          SliverList(
                            delegate:
                            SliverChildListDelegate([processLayout(context)]),
                          )
                        ]),
                  ),
                ),
              )

          );
        }
    );
  }

  Widget processLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextComponet().headingText("Service Process"),
        SizedBox(
          height: 6,
        ),
        processCard(context, "Choose & Schedule your Services",
            "assets/images/slider2.png"),
        Image.asset(
          "assets/images/arrow.png",
          height: 4.h,
          width: 4.h,
        ),
        processCard(context, "Door Step Services", "assets/images/blog1.png"),
        Image.asset(
          "assets/images/arrow.png",
          height: 4.h,
          width: 4.h,
        ),
        processCard(context, "Pay Online or COD", "assets/images/service3.png"),
      ],
    );
  }

  Widget processCard(BuildContext context, String title, String image) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Colors.blueAccent,
            Colors.lightBlue[200]!,
          ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
      width: MediaQuery.of(context).size.width,
      height: 30.h,
      child: GestureDetector(
        onTap: () {
          // Get.off(TabView());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[50],
              radius: 60,
              child: Image.asset(
                image,
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "$title",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }


  Widget homeCard(BuildContext context, String itemName, String catName, String catImg,) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Card(
          color: Colors.blue[100],
          shadowColor: Colors.cyan,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 4,
          margin: EdgeInsets.all(5),
          child: Center(
            child: GetBuilder<ExteriorServiceController>(builder: (exCtrl) {
              return GestureDetector(
                onTap: () {
                  if(ctrl.isLoggedIn.value){
                    // print(ctrl.userDetails.pincode);
                    print(ctrl.store.read("user_token"));
                    exCtrl.gotoService(catName, itemName, ctrl.userDetails.pincode );
                  }
                  else{
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
                        RippleAnimation(
                          color: Colors.blue,
                          delay: const Duration(milliseconds: 3000),
                          repeat: true,
                          minRadius: 50,
                          ripplesCount: 4,
                          duration: const Duration(milliseconds: 7000),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            // radius: 50,
                            maxRadius: 55,
                            minRadius: 40,
                            child:CachedNetworkImage(
                              placeholder: (context, url) => const CircularProgressIndicator(),

                              imageUrl: catImg,
                            fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          itemName,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              // fontWeight: FontWeight.w600,
                              color: Colors.blue[900]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      }
    );
  }

  Widget locationWidget(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
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
                    color: Colors.blue[900])),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  formBuild(context, Icon(Icons.location_city_outlined), "City", ctrl.city),
                  // formBuild(context, Icon(Icons.category), "Category"),
                  formBuild(
                      context, Icon(Icons.pin_drop_outlined), "Pin code", ctrl.pincode),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.category_outlined,
                      color: AppStyle.buttonColor),
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
                      style: AppStyle().paraTextStyle,
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
                    if(ctrl.isLoggedIn.value){
                     if(ctrl.pincode.text.isEmpty || ctrl.city.text.isEmpty || ctrl.currentItem=='Category'){
                        Get.snackbar("Error", "Please enter proper value in all fields",
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Color(0xffffffff),
                          backgroundColor: AppStyle().gradientColor2,
                          duration: Duration(seconds: 2),);
                        ctrl.update();
                   }
                    else {

                      exCtrl.gotoService(ctrl.selectItems.indexOf(ctrl.currentItem).toString(), ctrl.city.text,ctrl.pincode.text);
                    }
                  }
                    else{
                      LoginSnackBar().loginSnackBar(context);
                    }
                  },
                  child: CustomButton()
                      .customButton200(context, "Search"));
            }),
            SizedBox(
              height: 2,
            )
          ],
        ),
      );
    });
  }

  Widget headerBanner(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
          topRight: Radius.circular(80),
        ),
        gradient: const LinearGradient(colors: [
          Colors.blueAccent,
          Colors.lightBlueAccent,
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 10),
            blurRadius: 20,
            color: Colors.blueAccent.withOpacity(0.5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top:  MediaQuery.of(context).size.height * 0.12,
            child: SizedBox(
              width: 200,
              child: Image.asset("assets/images/hometop.png"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 25, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CAREMINT",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),

                Text(
                  "Protects from Rusting, Paint fading, Swirl marks, Water spots and also contribute to the society by saving water !",
                  style: GoogleFonts.dmSans(
                    fontSize: 17,
                    color: Colors.white,

                  ),
                  overflow: TextOverflow.clip,
                )
              ],
            ),
          ),
        ],
      )


    );
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
                color: Colors.blue[900], fontWeight: FontWeight.w500),
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
