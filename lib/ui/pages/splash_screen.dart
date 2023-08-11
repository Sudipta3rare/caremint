import 'package:flutter/material.dart';

import '../../controllers/splash_controller.dart';

import 'package:get/get.dart';

import 'home_page.dart';

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
        body: _buildBody(),
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
