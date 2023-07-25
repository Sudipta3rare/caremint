import 'package:caremint/constants/app_colors.dart';
import 'package:caremint/franchise/controllers/submit_Picture_Controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class SubmitPictures extends StatelessWidget {
   SubmitPictures({super.key});

  SubmitPictureController ctrl = Get.put(SubmitPictureController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Submit Pictures", ),
        centerTitle: false,
        leadingWidth: 20,
        actions: [
          IconButton(onPressed: (){
            ctrl.pickCameraImage();
            ctrl.update();

          }, icon: Icon(Icons.camera_alt_outlined),  color: Colors.white,),
          IconButton(onPressed: (){
            ctrl.imagePathList = [];
            ctrl.pickMultipleImg();
            ctrl.update();}, icon: Icon(Icons.photo) , color: Colors.white,)
        ],
      ),
      body: _showBody(context),

      floatingActionButton: ElevatedButton(onPressed: (){
        if(ctrl.imagePathList.isEmpty){
          Get.snackbar(
            'No image selected',
            'Please select a valid image.',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Color(0xffffffff),
            backgroundColor: AppStyle().gradientColor2,
            duration: Duration(seconds: 2),
          );
        }
        else{
          //Submit order code here
        }

      } , child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Submit", style: GoogleFonts.poppins(color: Colors.white),),
      ), style: AppStyle.primaryButtonStyle,)
    );
  }
  Widget _showBody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GetBuilder<SubmitPictureController>(
        builder: (ctrl) {
          return ctrl.imagePathList.isNotEmpty ? GridView.builder(
            padding: EdgeInsets.all(20),
              itemCount: ctrl.imagePathList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0
          ),
              itemBuilder: (context, index){
              print(ctrl.imagePathList[index].path);
            return Image.file(File(ctrl.imagePathList[index].path));
              })
          : Center(child: Text("No image selected! \n To complete the order please submit picture.", textAlign: TextAlign.center,));
        }
      ),
    );
  }
}
