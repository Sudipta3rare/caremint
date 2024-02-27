import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controllers/splash_controller.dart';

import 'package:get/get.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  final SplashScreenViewModel welcomeController = SplashScreenViewModel.to;
  // final AuthController authCtrl = AuthController.to;


  @override
  void initState() {
    super.initState();
    welcomeController.controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    welcomeController.animation = CurvedAnimation(
        parent: welcomeController.controller, curve: Curves.easeIn);
    welcomeController.controller.forward();
    welcomeController.animation.addStatusListener((AnimationStatus status) {
      // welcomeController.goToDashboard();
      // if (status == AnimationStatus.completed) {
      //   String fin  =  welcomeController.store.read('firstIns');
      //   (fin == 'no')
      //       ? getVnCode() == '' ? welcomeController.gotoAuth() :authCtrl.gotoOrders()  //welcomeController.gotoHome()
      //   // ? getVnCode() == '' ? welcomeController.gotoLogin() :authCtrl.gotoOrders()
      //       : welcomeController.gotoIntro();
      // }
      if(status == AnimationStatus.completed){
        if(welcomeController.checkProvider()){
          welcomeController.goToProvider();
        }
        else{
          Get.offAndToNamed('/home');
        }

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body:  Container(
          width:double.maxFinite,
          height: double.maxFinite,
          color:  const Color(0XFF164378),
          child:  Column(
            children: [
              SizedBox(height: 60),
              Text("Welcome",style: TextStyle(color:Color(0XFFFFFFFF),fontSize:25,fontFamily:"Cinzel",fontWeight: FontWeight.bold)),
              Text("To",style: TextStyle(color:Color(0XFFFFFFFF),fontSize:25,fontFamily:"Cinzel",fontWeight: FontWeight.bold)),
              Text("Caremint",style: TextStyle(color:Color(0XFFB5F446),fontSize:40,fontFamily:"Cinzel",fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              Padding(padding:EdgeInsets.only(right: 20),
              child: Image.asset(
                "assets/images/splashlogo.png",
                width: 286,
                height: 328,
              )),
              Text("YOUR DOORSTEP",style: TextStyle(color:Color(0XFFFFFFFF),fontSize:20,fontFamily:"Cinzel",fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("DRYWASH",style: TextStyle(color:Color(0XFFB5F446),fontSize:25,fontFamily:"Cinzel",fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Text("&",style: TextStyle(color:Color(0XFFFFFFFF),fontSize:25,fontFamily:"Cinzel",fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("CAR CARE",style: TextStyle(color:Color(0XFFFFFFFF),fontSize:25,fontFamily:"Cinzel",fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Text("BRAND",style: TextStyle(color:Color(0XFFB5F446),fontSize:25,fontFamily:"Cinzel",fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 15),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/swip.png",
                    width: 247,
                    height: 65,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10,right: 120),
                  child: Image.asset(
                    "assets/images/splasharrow.png",
                    width: 74,
                    height: 54,
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return FadeTransition(
      opacity: welcomeController.animation,
      child: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/logo.png',
          width: Get.width,
        ),
      ),
    );
  }
}
