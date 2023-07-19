import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle{


  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: backgroundColor, backgroundColor: buttonColor,
    // textStyle: Styles().h3TextStyle(),
    shape: const RoundedRectangleBorder(

      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );


  static  Color buttonColor= Colors.amber[800]!;
  Color gradientColor1 = Colors.amber[500]!;
  Color gradientColor2 = Colors.amber[800]!;
  Color gradientColor3 = Colors.blue[50]!;
  static Color backgroundColor = Colors.blue[50]!;
  static Color blue900 = Colors.blue[900]!;
  TextStyle paraTextStyle = GoogleFonts.poppins(
    color: Colors.blue[900],
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  TextStyle headingBlueTextStyle = GoogleFonts.poppins(
    color: Colors.blue[900],
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  TextStyle subHeadWhiteTextStyle = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  TextStyle subHeadBlueTextStyle = GoogleFonts.poppins(
    color: Colors.blue[900],
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  TextStyle defaultBold =  GoogleFonts.poppins(
    color: Colors.blue[900],
    fontWeight: FontWeight.w600,
  );
}