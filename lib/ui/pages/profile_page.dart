import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../bottombar/custom_bottom_bar.dart';
import '../widget/custom_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                 // border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/images/profilepicture.png',height: 200, width: 200,
                    fit: BoxFit.cover) // Replace 'default_image.png' with your actual default image asset path
                ),
              ),
              Text("Username",style: TextStyle(color:Colors.white,fontSize:25,fontFamily:"PoppinsRegular")),
              SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                width: 305,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all( Radius.circular(25.0)),
                ),
                child:Text("Email Id",style: TextStyle(color:Color(0XFF164378),fontSize:20,fontFamily:"PoppinsRegular"))
              ),

              SizedBox(height: 25),

              Container(
                  alignment: Alignment.center,
                  width: 305,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all( Radius.circular(25.0)),
                  ),
                  child:Text("Phone",style: TextStyle(color:Color(0XFF164378),fontSize:20,fontFamily:"PoppinsRegular"))
              ),

              SizedBox(height: 25),

              Container(
                  alignment: Alignment.center,
                  width: 305,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all( Radius.circular(25.0)),
                  ),
                  child:Text("Pin Code",style: TextStyle(color:Color(0XFF164378),fontSize:20,fontFamily:"PoppinsRegular"))
              ),

              SizedBox(height: 40),

              Divider(
                  indent: 135,
                  endIndent: 135,
                  color: Colors.white),
            ],

          ),
        ),
        bottomNavigationBar: CustomBottomBar(),
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
      title: Text("Profile",
          style: TextStyle(
            color: Color(0XFFB5F446),
            fontSize: 25,
            fontFamily: "PoppinsSemiBold",
          )),
    );
  }

}


