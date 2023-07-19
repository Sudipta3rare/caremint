import 'package:caremint/ui/widget/login_snackbar.dart';
import 'package:caremint/ui/widget/signup_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_string.dart';
import '../components/custom_button.dart';

class ForgetPasswordSnackbar {
  Future forgetPasswordSnackbar(context){

    final TextEditingController emailController = TextEditingController();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    void sendPasswordResetEmail(BuildContext context) async {
      String email = emailController.text.trim();

      if (email.isEmpty) {
        Get.snackbar(
          'Info',
          'Enter Your Register Mail ID',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Color(0xffffffff),
          backgroundColor: AppStyle().gradientColor2,
          duration: Duration(seconds: 2),
        );
        return;
      }

      Get.snackbar(
        'Info',
        'Sending Reset Email',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Color(0xffffffff),
        backgroundColor: AppStyle().gradientColor2,
        duration: Duration(seconds: 2),
      );

      try {
        await _auth.sendPasswordResetEmail(email: email);
        Get.snackbar(
          'Info',
          'Instruction to reset your password sent',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Color(0xffffffff),
          backgroundColor: AppStyle().gradientColor2,
          duration: Duration(seconds: 2),
        );

      } catch (e) {
        Get.snackbar(
          'Info',
          'Failed to sent reset email!',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Color(0xffffffff),
          backgroundColor: AppStyle().gradientColor2,
          duration: Duration(seconds: 2),
        );
      }
    }

    return Get.dialog(
      SingleChildScrollView(
        child: AlertDialog(
            backgroundColor:Colors.blue[50],
            shadowColor: Colors.blue[900]?.withOpacity(0.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            actions: [
              IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.cancel),
                  color:AppStyle.buttonColor)
            ],
          content: Container(
              color: Colors.blue[50],
            margin: EdgeInsets.only(right: 8, left: 8,top: 10),
            // padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Forget Password",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1
                    ),),

                  SizedBox(height: 10,),

                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,color: AppStyle.buttonColor,),
                        contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        labelText: "Enter your email",
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

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () => sendPasswordResetEmail(context),
                      child: CustomButton().customButton200(context, "Reset Password"),
                    ),
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

                  SizedBox(height: 8),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}