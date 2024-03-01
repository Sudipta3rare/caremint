import 'package:flutter/material.dart';
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
                     Padding(padding: EdgeInsets.only(left: 15,bottom: 15),
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text("Caremint helps protect",
                             style: TextStyle(color:Colors.black,
                                 fontSize:13.3,
                                 fontFamily:"PoppinsSemiBold")),
                         Text("your car from",
                             style: TextStyle(color:Colors.black,
                                 fontSize:13.3,
                                 fontFamily:"PoppinsSemiBold")),
                         SizedBox(height: 10),
                         Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                                     style: TextStyle(color:Colors.black,
                                         fontSize:10,
                                         fontFamily:"PoppinsSemiBold")),
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
                                     style: TextStyle(color:Colors.black,
                                         fontSize:10,
                                         fontFamily:"PoppinsSemiBold")),
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
                                     style: TextStyle(color:Colors.black,
                                         fontSize:10,
                                         fontFamily:"PoppinsSemiBold")),
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
                                     style: TextStyle(color:Colors.black,
                                         fontSize:10,
                                         fontFamily:"PoppinsSemiBold")),
                               ],
                             ),
                           ],
                         ),
                         SizedBox(height: 10),
                         Text("Contributes to the society",
                             style: TextStyle(color:Color(0XFF005797),
                                 fontSize:12,
                                 fontFamily:"PoppinsSemiBold")),
                         Text("by saving water",
                             style: TextStyle(color:Color(0XFF005797),
                                 fontSize:12,
                                 fontFamily:"PoppinsSemiBold")),
                       ],
                     ),),
                     Image.asset(
                       "assets/images/savewater.png",
                       width: 171,
                       height: 171,
                     ),
                   ],
                 )
                ],
              ),
            )),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
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
