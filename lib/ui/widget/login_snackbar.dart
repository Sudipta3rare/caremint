import 'package:caremint/constants/app_string.dart';
import 'package:caremint/constants/constants.dart';
import 'package:caremint/controllers/controllers.dart';
import 'package:caremint/controllers/home_controller.dart';
import 'package:caremint/services/api_requests.dart';
import 'package:caremint/ui/components/loading_overlay_components.dart';
import 'package:caremint/ui/widget/signup_snackbar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../models/user_model.dart';
import '../components/custom_button.dart';
import 'forget_password_snackbar.dart';

class LoginSnackBar {
  String email = '';
  String pass = '';

  Future loginSnackBar(context) async  {
    /*//Check user Login Successful
    if (FirebaseAuth.instance.currentUser != null) {
      print("User Loginnnnnnnnn");
    } else {
      print("No Userrrrrrrrrrrr");
    }*/

    return Get.dialog(
        useSafeArea: false,
        AlertDialog(
          backgroundColor: Colors.blue[50],
          shadowColor: Colors.blue[900]?.withOpacity(0.5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.cancel),
                color: AppStyle.buttonColor)
          ],
          content: Container(
            color: Colors.blue[50],
            margin: EdgeInsets.only(right: 8, left: 8, top: 10),
            // padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (val) {
                        if (val?.length == 0) {
                          return "Email cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppStyle.buttonColor,
                        ),
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
                      onChanged: (value) {
                        pass = value;
                      },
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppStyle.buttonColor,
                        ),
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
                  SizedBox(
                    height: 5,
                  ),
                  GetBuilder<SignUpController>(builder: (ctrl) {
                    return GetBuilder<HomeController>(
                        builder: (hmCtrl) {
                          return LoadingOverlay(
                            isLoading: hmCtrl.isLoading.value,
                            child: GestureDetector(
                              onTap: () async {
                                hmCtrl.isLoading.value = true;
                                hmCtrl.update();
                                if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                    .hasMatch(email)) {
                                  hmCtrl.isLoading.value = false;
                                  hmCtrl.update();
                                  Get.snackbar(
                                    'Info',
                                    'Please enter a valid email.',
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Color(0xffffffff),
                                    backgroundColor: AppStyle().gradientColor2,
                                    duration: Duration(seconds: 2),
                                  );
                                } else if (pass.isEmpty) {
                                  hmCtrl.isLoading.value = false;
                                  hmCtrl.update();

                                  Get.snackbar(
                                    'Info',
                                    'Password field cannot be empty.',
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Color(0xffffffff),
                                    backgroundColor: AppStyle().gradientColor2,
                                    duration: Duration(seconds: 2),
                                  );
                                } else {
                                  try {
                                    final apiRequest = ApiRequest(url: Constant.baseUrl + "/api/user-login", frmData: {
                                      'email': email,
                                      'password': pass,
                                    });

                                    await apiRequest.post(
                                      beforeSend: () {
                                        // Perform actions before making the request if needed
                                      },
                                      onSuccess: (response) async {
                                        print(response.data);
                                        if (response.statusCode == 200) {
                                          print("Success");

                                          Map<String, dynamic> responseData = response.data;

                                          UserResponse userResponse = UserResponse.fromJson(responseData);

                                              if(userResponse.token != "" || userResponse.token != null) {
                                                hmCtrl.isLoggedIn.value = true;
                                              }
                                          Get.snackbar(
                                            'Message',
                                            'Login Successful',
                                            snackPosition: SnackPosition.BOTTOM,
                                            colorText: Color(0xffffffff),
                                            backgroundColor: AppStyle().gradientColor2,
                                            duration: Duration(seconds: 2),
                                          );
                                          await  hmCtrl.storeUserDetails(userResponse);

                                          hmCtrl.isLoading.value = false;
                                          ctrl.update();
                                          hmCtrl.update();
                                          if(ctrl.store.read(("user_role")) == "2"){
                                            Get.offAllNamed('/home');
                                          }
                                          else{
                                            ctrl.goToProvider();
                                          }



                                        } else if (response.statusCode == 401) {
                                          print("Unauthorized"); // Handle unauthorized login
                                          Get.snackbar(
                                            'Message',
                                            'Login Unsuccessful: Unauthorized',
                                            snackPosition: SnackPosition.BOTTOM,
                                            colorText: Color(0xffffffff),
                                            backgroundColor: AppStyle().gradientColor2,
                                            duration: Duration(seconds: 2),
                                          );

                                          hmCtrl.isLoading.value = false; // Stop the circular progress indicator
                                          ctrl.update();
                                          hmCtrl.update();
                                        } else {
                                          print("Failed");
                                          Get.snackbar(
                                            'Message',
                                            'Login Unsuccessful',
                                            snackPosition: SnackPosition.BOTTOM,
                                            colorText: Color(0xffffffff),
                                            backgroundColor: AppStyle().gradientColor2,
                                            duration: Duration(seconds: 2),
                                          );

                                          hmCtrl.isLoading.value = false;
                                          ctrl.update();
                                          hmCtrl.update();
                                        }
                                      },
                                      onError: (error) {
                                        print("Exception: $error");
                                        Get.snackbar(
                                          'Message',
                                          'Login Unsuccessful',
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Color(0xffffffff),
                                          backgroundColor: AppStyle().gradientColor2,
                                          duration: Duration(seconds: 2),
                                        );

                                        hmCtrl.isLoading.value = false; // Stop the circular progress indicator on exception
                                        ctrl.update();
                                        hmCtrl.update();
                                      },
                                    );
                                  } catch (e) {
                                    print("Exception: $e");
                                    Get.snackbar(
                                      'Message',
                                      'Login Unsuccessful',
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Color(0xffffffff),
                                      backgroundColor: AppStyle().gradientColor2,
                                      duration: Duration(seconds: 2),
                                    );
                                    hmCtrl.isLoading.value = false; // Stop the circular progress indicator on exception
                                    ctrl.update();
                                    hmCtrl.update();
                                  }
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomButton().customButton200(context, "Login"),
                              ),
                            ),
                          );
                        }
                    );
                  }),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                        SignUpSnackBar().signUpSnackBar(context);
                      },
                      child: Text(
                        "${AppString().newUser}",
                        style: GoogleFonts.poppins(fontSize: 15),
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                        ForgetPasswordSnackbar()
                            .forgetPasswordSnackbar(context);
                      },
                      child: Text(
                        "${AppString().forgotPassword}",
                        style: GoogleFonts.poppins(fontSize: 13),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
