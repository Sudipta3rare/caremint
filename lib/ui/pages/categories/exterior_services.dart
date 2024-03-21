import 'package:cached_network_image/cached_network_image.dart';
import 'package:caremint/controllers/categories_controller/exterior_service_controller.dart';
import 'package:caremint/controllers/controllers.dart';
import 'package:caremint/ui/components/appBar.dart';
import 'package:caremint/ui/components/loading_overlay_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../../../models/service_person.dart';

class ExteriorServices extends StatelessWidget {
   ExteriorServices({Key? key}) : super(key: key);

  ExteriorServiceController ctrl = ExteriorServiceController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBarComponent().appBar(ctrl.catName),

      body: SafeArea(
        child: GetBuilder<ExteriorServiceController>(builder: (ctrl) {
          // return listBuilding(context, ctrl, ctrl.itemList);
          return LoadingOverlay(
            isLoading: ctrl.isLoading.value,
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("${ctrl.itemList.length} Results Found",style: AppStyle().paraTextStyle,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Obx(
                            () => FlutterToggleTab(
                          width: MediaQuery.of(context).size.width * 0.06 ,
                          height: MediaQuery.of(context).size.height*0.05,
                          selectedIndex: ctrl.tabTextIndexSelected.value,
                          icons: ctrl.listIconTabToggle,
                          selectedBackgroundColors: [
                            AppStyle().gradientColor1,
                            AppStyle().gradientColor2
                          ],
                          selectedTextStyle: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          unSelectedTextStyle:
                          GoogleFonts.poppins(color: Colors.blue[900]),
                          labels: ctrl.listIconLabel,
                          selectedLabelIndex: (index) => ctrl.toggle(index),
                          isScroll: false,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 10,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                  child: Divider(
                    // height: 10,
                    thickness: 2,
                    color: Colors.blue[900],
                  ),
                ),

               Obx(() => Expanded(
                 child: ctrl.tabTextIndexSelected.value == 0 ?
                    gridBuilding(context, ctrl, ctrl.itemList)
                  : listBuilding(context, ctrl, ctrl.itemList),
               )),
              ],
            ),
          );

        }),
      ),
    );
  }

  //List View Building
  Widget listBuilding(BuildContext context, ctrl, List<Provider> itemList) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (BuildContext context,int index){
        return listTile( ctrl.itemList[index], );
        // return ctrl.itemList.map((item) => listTile(item, context)).toList();
        },

    );
  }


// List view single widget
  Widget listTile(Provider item ) {
    return Container(

      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.blue[200]!, offset: Offset(5, 4))
          ],
          borderRadius: BorderRadius.only(
            // topRight: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),
            // bottomLeft: Radius.circular(40.0)),
          ),
          color: Colors.white,
          // gradient: LinearGradient(colors: [
          //   Colors.blueAccent[100]!,
          //   Colors.blue[200]!,
          // ], begin: Alignment.bottomLeft, end: Alignment.topRight)
      ),
      width: double.infinity,
      height: 140,
      clipBehavior: Clip.antiAlias,
      child: GetBuilder<SingleServiceController>(
        builder: (ctrl) {
          return GestureDetector(
            onTap: (){
             ctrl.gotoServieDetail(item);
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppStyle.blue900.withOpacity(0.3),
                    backgroundImage: item.userUrl != null
                        ? CachedNetworkImageProvider(item.userUrl)
                        : CachedNetworkImageProvider(
                        'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice1.png?alt=media&token=f8d0ddb3-5780-4888-b4a3-fa0e1f2ecc3d'),
                    radius: 50,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.displayName ?? "",
                        // item.name,
                        style: AppStyle().subHeadBlueTextStyle,
                      ),
                      Text(
                        item.userPhonenumber ?? "",
                        style: AppStyle().paraTextStyle,
                      ),
                      Text(
                        item.userAddress ?? "",
                        style: AppStyle().paraTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }


  // Grid view building
  Widget gridBuilding(context, ctrl,  itemList) {
    return Container(
      width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(15),
        child: GridView.builder(
          gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width/2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15),
          itemCount: ctrl.itemList.length,
          itemBuilder: (BuildContext ctx,int index) {
            return getGridItem( ctrl.itemList[index]);
          },
          // children:
          // ctrl.itemList.map((ServicePerson servicePerson) {
          //   return getGridItem(servicePerson, ctrl, context);
          // }).toList(),
        ));
  }


  //Grid view item widget
  Widget getGridItem(Provider item) {
    return GetBuilder<SingleServiceController>(
      builder: (ctrl) {
        return GestureDetector(
          onTap: (){
            ctrl.gotoServieDetail(item);

          },
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.blue[200]!, offset: Offset(3, 3))
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  // bottomLeft: Radius.circular(40.0)),
                ),
                color: Colors.white,
                // gradient: LinearGradient(colors: [
                //   Colors.blueAccent[100]!,
                //   Colors.blue[200]!,
                // ],
                //     begin: Alignment.bottomLeft, end: Alignment.topRight)
            ),
            // color: Colors.blue[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        
                        decoration: BoxDecoration(
                          color: AppStyle.blue900.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: ClipRRect(

                            borderRadius: BorderRadius.circular(20),
                            child: CircleAvatar(
                              backgroundColor: AppStyle.blue900.withOpacity(0.3),
                              backgroundImage: item.userUrl != null
                                  ? CachedNetworkImageProvider(item.userUrl)
                                  : CachedNetworkImageProvider(
                                  'https://firebasestorage.googleapis.com/v0/b/caremint-d3d4a.appspot.com/o/imageAsset%2Fservice1.png?alt=media&token=f8d0ddb3-5780-4888-b4a3-fa0e1f2ecc3d'),
                              radius: 50,
                            ),
                        ),
                      ),
                    )),
                Text(
                  item.displayName ?? "",
                  style:AppStyle().paraTextStyle,
                ),
                Text(
                  item.userPhonenumber ?? "",
                  style:AppStyle().paraTextStyle,
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
