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
        body:  Container(
          width:double.maxFinite,
          height: double.maxFinite,
          color:  const Color(0XFF164378),
          child:  Column(
            children: [
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10),child: Container(
                      height: 50  ,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25), // More than 50% of width makes it a circle
                      )
                    )),
                    Padding(padding: EdgeInsets.all(10),child: Container(
                      height: 50,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25), // More than 50% of width makes it a circle
                      )
                    )),
                    Padding(padding: EdgeInsets.all(10),child: Container(
                      height: 50,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25), // More than 50% of width makes it a circle
                      )
                    )),
                    Padding(padding: EdgeInsets.all(10),child: Container(
                      height: 50,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25), // More than 50% of width makes it a circle
                      ),
                    )),
                  ],
                ),
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
        leading: Padding(padding: EdgeInsets.only(left: 20),child: Image.asset(
          "assets/images/backbutton.png",
          width: 20,
          height: 20,
        )),
        centerTitle: true,
        title:Text("Category",style: TextStyle(color:Color(0XFFB5F446),fontSize:25,fontFamily:"PoppinsSemiBold",)),
    );
  }

}
