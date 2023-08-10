import 'package:caremint/ui/widget/login_snackbar.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_string.dart';
import '../../controllers/signUp_controller.dart';
import '../components/custom_button.dart';

class SignUpSnackBar {
  String email = '',
      pass = '',
      address = '',
      confirmPassword = '',
      phone = '',
      firstName = "",
      pinCode = " ";

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void clearTextField() {
    // Clear the text fields
    firstnameController.clear();
    emailController.clear();
    phoneController.clear();
    pinCodeController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    addressController.clear();
  }

  final ctrl = Get.put(SignUpController());

  Future signUpSnackBar(BuildContext context) {
    ctrl.tabTextIndexSelected.value = 0;

    return Get.dialog(SingleChildScrollView(
        child: AlertDialog(
            backgroundColor: Colors.blue[50],
            shadowColor: Colors.blue[900]?.withOpacity(0.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            actions: [
              IconButton(
                  onPressed: () {
                    ctrl.tabTextIndexSelected.value = 0;
                    Get.back();
                  },
                  icon: Icon(Icons.cancel),
                  color: AppStyle.buttonColor)
            ],
            content: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Sign Up As Customer",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: 20,
                ),
                signUpCustomerForm(context),
                // Obx(
                //   () => FlutterToggleTab(
                //     width: MediaQuery.of(context).size.width / 8,
                //     selectedIndex: ctrl.tabTextIndexSelected.value,
                //     selectedBackgroundColors: [
                //       AppStyle().gradientColor1,
                //       AppStyle().gradientColor2
                //     ],
                //     selectedTextStyle: GoogleFonts.poppins(
                //       color: Colors.white,
                //       fontWeight: FontWeight.w400,
                //     ),
                //     unSelectedTextStyle:
                //         GoogleFonts.poppins(color: Colors.blue[900]),
                //     labels: ctrl.toggleButtonString,
                //     selectedLabelIndex: (index) => ctrl.toggle(index),
                //     isScroll: false,
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                // Obx(
                //   () => signUpForm(ctrl.tabTextIndexSelected.value, context),
                // ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      if (firstnameController.text.isEmpty) {
                        Get.snackbar(
                          'Info',
                          'Please enter a valid firstname.',
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Color(0xffffffff),
                          backgroundColor: AppStyle().gradientColor2,
                          duration: Duration(seconds: 2),
                        );
                        return;
                      }


                      if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email)) {
                        Get.snackbar(
                          'Info',
                          'Please enter a valid email.',
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Color(0xffffffff),
                          backgroundColor: AppStyle().gradientColor2,
                          duration: Duration(seconds: 2),
                        );
                        return;
                      }

                      if (addressController.text.isEmpty) {
                        Get.snackbar(
                          'Info',
                          'Please enter a valid address.',
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Color(0xffffffff),
                          backgroundColor: AppStyle().gradientColor2,
                          duration: Duration(seconds: 2),
                        );
                        return;
                      }

                      if (pinCodeController.text.isEmpty && pinCodeController.text.length!=6) {
                        Get.snackbar(
                          'Info',
                          'Please enter a valid pin code.',
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Color(0xffffffff),
                          backgroundColor: AppStyle().gradientColor2,
                          duration: Duration(seconds: 2),
                        );
                        return;
                      }

                      if (phoneController.text.length != 10) {
                        Get.snackbar(
                          'Info',
                          'Please enter a valid number.',
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Color(0xffffffff),
                          backgroundColor: AppStyle().gradientColor2,
                          duration: Duration(seconds: 2),
                        );
                        return;
                      }

                      if (passwordController.text.length < 6) {
                        Get.snackbar(
                          'Info',
                          'Password should be 6 character long.',
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Color(0xffffffff),
                          backgroundColor: AppStyle().gradientColor2,
                          duration: Duration(seconds: 2),
                        );
                        return;
                      }

                      if (pass != confirmPassword) {
                        Get.snackbar(
                          'Info',
                          'Password do not match',
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Color(0xffffffff),
                          backgroundColor: AppStyle().gradientColor2,
                          duration: Duration(seconds: 2),
                        );
                        return;
                      }
                      ctrl.submitForm(
                        firstnameController.text,
                        phoneController.text,
                        addressController.text,
                        pinCodeController.text,
                        emailController.text,
                        passwordController.text,
                      );

                      try {
                        ctrl.submitForm(email, phone, address, pinCode , firstName, pass );
                        Get.snackbar(
                          'Message',
                          'Registration Successful,Please Log in to Access Your Profile',
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Color(0xffffffff),
                          backgroundColor: AppStyle().gradientColor2,
                          duration: Duration(seconds: 2),
                        );

                        clearTextField();
                        // return;
                        Get.offAndToNamed("home");
                      }  catch (e) {
                        Get.snackbar("Error In Sign Up", "$e",
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: Color(0xffffffff),
                            backgroundColor: AppStyle().gradientColor2,
                            duration: Duration(seconds: 2));

                      }
                    },
                    child: CustomButton().customButton200(context, 'Sign Up'),),
                ),
                SizedBox(height: 16),
                GestureDetector(
                    onTap: () {
                      Get.back();
                     LoginSnackBar().loginSnackBar(context);
                    },
                    child: Text(
                      "${AppString().alreadyRegistered}",
                      style: GoogleFonts.poppins(fontSize: 13),
                    )),
              ],
            )
        )
    )
    );
  }

  // Widget signUpForm(int index, context) {
  //   print(index);
  //   if (index == 0) {
  //     return Container(
  //       color: Colors.blue[50],
  //       width: MediaQuery.of(context).size.width,
  //       child: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             formFeild("Company Name"),
  //             SizedBox(height: 5),
  //             formFeild("First Name"),
  //             SizedBox(height: 5),
  //             formFeild("Last Name"),
  //             SizedBox(height: 5),
  //             formFeild("Username"),
  //             SizedBox(height: 5),
  //             formFeild("Email"),
  //             SizedBox(height: 5),
  //             formFeild("Password"),
  //             SizedBox(height: 5),
  //             formFeild("Confirm Password"),
  //             SizedBox(height: 5),
  //             formFeild("Mobile"),
  //             SizedBox(height: 5),
  //             DropdownMenu<String>(
  //               // menuHeight: 30,
  //               onSelected: (value) {
  //                 ctrl.dropdownValueCategory = value!;
  //                 ctrl.update();
  //               },
  //               // height: 60,
  //               width: 285,
  //               label: Text(
  //                 'Category',
  //                 style: GoogleFonts.poppins(
  //                   fontSize: 11,
  //                   color: Colors.blue[900],
  //                 ),
  //               ),
  //               dropdownMenuEntries: ctrl.listOfCategory
  //                   .map<DropdownMenuEntry<String>>((String value) {
  //                 ctrl.update();
  //                 return DropdownMenuEntry<String>(
  //                   value: value,
  //                   label: (value),
  //                 );
  //               }).toList(),
  //             ),
  //             SizedBox(
  //               height: 15,
  //             ),
  //             DropdownMenu<String>(
  //               onSelected: (value) {
  //                 ctrl.dropdownValuePackage = value!;
  //                 ctrl.update();
  //               },
  //               // height: 60,
  //               width: 285,
  //               label: Text(
  //                 "Package",
  //                 style: GoogleFonts.poppins(
  //                   fontSize: 11,
  //                   color: Colors.blue[900],
  //                 ),
  //               ),
  //               dropdownMenuEntries: ctrl.listOfPackage
  //                   .map<DropdownMenuEntry<String>>((String value) {
  //                 ctrl.update();
  //                 return DropdownMenuEntry<String>(
  //                   value: value,
  //                   label: (value),
  //                 );
  //               }).toList(),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   } else {
  //     return SizedBox(
  //       width: MediaQuery.of(context).size.width,
  //       child: SingleChildScrollView(
  //         child: Form(
  //           child: Column(
  //             children: [
  //               Container(
  //                 width: 300,
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: TextFormField(
  //                   controller: firstnameController,
  //                   onChanged: (value) {
  //                     firstName = value;
  //                   },
  //                     decoration: InputDecoration(
  //                       contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
  //                       labelText: "Name",
  //                       labelStyle: GoogleFonts.poppins(
  //                           color: Colors.blue[900],
  //                           fontSize: 11,
  //                           fontWeight: FontWeight.w400),
  //                       border: OutlineInputBorder(
  //                         gapPadding: 2,
  //                         borderSide: BorderSide(width: 5),
  //                       ),
  //                     )),
  //                 ),
  //               SizedBox(height: 5),
  //               Container(
  //                 width: 300,
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: TextFormField(
  //                   controller: pinCodeController,
  //                   onChanged: (value) {
  //                     pinCode = value;
  //                   },
  //                   decoration: InputDecoration(
  //                     contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
  //                     labelText: "Last Name",
  //                     labelStyle: GoogleFonts.poppins(
  //                         color: Colors.blue[900],
  //                         fontSize: 11,
  //                         fontWeight: FontWeight.w400),
  //                     border: OutlineInputBorder(
  //                       gapPadding: 2,
  //                       borderSide: BorderSide(width: 5),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 5),
  //               Container(
  //                 width: 300,
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: TextFormField(
  //                   controller: phoneController,
  //                   onChanged: (value) {
  //                     phone = value;
  //                   },
  //                   decoration: InputDecoration(
  //                     contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
  //                     labelText: "Phone",
  //                     labelStyle: GoogleFonts.poppins(
  //                         color: Colors.blue[900],
  //                         fontSize: 11,
  //                         fontWeight: FontWeight.w400),
  //                     border: OutlineInputBorder(
  //                       gapPadding: 2,
  //                       borderSide: BorderSide(width: 5),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 5),
  //               Container(
  //                 width: 300,
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: TextFormField(
  //                   controller: emailController,
  //                   onChanged: (value) {
  //                     email = value;
  //                   },
  //                   decoration: InputDecoration(
  //                     contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
  //                     labelText: "Email",
  //                     labelStyle: GoogleFonts.poppins(
  //                         color: Colors.blue[900],
  //                         fontSize: 11,
  //                         fontWeight: FontWeight.w400),
  //                     border: OutlineInputBorder(
  //                       gapPadding: 2,
  //                       borderSide: BorderSide(width: 5),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 5),
  //               Container(
  //                 width: 300,
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: TextFormField(
  //                   controller: passwordController,
  //                   obscureText: true,
  //                   enableSuggestions: false,
  //                   autocorrect: false,
  //                   onChanged: (value) {
  //                     pass = value;
  //                   },
  //                   decoration: InputDecoration(
  //                     contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
  //                     labelText: "Password",
  //                     labelStyle: GoogleFonts.poppins(
  //                         color: Colors.blue[900],
  //                         fontSize: 11,
  //                         fontWeight: FontWeight.w400),
  //                     border: OutlineInputBorder(
  //                       gapPadding: 2,
  //                       borderSide: BorderSide(width: 5),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 5),
  //               Container(
  //                 width: 300,
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: TextFormField(
  //                   controller: confirmPasswordController,
  //                   obscureText: true,
  //                   enableSuggestions: false,
  //                   autocorrect: false,
  //                   onChanged: (value) {
  //                     confirmPassword = value;
  //                   },
  //                   decoration: InputDecoration(
  //                     contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
  //                     labelText: "Confirm Password",
  //                     labelStyle: GoogleFonts.poppins(
  //                         color: Colors.blue[900],
  //                         fontSize: 11,
  //                         fontWeight: FontWeight.w400),
  //                     border: OutlineInputBorder(
  //                       gapPadding: 2,
  //                       borderSide: BorderSide(width: 5),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }

  Widget signUpCustomerForm(context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                width: 300,
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: firstnameController,
                    onChanged: (value) {
                      firstName = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      labelText: "Name",
                      labelStyle: GoogleFonts.poppins(
                          color: Colors.blue[900],
                          fontSize: 11,
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                        gapPadding: 2,
                        borderSide: BorderSide(width: 5),
                      ),
                    )),
              ),
              SizedBox(height: 5),

              Container(
                width: 300,
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneController,
                  onChanged: (value) {
                    phone = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    labelText: "Phone",
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
              SizedBox(height: 5),
              Container(
                width: 300,
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: addressController,
                  onChanged: (value) {
                    address = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    labelText: "Address",
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
              SizedBox(height: 5),
              Container(
                width: 300,
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: pinCodeController,
                  onChanged: (value) {
                    pinCode = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    labelText: "Pin code",
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
              SizedBox(height: 5),
              Container(
                width: 300,
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    labelText: "Email",
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
              SizedBox(height: 5),
              Container(
                width: 300,
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  onChanged: (value) {
                    pass = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    labelText: "Password",
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
              SizedBox(height: 5),
              Container(
                width: 300,
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    labelText: "Confirm Password",
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
            ],
          ),
        ),
      ),
    );
  }

  Widget formFeild(String title) {
    return SizedBox(
      // height: 60,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
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
}
