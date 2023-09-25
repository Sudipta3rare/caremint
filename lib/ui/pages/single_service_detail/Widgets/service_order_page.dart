

import 'package:caremint/controllers/cart_controller.dart';
import 'package:caremint/controllers/my_orders_controller/my_order_controller.dart';
import 'package:caremint/controllers/service_order_controller.dart';
import 'package:caremint/models/service_detial.dart';
import 'package:caremint/models/service_person.dart';
import 'package:caremint/ui/components/custom_button.dart';
import 'package:caremint/ui/widget/login_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_colors.dart';

class SingleOrderPage{
  SingleOrderPage(this.index, this.product, this.providerId);
  late int index;
  late Service product;
  late String providerId;

  bool isDateSelected = false;

  String? numberValidator(String? value) {
    if(value == null) {
      return null;
    }
    final n = num.tryParse(value);
    if(n == null && value.length != 10) {
      return '"$value" is not a valid number';
    }
    return null;
  }

  String? stringValidator(String? value) {
    if(value!.isEmpty) {
        return '*Field cannot be empty';
    }
    else {
      return null;
    }
  }
  Widget formFeild(String title, TextEditingController ctrl) {
    return SizedBox(
      // height: 60,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: ctrl,
          validator: stringValidator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            labelText: "$title",
            labelStyle: GoogleFonts.poppins(
                color: Colors.blue[900],
                fontSize: 11,
                fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
              gapPadding: 2,
              borderSide: BorderSide(width: 5),
            ),
          ),
        ),
      ),
    );
  }

  Widget formFeildNumber(String title, TextEditingController ctrl) {
    return SizedBox(
      // height: 60,
      width: 300,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: ctrl,
          //
          // onChanged: (value){
          //   ctrl.items.value = int.parse(value);
          //   ctrl.update();
          // },
          //
          // onTap: (){
          //     ctrl.itemNo.text =ctrl.items.value.toString();
          //      ctrl.update();
          // },
          // controller: ctrl.itemNo,
          // keyboardType: TextInputType.number,
          validator: numberValidator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            labelText: "$title",
            labelStyle: GoogleFonts.poppins(
                color: Colors.blue[900],
                fontSize: 11,
                fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
              gapPadding: 2,
              borderSide: BorderSide(width: 5),
            ),
          ),
        ),
      ),
    );
  }

  Future orderSnackBar(BuildContext context){
    return  Get.dialog(
        GetBuilder<ServiceOrderController>(
          builder: (ctrl) {
            return AlertDialog(
                backgroundColor: Colors.blue[50],
                shadowColor: Colors.blue[900]?.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                contentPadding: EdgeInsets.only(top: 10.0),
                actions: [
                  IconButton(onPressed: (){
                    // ctrl.items.value= 0;
                    isDateSelected = false;
                    // ctrl.update();
                    Get.back();
                    },
                      icon: Icon(Icons.cancel, color: AppStyle.buttonColor,))
                ],
                content:Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Form(
                          key: ctrl.formKey,
                          child: Column(
                            children: [
                              // Row(children:[
                              //   IconButton(onPressed: (){
                              //     // ctrl.items.value = int.parse(ctrl.itemNo.text);
                              //
                              //     // ctrl.itemNo.text = ctrl.items.value.toString();
                              //     ctrl.items.value++;
                              //     print(ctrl.items.value);
                              //
                              //     ctrl.update();
                              //   }, icon:Icon(Icons.add)),
                              //  Obx(()=>Text(
                              //    "${ctrl.items.value} \t", style: AppStyle().subHeadBlueTextStyle,
                              //  )),
                              //   Text(" Items ", style: AppStyle().subHeadBlueTextStyle,),
                              //   // formFeild("Number of Items", ctrl.items.value.toString(), ctrl),
                              //   IconButton(onPressed: (){
                              //
                              //     // ctrl.itemNo.text = ctrl.items.value.toString();
                              //     ctrl.items.value--;
                              //     print(ctrl.items.value);
                              //     ctrl.update();
                              //   }, icon: Icon(Icons.remove))
                              // ]),
                              CalendarDatePicker(initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2024),
                                onDateChanged: (DateTime value)
                                {
                                  isDateSelected = true;
                                  ctrl.selectedDate.value = value;
                                  ctrl.update();  },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Visibility(
                                visible: isDateSelected,
                                  child: DropdownMenu<String>(
                                  onSelected: (value){
                                    ctrl.timingSelected= value!;
                                    ctrl.update();
                                  },
                                  // height: 60,

                                  width: MediaQuery.of(context).size.width*0.7,
                                    menuHeight: MediaQuery.of(context).size.height*0.7,
                                  label: Text("Select Service Timing",style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.blue[900],
                                  ),),
                                  dropdownMenuEntries: ctrl.timings
                                      .map<DropdownMenuEntry<String>>((String value) {
                                    ctrl.update();
                                    return DropdownMenuEntry<String>(
                                      value: value,
                                      label: (value),
                                    );
                                  }
                                  ).toList(),
                                ),),
                              ),

                              Text("Customer Details", style: AppStyle().subHeadBlueTextStyle,),
                              formFeild("Name", ctrl.name),
                              formFeildNumber("Phone",ctrl.phone),
                              formFeild("Address",ctrl.address),
                              // formFeild("Pin Code",ctrl.pincode),
                              formFeild("City",ctrl.city),
                              formFeild("State",ctrl.state),
                              formFeild("Pincode", ctrl.pincode),
                              formFeild("Vehicle Company Name",ctrl.vName),
                              formFeild("Vehicle Model",ctrl.vModel),
                              formFeild("Vehicle Number",ctrl.vNumber),
                              formFeild("Describe Your Task",ctrl.des),
                              GetBuilder<MyOrderController>(
                                builder: (Crctrl) {
                                  return GestureDetector(
                                      onTap: () async {




                                      if (ctrl.formKey.currentState!.validate()) {

                                        print("all key validated");
                                          if(DateFormat.yMd().format(ctrl.selectedDate.value).toString() != '') {
                                            Get.defaultDialog(
                                              title: 'Confirm Order',
                                              titleStyle: TextStyle(
                                                color: AppStyle()
                                                    .gradientColor2, // Replace with your desired color
                                              ),
                                              middleTextStyle: AppStyle()
                                                  .subHeadBlueTextStyle,
                                              content: Text(
                                                'Confirm order with COD',
                                                style: AppStyle().paraTextStyle,
                                              ),
                                              textCancel: 'Cancel',
                                              textConfirm: 'Place Order',
                                              buttonColor: AppStyle()
                                                  .gradientColor3,
                                              cancelTextColor: AppStyle()
                                                  .gradientColor1,
                                              confirmTextColor: AppStyle()
                                                  .gradientColor1,
                                              onCancel: () {
                                                Get.back();
                                              },
                                              onConfirm: () async {
                                                ctrl.onCheckout(
                                                  product.name.toString(),
                                                  product.id.toString(),
                                                  product.price!, providerId,ctrl.timingSelected);



                                                // await auth.signOut().then((value) => Get.offAllNamed('/home'));


                                              },);
                                          }

                                            // Crctrl.getCartItems();


                                          else {
                                            Get.snackbar(
                                              "Date Time Not Selected",
                                              "Please Select Date Time for service",
                                              snackPosition: SnackPosition
                                                  .BOTTOM,
                                              colorText: Color(0xffffffff),
                                              backgroundColor: AppStyle()
                                                  .gradientColor2,
                                              duration: Duration(seconds: 2),);
                                          }
                                      } else
                                        Get.snackbar("Submition form empty", "Please fill all fields of the form",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Color(0xffffffff),
                                          backgroundColor: AppStyle().gradientColor2,
                                          duration: Duration(seconds: 2),);


                          },
                                      child: CustomButton().customButton200(context, "Checkout"));
                                }
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
            );
          }
        ));
  }
}