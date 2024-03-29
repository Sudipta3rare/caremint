import 'package:caremint/constants/app_colors.dart';
import 'package:caremint/franchise/controllers/customerInfo_controller.dart';
import 'package:caremint/ui/components/loading_overlay_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: AppStyle.backgroundColor,
        child: GetBuilder<CustomerInfoController>(
          builder: (ordCtrl) {
            return RefreshIndicator(
              onRefresh:  ()=> ordCtrl.onRefresh(),
              child: LoadingOverlay(
                isLoading: ordCtrl.isLoading.value,
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //
                    //     Expanded(
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: TextFormField(
                    //
                    //           // enabled: true,
                    //           decoration: InputDecoration(
                    //             contentPadding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                    //             hintText: "Search Order",
                    //             hintStyle:GoogleFonts.poppins(
                    //                 color: Colors.blue[900],
                    //                 fontWeight: FontWeight.w500) ,
                    //
                    //             icon: Icon(Icons.search),
                    //             iconColor: AppStyle.buttonColor,
                    //             border: const UnderlineInputBorder(
                    //
                    //             ),
                    //             // labelText: '$title',
                    //
                    //           ),
                    //           controller: null,
                    //         ),
                    //       ),
                    //     ),
                    //     Container(
                    //       margin: EdgeInsets.all(10),
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(12.0),
                    //         ),
                    //       ),
                    //
                    //       height: 40,
                    //       width: 100,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         children: [
                    //           Text("Sort", style: AppStyle().paraTextStyle,),
                    //           Icon(Icons.sort, color: AppStyle.buttonColor,)
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Orders in pending status : Please Accept or Cancel ", style:  GoogleFonts.poppins(),),
                    ),
                    Expanded(
                      child: ordCtrl.newOrderList.isEmpty ? emptyOrders() :  ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 10),
                          itemCount: ordCtrl.newOrderList.length,
                          itemBuilder: (context, index)
                          =>listLayout(context, ordCtrl, index),
                     ),
                    ),
                  ],

                ),
              ),
            );
          }
        ),

    );
  }

  Widget listLayout(context, CustomerInfoController ordCtrl, index) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.blue[900]!,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded( // Add an Expanded widget here
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      listComponetCol(
                        ordCtrl.newOrderList[index].name.toString(),
                        ordCtrl.newOrderList[index].description.toString(),
                        "Service Name",
                        "Description",
                        context,
                        ordCtrl.newOrderList[index].vehicleBrand.toString(),
                        "Vehicle Brand",
                      ),
                      listComponetCol(
                        DateFormat("yMMMMd").format(ordCtrl.newOrderList[index].deliveryDate ?? DateTime.now()).toString(),
                        ordCtrl.newOrderList[index].orderPrice.toString(),
                        "Delivery Date",
                        "Order Value",
                        context,
                        ordCtrl.newOrderList[index].vehicleModel.toString(),
                        "Vehicle Model",
                      ),
                      listComponetCol(
                        DateFormat("yMMMMd").format(ordCtrl.newOrderList[index].orderDate!).toString(),
                        ordCtrl.newOrderList[index].orderStatus.toString() == "null" ? "pending" : ordCtrl.newOrderList[index].orderStatus.toString(),
                        "Order Date",
                        "Order Status",
                        context,
                        ordCtrl.newOrderList[index].vehicleNo.toString(),
                        "Vehicle Number",
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: AppStyle.primaryButtonStyle,
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Cancel order request!',
                        titleStyle: TextStyle(
                          color: AppStyle().gradientColor2, // Replace with your desired color
                        ),
                        middleTextStyle: AppStyle().subHeadBlueTextStyle,
                        content: Text(
                          'Do you want to cancel order?',
                          style: AppStyle().paraTextStyle,
                        ),
                        textCancel: 'NO',
                        textConfirm: 'YES',
                        buttonColor: AppStyle.buttonColor,
                        cancelTextColor: AppStyle().gradientColor4,
                        confirmTextColor: AppStyle().gradientColor4,
                        onCancel: () {
                          Get.back();
                        },
                        onConfirm: () async {
                          ordCtrl.postCancelOrder(ordCtrl.newOrderList[index]);
                          ordCtrl.update();
                        },
                      );
                    },
                    child: Text("Cancel Order"),
                  ),
                  ElevatedButton(
                    style: AppStyle.primaryButtonStyle,
                    onPressed: () {
                      ordCtrl.isLoading.value = true;
                      ordCtrl.update();
                      ordCtrl.postAcceptOrder(ordCtrl.newOrderList[index]);
                    },
                    child: Text("Accept Order"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget listComponetCol(String name1, String name2,String title1,String title2, context, String name3, String title3){
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
            SizedBox(
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
      child: Text("No New Orders",
        style: AppStyle().subHeadBlueTextStyle,
        textAlign: TextAlign.center,),
    );
  }
}
