import 'package:caremint/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchBox extends StatelessWidget {
  const SearchBox( {required this.onChanged, required this.ctrl} );
  final dynamic ctrl;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4, // 5 top and bottom
      ),
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(2,3),
        //     blurRadius: 30,
        //     color: Colors.black12.withOpacity(0.4)
        //   )
        // ],
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        cursorColor: Colors.white,
        onChanged: onChanged,
        style:  GoogleFonts.poppins(
          color: Colors.white,
        ),
        decoration: InputDecoration(

          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon:Icon(Icons.search,color: AppStyle.backgroundColor,),
          hintText: 'Search Service',
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}