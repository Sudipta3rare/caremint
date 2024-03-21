import 'package:caremint/constants/app_colors.dart';
import 'package:caremint/franchise/controllers/submit_Picture_Controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

import '../models/ongoingOrderModel.dart';

class SubmitPictures extends StatelessWidget {
   SubmitPictures({super.key, required this.order });

  SubmitPictureController ctrl = Get.put(SubmitPictureController());
  OngoingOrders order ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: AppStyle().gradientColor1), // Set the color of the back button
        backgroundColor: Colors.blue[900],
        title: Text("Submit Pictures",style: TextStyle(color: AppStyle().gradientColor1)),
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
        if(ctrl.imagePathList.isEmpty || ctrl.des.text == ""){
          Get.snackbar(
            'Error!',
            'Please enter a valid image and message.',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Color(0xffffffff),
            backgroundColor: AppStyle().gradientColor2,
            duration: Duration(seconds: 2),
          );
        }
        else{
          //Submit order code here
          ctrl.postSubmitPicture(order);

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
          return Column(

            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: GoogleFonts.poppins(),
                controller: ctrl.des,
                decoration: InputDecoration(
                  hintText: 'Write a message',
                  filled: true,
                ),
              keyboardType: TextInputType.multiline,
              minLines: 1,//Normal textInputField will be displayed
              maxLines: 10,// when user presses enter it will adapt to it
          ),
            ),
              Expanded(
              child: ctrl.imagePathList.isNotEmpty ? GridView.builder(
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
              : Center(child: Text("No image selected! \n To complete the order please submit picture.", textAlign: TextAlign.center,)),
            ),],
          );
        }
      ),
    );
  }
}
