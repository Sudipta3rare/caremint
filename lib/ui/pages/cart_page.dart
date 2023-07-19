import 'package:caremint/controllers/my_orders_controller/my_order_controller.dart';
import 'package:caremint/ui/components/appBar.dart';
import 'package:caremint/ui/components/custom_button.dart';
import 'package:caremint/ui/components/loading_overlay_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBarComponent().appBar("Cart"),
      body: GetBuilder<CartController>(builder: (ctrl) {
        return LoadingOverlay(
          isLoading: ctrl.isLoading.value,
          child: Column(
            children: [
              Expanded(
                  child: !ctrl.isEmptyCart
                      ? cartList(context, ctrl)
                      : emptyCart()),
              bottomBarTitle(),
              bottomBarButton(context),
            ],
          ),
        );
      }),
    );
  }

  Widget emptyCart() {
    return Center(
      child: Text(
        "No Items Added",
        style: AppStyle().subHeadBlueTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget cartList(context, CartController ctrl) {
    return ListView.separated(
      itemCount: ctrl.cartList.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppStyle.blue900,
            child:
                Text('${index + 1}', style: AppStyle().subHeadWhiteTextStyle),
          ),
          // tileColor: AppStyle().textHeading,
          contentPadding: EdgeInsets.all(5),
          title: Text(
            ctrl.cartList[index]["s_name"],
            style: AppStyle().subHeadBlueTextStyle,
          ),
          subtitle: Text(
            "\u{20B9} ${ctrl.cartList[index]["price"]}",
            style: AppStyle().paraTextStyle,
          ),
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              // Icon(Icons.info_outline_rounded, color: AppStyle.blue900,),
              IconButton(
                  onPressed: () {
                    ctrl.decreaseItemQuantity(index);
                  },
                  icon: Icon(Icons.cancel)), // icon-1
              // icon-2
            ],
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: Divider(
            indent: 20,
            endIndent: 20,
            thickness: 2,
            color: AppStyle.blue900,
          ),
        );
      },
    );
  }

  Widget bottomBarTitle() {
    return GetBuilder<CartController>(builder: (controller) {
      return Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 22)),
            Obx(
              () {
                return Text("\u{20B9} ${controller.totalPrice.value}",
                    key: ValueKey<double>(controller.totalPrice.value),
                    style: AppStyle().headingBlueTextStyle);
              },
            )
          ],
        ),
      );
    });
  }

  Widget bottomBarButton(context) {
    return GetBuilder<CartController>(builder: (controller) {
      return GetBuilder<MyOrderController>(builder: (ordCtrl) {
        return SizedBox(
          width: double.infinity,
          height: Get.height / 11,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: GestureDetector(
                onTap: controller.isEmptyCart
                    ? () {
                        Get.snackbar(
                          "Cart Is Empty",
                          "Add Items To Cart",
                          snackPosition: SnackPosition.TOP,
                          colorText: Color(0xffffffff),
                          backgroundColor: AppStyle().gradientColor2,
                          duration: Duration(seconds: 2),
                        );
                      }
                    : () {
                        Get.defaultDialog(
                            title: "Checkout With COD",
                            textCancel: "Cancel",
                            titlePadding: EdgeInsets.symmetric(vertical: 8),
                            titleStyle: AppStyle().subHeadBlueTextStyle,
                            cancelTextColor: AppStyle.buttonColor,
                            cancel: TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.poppins(color: Colors.grey),
                              ),
                            ),
                            middleTextStyle: GoogleFonts.poppins(),
                            middleText:
                                "Place order with cash on delivery and we will contact you for confirmation.",
                            onConfirm: (){


                            },
                            confirm: ElevatedButton(
                              onPressed: () {

                                for (var element = 0;
                                element < controller.cartList.length;
                                element++) {

                                  ordCtrl.addToOrderList(
                                      controller.cartList[element]);
                                }
                                controller.removeAll();
                                ordCtrl.gotoMyOrdersFromCart();
                                controller.update();

                              },
                              child: Text("Confirm Order"),
                              style: AppStyle.primaryButtonStyle,
                            ));
                      },
                child: CustomButton().customButton200(context, "Buy Now")),
          ),
        );
      });
    });
  }
}
