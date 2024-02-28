import 'package:caremint/controllers/categories_controller/category_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.90,
                    mainAxisSpacing: 0.10),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/interiorimg.png",
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              bottom: 0, // Align the container to the bottom
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                width: 130,
                                height: 50,
                                child:Text("Interior Service",
                                    style: TextStyle(color:Color(0XFF005797),
                                        fontSize:12,
                                        fontFamily:"PoppinsSemiBold"),textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/exteriorimg.png",
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              bottom: 0, // Align the container to the bottom
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                width: 130,
                                height: 50,
                                child:Text("Exterior Service",
                                    style: TextStyle(color:Color(0XFF005797),
                                        fontSize:12,
                                        fontFamily:"PoppinsSemiBold"),textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/interiorandexteriorimg.png",
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              bottom: 0, // Align the container to the bottom
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                width: 130,
                                height: 50,
                                child:Text("Interior + Exterior",
                                    style: TextStyle(color:Color(0XFF005797),
                                        fontSize:12,
                                        fontFamily:"PoppinsSemiBold"),textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/deepcleaningimg.png",
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              bottom: 0, // Align the container to the bottom
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                width: 130,
                                height: 50,
                                child:Text("Deep Cleaning",
                                    style: TextStyle(color:Color(0XFF005797),
                                        fontSize:12,
                                        fontFamily:"PoppinsSemiBold"),textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/monthlysubimg.png",
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              bottom: 0, // Align the container to the bottom
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                width: 130,
                                height: 50,
                                child:Text("Monthly Subscription",
                                    style: TextStyle(color:Color(0XFF005797),
                                        fontSize:12,
                                        fontFamily:"PoppinsSemiBold"),textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/ceramicimg.png",
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              bottom: 0, // Align the container to the bottom
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                width: 130,
                                height: 50,
                                child:Text("Ceramic Coating",
                                    style: TextStyle(color:Color(0XFF005797),
                                        fontSize:12,
                                        fontFamily:"PoppinsSemiBold"),textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 40,
      leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Image.asset(
            "assets/images/backbutton.png",
            width: 20,
            height: 20,
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
