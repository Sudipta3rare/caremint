import 'package:caremint/franchise/controllers/listing_services_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../ui/components/custom_button.dart';
class ListingServices extends StatelessWidget {
  const ListingServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppStyle.backgroundColor,
      child: GetBuilder<ListingServicesController>(
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
                      decoration: const BoxDecoration(
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
                    Container(
                      margin: EdgeInsets.fromLTRB(0,0,10,0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(80.0),
                        ),
                      ),

                      height: 30,
                      width: 30,
                      child: GestureDetector(
                          onTap: (){
                            Get.dialog(
                                AlertDialog(
                                  backgroundColor:Colors.blue[50],
                                  shadowColor: Colors.blue[900]?.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                  // contentPadding: EdgeInsets.only(top: 10.0),
                                  actions: [
                                    IconButton(onPressed: (){
                                      Get.back();
                                    }, icon: Icon(Icons.cancel),
                                        color:AppStyle.buttonColor)
                                  ],
                                  content:  Container(
                                    color: Colors.blue[50],
                                    margin: EdgeInsets.only(right: 8, left: 8,top: 10),
                                    // padding: EdgeInsets.all(8),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text("Add Service",
                                            style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1
                                            ),),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              validator: (val) {
                                                if (val?.length == 0) {
                                                  return "Name cannot be empty";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              keyboardType: TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                icon: Icon(Icons.cleaning_services_rounded),
                                                iconColor: AppStyle.buttonColor,
                                                labelText: "Service Name",
                                                labelStyle: GoogleFonts.poppins(
                                                    color: Colors.blue[900],
                                                    fontWeight: FontWeight.w400

                                                ),
                                                border: UnderlineInputBorder(
                                                  borderSide: BorderSide(width: 7),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(

                                                icon: Icon(Icons.price_change_outlined),
                                                iconColor: AppStyle.buttonColor,
                                                labelText: "Price",
                                                labelStyle: GoogleFonts.poppins(
                                                    color: Colors.blue[900],
                                                    fontWeight: FontWeight.w400
                                                ),
                                                border: UnderlineInputBorder(
                                                  borderSide: BorderSide(width: 7),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              // maxLines: 8,
                                              decoration: InputDecoration(
                                                icon: Icon(Icons.description),
                                                iconColor: AppStyle.buttonColor,
                                                labelText: "Service Description",
                                                labelStyle: GoogleFonts.poppins(
                                                    color: Colors.blue[900],
                                                    fontWeight: FontWeight.w400
                                                ),
                                                border: UnderlineInputBorder(
                                                  borderSide: BorderSide(width: 7),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomButton().customButton200(context, "Submit"),
                                          ),
                                          SizedBox(height: 8,),




                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            );
                          },
                          child: Icon(Icons.add, color: AppStyle.buttonColor,))

                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    itemCount: ordCtrl.listService.length,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Card(

        shape: RoundedRectangleBorder(
          side: BorderSide(
            color:Colors.blue[900]!,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: 180,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  listComponetCol(ordCtrl.listService[index].serviceProvided,ordCtrl.listService[index].servicePrice,"Service", "Price",context),
                Text(ordCtrl.listService[index].serviceDescription, overflow: TextOverflow.clip,maxLines: 4,style: GoogleFonts.poppins(
                  color: Colors.blue[900],
                ),textAlign: TextAlign.center,),
             ] ),
            ),
          ),
        ),
      ),
    );
  }
  Widget listComponetCol(String name1, String name2,String title1,String title2, context){
    return Container(
      width: MediaQuery.of(context).size.width ,
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(title1, style:  GoogleFonts.poppins(
                  color: Colors.blue[900],
                  fontSize: 16,
                  // fontWeight: FontWeight.w400,
                ),maxLines: 2,
                    overflow: TextOverflow.clip),
                Text(
                  name1, style: GoogleFonts.poppins(
                  color: Colors.blue[900],
                  fontSize: 18,

                  fontWeight: FontWeight.w600,
                ),maxLines: 2,
                  overflow: TextOverflow.clip,),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(title2, style: GoogleFonts.poppins(
                  color: Colors.blue[900],
                  fontSize: 16,
                  // fontWeight: FontWeight.w400,
                ),maxLines: 2,
                    overflow: TextOverflow.clip),
                Text(name2, style: GoogleFonts.poppins(
                  color: Colors.blue[900],
                  fontSize: 18,

                  fontWeight: FontWeight.w600,
                ),maxLines: 2,
                    overflow: TextOverflow.clip),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
