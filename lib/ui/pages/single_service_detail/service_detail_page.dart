import 'package:caremint/controllers/single_service_controller.dart';
import 'package:caremint/ui/widget/login_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../widget/serach_box.dart';
import 'Widgets/service_detail_card.dart';

class SingleServiceDetail extends StatelessWidget {
   SingleServiceDetail( );
  // final Providers personDetails;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleServiceController>(
      builder: (ssCtrl) {
        return Scaffold(
          backgroundColor: Colors.blue[900],
          appBar: AppBar(
            // iconTheme: IconThemeData(color: AppStyle().buttonColor),
            backgroundColor: Colors.blue[900],
            elevation: 0,
            actions: [
              /*GetBuilder<CartController>(
                builder: (crCtrl) {
                  return IconButton(onPressed: () async {
                   await crCtrl.isLoggedIn() ? crCtrl.gotoCartPage() :
                   LoginSnackBar().loginSnackBar(context);
                  }, icon: Icon(Icons.shopping_bag_outlined));
                }
              )*/
            ],
            title:Text(ssCtrl.personDetails.name,
            style: GoogleFonts.poppins(
            ),),

          ),
          body: SafeArea(
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SearchBox(onChanged :(value){

                  if(value.isEmpty){
                    ssCtrl.searchList = ssCtrl.serviceDetialsList;
                  ssCtrl.update();
                  }

                  else{
                    ssCtrl.searchList = [];
                    ssCtrl.searchList = ssCtrl.serviceDetialsList.where((user) => user.sName.toLowerCase().contains(value.toLowerCase())).toList();
                    print(ssCtrl.searchList);
                    ssCtrl.update();
                  }
                }, ctrl: ssCtrl,),
                // CategoryList(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,top: 5),
                  child: Text("${ssCtrl.personDetails.city}, ${ssCtrl.personDetails.state}", style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 30
                  ),
               ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,bottom: 16),
                  child: Text("Your passion is our satisfaction", style: GoogleFonts.poppins(
                      color: Colors.white,
                      // fontWeight: FontWeight.w600,
                      fontSize: 16
                  ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 70),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),

                      GetBuilder<SingleServiceController>(
                        builder: (ctrl) {
                          return ListView.builder(
                            // here we use our demo procuts list
                            itemCount: ctrl.searchList.length,
                            itemBuilder: (context, index) => ServiceDetailCard(
                              itemIndex: index,
                              serviceDetial : ctrl.searchList[index],
                              serviceProviderId: ctrl.personDetails.id,
                              // press: () {
                              //   // Navigator.push(
                              //   //   context,
                              //   //   MaterialPageRoute(
                              //   //     builder: (context) => DetailsScreen(
                              //   //       product: serviceDetialsList[index],
                              //   //     ),
                              //   //   ),
                              //   // );
                              // },
                            ),
                          );
                        }
                      )

                    ],
                  ),
                )
              ]
            ),
          ),
        );
      }
    );
  }
}
