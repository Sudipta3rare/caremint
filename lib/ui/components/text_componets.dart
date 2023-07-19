import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";


class TextComponet {
  Widget headingText(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: 28,
          color: Colors.blue.shade800,
          fontWeight: FontWeight.w700),
    );
  }
}