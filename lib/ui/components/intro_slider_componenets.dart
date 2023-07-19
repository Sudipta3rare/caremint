import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro {
  String title;

  Intro(this.title);

  // Widget buildButton(BuildContext context) {
  //   return Container(
  //     width: 200,
  //     padding: const EdgeInsets.all(10),
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(50),
  //         // color: const Color.fromARGB(255, 112, 91, 222),
  //         color: Colors.blue.shade900),
  //     child: Text(
  //       "$title",
  //       style: const TextStyle(
  //         color: Colors.white,
  //         fontWeight: FontWeight.bold,
  //         fontSize: 28,
  //       ),
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }

  Widget textPara(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text('$title',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.grey[700],
          )
        // style: TextStyle(
        //   fontFamily: GoogleFonts.poppins(),
        //   fontSize: 16,
        //   color: Colors.grey[700],
        // ),
      ),
    );
  }

  Widget textHeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Text(
        '$title',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(fontSize: 30  , fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget sliderImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Image.asset("$title"),
    );
  }
}