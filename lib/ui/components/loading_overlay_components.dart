import 'package:caremint/constants/app_colors.dart';
import 'package:flutter/material.dart';



class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingOverlay({
    Key? key,
    required this.isLoading,
    required this.child,
  })  : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return  Center(
        child: CircularProgressIndicator(color: AppStyle.buttonColor,),
      );
    }
    return child;
  }
}
