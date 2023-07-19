import 'package:caremint/franchise/views/completed_orders_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ongoing_orders.dart';
import 'listing_services.dart';
import 'orders.dart';
class TabView extends StatelessWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
          },
            icon: Icon(Icons.logout_outlined),
            iconSize: 25,
          )
        ],
        elevation: 0,
        backgroundColor: Colors.blue[900],
        title: Text("Franchise" ,
          style: GoogleFonts.poppins(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.w700),),
        bottom:  TabBar(
          labelStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 10,
          ),
          isScrollable: true,
          indicator: UnderlineTabIndicator(

              borderSide: BorderSide(width: 1.0,
              color: Colors.white),

              insets: EdgeInsets.symmetric(vertical: 5)
          ),
          tabs: [
            Tab(text: "Orders"),
            Tab(text: "Ongoind Orders",),
            Tab(text: "Listing Service",),
            Tab(text: "Completed Orders")
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          Orders(),
          CustomerInfo(),
          ListingServices(),
          CompletedOrderPage(),
        ],
      ),
    ));
  }
}
