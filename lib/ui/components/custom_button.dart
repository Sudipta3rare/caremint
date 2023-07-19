import 'package:caremint/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomButton{
  Widget customButton200(context, String title, ){
    return Container(
      height: 50,
      width: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          // color: const Color.fromARGB(255, 112, 91, 222),
          // color: Colors.blue.shade900,
          gradient:  LinearGradient(colors: [
            // Colors.blueAccent,
            // Colors.lightBlueAccent
            AppStyle().gradientColor1,
            AppStyle().gradientColor2,
          ])),
      child: Center(
        child: Text(
          '$title',
          style:
            GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,


          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget customButtonWhiteS(context, String title){
    return Container(
      // height: 50,
      // width: 100,
      margin: EdgeInsets.all(2),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          // color: const Color.fromARGB(255, 112, 91, 222),
          color: Colors.white,
          // gradient: const LinearGradient(colors: [
          //   Colors.blueAccent,
          //   Colors.lightBlueAccent
          // ]
          // )
      ),
      child: Center(
        child: Text(
          '$title',
          style:
          GoogleFonts.poppins(
            color: Colors.blue[900],
            fontWeight: FontWeight.w600,
            fontSize: 12,


          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget customButtonWhiteB(context, String title){
    return Container(
      height: 35,
      width: 75,
      /*margin: EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),*/
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        // color: const Color.fromARGB(255, 112, 91, 222),
        color: Colors.white,
        // gradient: const LinearGradient(colors: [
        //   Colors.blueAccent,
        //   Colors.lightBlueAccent
        // ]
        // )
      ),
      child: Center(
        child: Text(
          '$title',
          style:
          GoogleFonts.poppins(
            color: Colors.blue[900],
            fontWeight: FontWeight.w600,
            fontSize: 12,


          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}