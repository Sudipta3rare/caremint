import 'package:caremint/ui/components/text_componets.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AppBarComponent {
  AppBar appBar(String title){
    return AppBar(
      iconTheme: IconThemeData(color: AppStyle.buttonColor),
      // leadingWidth: 10,
      backgroundColor: Colors.blue[50],
      title:         TextComponet().headingText("$title"),
      centerTitle: true,
      elevation: 0,
    );
  }
}