import 'package:caremint/ui/components/loading_overlay_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../constants/app_colors.dart';
import '../controllers/customerInfo_controller.dart';
class CompletedOrderPage extends StatelessWidget {
  const CompletedOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyle.backgroundColor,
      child: GetBuilder<CustomerInfoController>(
          builder: (ordCtrl) {
            return RefreshIndicator(
              onRefresh:  ()=>ordCtrl.onRefresh(),
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
                    Expanded(
                      child: ordCtrl.completedOrderList.isEmpty ? emptyOrders() : ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        itemCount: ordCtrl.completedOrderList.length,
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

  Widget listLayout(context,CustomerInfoController ordCtrl, int index){
    return Card(

      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: Colors.green,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 150,

        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  listComponetCol(ordCtrl.completedOrderList[index].name.toString(),ordCtrl.completedOrderList[index].mobileNumber.toString(),"Customer Name", "Phone Number",context),
                  listComponetCol(ordCtrl.completedOrderList[index].orderPrice.toString(),ordCtrl.completedOrderList[index].address.toString(),"Order Value ", "Address",context),
                  listComponetCol(ordCtrl.completedOrderList[index].description.toString(),DateFormat("yMMMMd").format(ordCtrl.completedOrderList[index].deliveryDate!),"Order Date", "Delivery Date",context),
                ],
              ),
            ),
          ),
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
      child: Text("No Completed Orders",
        style: AppStyle().subHeadBlueTextStyle,
        textAlign: TextAlign.center,),
    );
  }
}
