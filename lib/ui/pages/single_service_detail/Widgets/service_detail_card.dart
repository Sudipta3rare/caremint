import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:caremint/constants/app_colors.dart';
import 'package:caremint/ui/pages/single_service_detail/Widgets/service_order_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../models/service_detial.dart';

class ServiceDetailCard extends StatelessWidget {
  ServiceDetailCard({required this.serviceDetial, required this.itemIndex, Key? key, required this.serviceProviderId})
      : super(key: key);
 final Service serviceDetial;
 final String serviceProviderId;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;


    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        height: 160,
        child: InkWell(
          onTap: () {
            // Get.to(ServiceOrderPage());
           SingleOrderPage(itemIndex, serviceDetial, serviceProviderId).orderSnackBar(context);
          },
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 146,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color:
                        itemIndex.isEven ? Colors.blue[900] : AppStyle().gradientColor2,
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(5, 10),
                    //     color: Colors.black!.withOpacity(0.5),
                    //   )
                    // ],
                  ),
                  child: Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      )),
                ),
                Positioned(
                  top: -20,
                  right: 0,
                  child: Hero(
                    tag: "${serviceDetial.name}",

                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 190,
                      // image is square but we add extra 20 + 20 padding thats why width is 200
                      width: 200,
                      child: CachedNetworkImage(
                        placeholder: (context, url) => CircularProgressIndicator(),

                        imageUrl: serviceDetial.img.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: SizedBox(
                        height: 136,
                        // our image take 200 width, thats why we set out total width - 200
                        width: size.width - 200,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  serviceDetial.name.toString(),
                                  style: AppStyle().paraTextStyle,
                                ),
                              ), Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  // serviceDetial.sCategory,
                                  serviceDetial.description ?? ""
                                  , style: AppStyle().paraTextStyle,
                                ),
                              ),
                              // it use the available space
                              Spacer(),
                              GestureDetector(
                                onTap:(){},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15 * 1.5, // 30 padding
                                    vertical: 10, // 5 top and bottom
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppStyle().gradientColor1,
                                        AppStyle().gradientColor2
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topCenter
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(22),
                                      topRight: Radius.circular(22),
                                    ),
                                  ),
                                  child: Text(
                                    "\u{20B9}${serviceDetial.price}/Item",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ])))
              ],
            ),
          ),
        ));
  }
}
