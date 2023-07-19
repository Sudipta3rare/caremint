import 'package:caremint/constants/app_colors.dart';
import 'package:caremint/controllers/my_orders_controller/my_order_controller.dart';
import 'package:caremint/ui/components/appBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBarComponent().appBar("My Orders"),

      body: _showBody(context),
    );
  }
  Widget _showBody(context){
    return GetBuilder<MyOrderController>(
      builder: (ctrl) {
        return ctrl.myOrderList.isNotEmpty ?ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount: ctrl.myOrderList.length,
          itemBuilder: (context, index)
          =>listLayout(context, ctrl, index),
        ) :
        emptyOrders();
      }
    );
  }

  Widget listLayout(BuildContext context,MyOrderController ordCtrl,int index){
    return Card(
        margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color:Colors.blue[900]!,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  listComponetCol(ordCtrl.myOrderList[index].sName,ordCtrl.myOrderList[index].sCategory,"Service Name", "Service Category",context),
                  listComponetCol(ordCtrl.myOrderList[index].providerId,ordCtrl.myOrderList[index].price.toString(),"Provider Name", "Order Value",context),
                  listComponetCol(ordCtrl.myOrderList[index].date,ordCtrl.myOrderList[index].status == "1" ? "Completed" : "Ongoing","Order Date", "Order Status",context),
                ],
              ),
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //
            //     RatingBar.builder(
            //     initialRating: 0,
            //     minRating: 1,
            //     direction: Axis.horizontal,
            //     allowHalfRating: true,
            //     itemCount: 5,
            //     itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
            //     itemBuilder: (context, _) => Icon(
            //       Icons.star,
            //       color: AppStyle.buttonColor,
            //     ),
            //     onRatingUpdate: (rating) {
            //       print(rating);
            //     },
            //   ),
            //       SizedBox(width: 5,),
            //       ElevatedButton(onPressed: (){}, child: Text("Re-Order"))
            //     ],),
            // )
          ],
        ),
      ),
    );
  }
  Widget listComponetCol(String name1, String name2,String title1,String title2, context){
    return Container(
      width: MediaQuery.of(context).size.width /2.8,
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(title1, style:  GoogleFonts.poppins(
              color: Colors.blue[900],
              fontSize: 12,
              // fontWeight: FontWeight.w400,
            ),maxLines: 2,
                overflow: TextOverflow.clip),
            Text(
              name1, style: GoogleFonts.poppins(
              color: Colors.blue[900],
              fontSize: 12,

              fontWeight: FontWeight.w600,
            ),maxLines: 2,
              overflow: TextOverflow.clip,),
            SizedBox(
              height: 16,
            ),
            Text(title2, style: GoogleFonts.poppins(
              color: Colors.blue[900],
              fontSize: 12,
              // fontWeight: FontWeight.w400,
            ),maxLines: 2,
                overflow: TextOverflow.clip),
            Text(name2, style: GoogleFonts.poppins(
              color: Colors.blue[900],
              fontSize: 12,

              fontWeight: FontWeight.w600,
            ),maxLines: 2,
                overflow: TextOverflow.clip),
          ],
        ),
      ),
    );
  }

  Widget emptyOrders(){
    return Center(
      child: Text("No Orders Placed",
        style: AppStyle().subHeadBlueTextStyle,
        textAlign: TextAlign.center,),
    );
  }
}
