import 'package:caremint/controllers/home_controller.dart';
import 'package:caremint/franchise/controllers/tabview_controller.dart';
import 'package:caremint/franchise/views/canceled_orders.dart';
import 'package:caremint/franchise/views/completed_orders_page.dart';
import 'package:caremint/ui/components/loading_overlay_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../../models/userDataModel.dart';
import '../../services/api_requests.dart';
import '../controllers/customerInfo_controller.dart';
import 'ongoing_orders.dart';
import 'listing_services.dart';
import 'orders.dart';
class TabView extends StatelessWidget {
  const TabView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child:
    GetBuilder<TabviewController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              GetBuilder<HomeController>(
                builder: (hmCtrl) {
                  return IconButton(onPressed: (){
                    //perform logout
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
                      buttonColor: AppStyle.buttonColor,
                      cancelTextColor: AppStyle().gradientColor4,
                      confirmTextColor: AppStyle().gradientColor4,
                      onCancel: () {
                        Get.back();
                      },
                      onConfirm: () async {
                        ctrl.isLoading.value = true;
                        hmCtrl.userDetails = UserDataModel();
                        ctrl.store.write("user_token", "");
                        ctrl.store.write("user_name", "");
                        ctrl.store.write("user_email","");
                        ctrl.store.write("user_pincode", "");
                        ctrl.store.write("user_role", "");
                        ctrl.store.write("user_phone", "");
                        hmCtrl.isLoggedIn.value =false;
                        ctrl.isLoading.value = false;
                        Get.offAllNamed('/homenew');
                        ctrl.update();
                        hmCtrl.update();
                        // perform logout
                        print(ctrl.store.read("user_token"));
                        // ApiRequest(url: Constant.baseUrl+"/api/user-logout", frmData: null).postToken(
                        //     beforeSend: () => {},
                        //     onSuccess: (response){
                        //       print(response.data);
                        //       hmCtrl.userDetails = UserDataModel();
                        //       ctrl.store.write("user_token", "");
                        //       ctrl.store.write("user_name", "");
                        //       ctrl.store.write("user_email","");
                        //       ctrl.store.write("user_pincode", "");
                        //       ctrl.store.write("user_role", "");
                        //       ctrl.store.write("user_phone", "");
                        //       hmCtrl.isLoggedIn.value =false;
                        //       ctrl.isLoading.value = false;
                        //       Get.offAllNamed('/home');
                        //       ctrl.update();
                        //       hmCtrl.update();
                        //     },
                        //     onError: (error) => (){
                        //      ctrl.isLoading.value = false;
                        //      Get.snackbar(
                        //        'Oops',
                        //        'Logout Failed: Try Again',
                        //        snackPosition: SnackPosition.BOTTOM,
                        //        colorText: Color(0xffffffff),
                        //        backgroundColor: AppStyle().gradientColor2,
                        //        duration: Duration(seconds: 2),
                        //      );
                        //     });





                        // await auth.signOut().then((value) => Get.offAllNamed('/home'));


                      },
                    );
                  },
                    icon: Icon(Icons.logout_outlined,color: AppStyle().gradientColor1),
                    iconSize: 25,
                  );
                }
              )
            ],
            elevation: 0,
            backgroundColor: Colors.blue[900],
            title: Text("Franchise" ,
              style: GoogleFonts.poppins(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700),),
            bottom:  TabBar(
              labelStyle: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 10,
              ),
              isScrollable: true,
              indicator: UnderlineTabIndicator(

                  borderSide: BorderSide(width: 1.0,
                  color: Colors.white),

                  insets: EdgeInsets.symmetric(vertical: 5)
              ),
              labelColor: AppStyle().gradientColor1, // Change text color here
              unselectedLabelColor: AppStyle().gradientColor2,
              tabs: [
                Tab(text: "Orders"),
                Tab(text: "Ongoind Orders",),
                Tab(text: "Completed Orders"),
                Tab(text: "Canceled Orders",),
                // Tab(text: "Listing Service",)

              ],
            ),
          ),
          body: GetBuilder<CustomerInfoController>(
            builder: (customCtrl) {
              return LoadingOverlay(
                isLoading: customCtrl.isLoading.value,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const TabBarView(
                    children: [
                      Orders(),
                      CustomerInfo(),
                      CompletedOrderPage(),
                      CanceledOrderPage(),
                      // ListingServices(),

                    ],
                  ),
                ),
              );
            }
          ),
        );
      }
    ));
  }
}
