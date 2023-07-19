import 'package:caremint/constants/app_colors.dart';
import 'package:caremint/franchise/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: AppStyle.backgroundColor,
        child: GetBuilder<OrderController>(
          builder: (ordCtrl) {
            return Column(
              children: [
                Row(
                  children: [

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(

                          // enabled: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                            hintText: "Search Order",
                            hintStyle:GoogleFonts.poppins(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.w500) ,

                            icon: Icon(Icons.search),
                            iconColor: AppStyle.buttonColor,
                            border: const UnderlineInputBorder(

                            ),
                            // labelText: '$title',

                          ),
                          controller: null,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),

                      height: 40,
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Sort", style: AppStyle().paraTextStyle,),
                          Icon(Icons.sort, color: AppStyle.buttonColor,)
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                      itemCount: ordCtrl.orderList.length,
                      itemBuilder: (context, index)
                      =>listLayout(context, ordCtrl, index),
                 ),
                ),
              ],

            );
          }
        ),

    );
  }

    Widget listLayout(context, ordCtrl, index){
    return Card(

      shape: RoundedRectangleBorder(
        side: BorderSide(
          color:Colors.blue[900]!,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
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
                    listComponetCol(ordCtrl.orderList[index].orderNumber,ordCtrl.orderList[index].orderType,"Order Number", "Order Type",context),
                    listComponetCol(ordCtrl.orderList[index].customerName,ordCtrl.orderList[index].orderValue,"Customer Name", "Order Value",context),
                    listComponetCol(ordCtrl.orderList[index].orderDateTime,ordCtrl.orderList[index].orderDueDate,"Order Date", "Order Due Date",context),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                TextButton(onPressed: (){}, child: Text("Cancel Order")),
                ElevatedButton(onPressed: (){}, child: Text("Accept Order"))
              ],)
            ],
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
}
