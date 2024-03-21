import 'package:caremint/constants/app_colors.dart';
import 'package:caremint/controllers/my_orders_controller/my_order_controller.dart';
import 'package:caremint/ui/components/appBar.dart';
import 'package:caremint/ui/components/loading_overlay_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
        // print(ctrl.myOrderList.length);
        return ctrl.myOrderList.isNotEmpty ? LoadingOverlay(
          isLoading: ctrl.isLoading.value,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: ctrl.myOrderList.length,
            itemBuilder: (context, index)
            =>listLayout(context, ctrl, index),
          ),
        ) :
        emptyOrders();
      }
    );
  }

  Widget listLayout(BuildContext context,MyOrderController ordCtrl,int index){
    // print(index);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  listComponetCol(ordCtrl.myOrderList[index].name.toString(),ordCtrl.myOrderList[index].description.toString(),"Service Name", "Description",context,ordCtrl.myOrderList[index].vehicleBrand.toString(),"Vehicle Brand"),
                  listComponetCol(DateFormat("yMMMMd").format(ordCtrl.myOrderList[index].deliveryDate ?? DateTime.now()).toString() ,ordCtrl.myOrderList[index].orderPrice.toString(),"Delivery Date", "Order Value",context,ordCtrl.myOrderList[index].vehicleModel.toString(),"Vehicle Model"),
                  listComponetCol(DateFormat("yMMMMd").format(ordCtrl.myOrderList[index].orderDate!).toString(),ordCtrl.myOrderList[index].orderStatus.toString() == "null" ? "pending" :  ordCtrl.myOrderList[index].orderStatus.toString(),"Order Date", "Order Status",context,ordCtrl.myOrderList[index].vehicleNo.toString(),"Vehicle Number"),

                ],
              ),
            ),
            ordCtrl.myOrderList[index].review == "" ?
            ordCtrl.myOrderList[index].orderStatus.toString() =='completed' ?
            Center(
              child: ElevatedButton.icon(
                onPressed: (){
                  showModalBottomSheet(
                      useSafeArea: true,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (context){
                        return FractionallySizedBox(
                          heightFactor: 0.9,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppStyle.backgroundColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                )
                            ),
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("Add a review", style: AppStyle().subHeadBlueTextStyle,),
                                SizedBox(height: 20),
                                RatingBar.builder(
                                  initialRating: 0,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: AppStyle.buttonColor,
                                  ),
                                  onRatingUpdate: (rating) {
                                    ordCtrl.rating = rating;
                                  },
                                ),
                                SizedBox(height: 20.0),
                                TextField(
                                  controller: ordCtrl.review,
                                  maxLines: null,
                                  maxLength: 500,
                                  style: AppStyle().paraTextStyle,
                                  decoration: InputDecoration(
                                    labelText: 'Write your review',
                                    contentPadding: EdgeInsets.all(10),
                                    labelStyle: AppStyle().paraTextStyle,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                ElevatedButton(
                                  onPressed: (){
                                    ordCtrl.postReview(index);
                                  },
                                  child: Text("Submit"),
                                  style: AppStyle.primaryButtonStyle,
                                ),
                                Row(
                                  children: [
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(Icons.cancel, color:  AppStyle.buttonColor,),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  );
                },
                icon: Icon(Icons.border_color,color: AppStyle().gradientColor2),
                label: Text("Add Review",style: TextStyle(color: AppStyle().gradientColor2)),
              ),
            )





                :
                Text("")
                : SizedBox(height: 0,)
          // Row(
          //   children: [
          //     TextButton(onPressed:() {}, child: Text("Cancel Order", style: GoogleFonts.poppins(
          //       color: Colors.red,
          //     ),)
          //     ),
          //     Spacer(),
          //     ElevatedButton(onPressed:() {}, child: Text("Contact Provider", style: GoogleFonts.poppins(
          //
          //     ),)
          //     ),
          //   ],
          // )
          ],
        ),
      ),
    );
  }
  Widget listComponetCol(String name1, String name2,String title1,String title2, context,String name3,String title3){


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
                overflow: TextOverflow.clip), SizedBox(
              height: 16,
            ),
            Text(title3, style: GoogleFonts.poppins(
              color: Colors.blue[900],
              fontSize: 12,
              // fontWeight: FontWeight.w400,
            ),maxLines: 2,
                overflow: TextOverflow.clip),
            Text(name3, style: GoogleFonts.poppins(
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
