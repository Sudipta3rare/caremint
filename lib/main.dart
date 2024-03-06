import 'package:caremint/app_routes.dart';
import 'package:caremint/controllers/controllers.dart';
import 'package:caremint/controllers/my_orders_controller/my_order_controller.dart';
import 'package:caremint/franchise/controllers/customerInfo_controller.dart';
import 'package:caremint/franchise/controllers/order_controller.dart';
import 'package:caremint/franchise/controllers/tabview_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'controllers/home_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color(0XFFB5F446),
    systemNavigationBarDividerColor: Color(0XFF164378),// Set the background color here
    systemNavigationBarIconBrightness: Brightness.dark, // Set icon color
  ));

  GetStorage.init();
  // await Firebase.initializeApp(
  //   // options: DefaultFirebaseOptions.currentPlatform,
  // );
  _initController();

  // _initFirebase();
  runApp(const MainApp());
}
// _initFirebase() async {
//   await Firebase.initializeApp(
//     // options: DefaultFirebaseOptions.currentPlatform,
//   );
// }
_initController(){

  Get.put(SplashScreenViewModel());
  // Get.put(FirebaseController());
  Get.put(HomeController());
  Get.put(TabviewController());
  Get.put(SignUpController());
  Get.put(ExteriorServiceController());
  Get.put(SingleServiceController());
  Get.put<ServiceOrderController>(ServiceOrderController());
  Get.lazyPut(() => OrderController(),fenix: true);
  // Get.put<ListingServicesController>(ListingServicesController());
  Get.put<CustomerInfoController>(CustomerInfoController());
  Get.put<MyOrderController>(MyOrderController());
  // Get.put<CartController>(CartController());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return  GetMaterialApp(
            debugShowCheckedModeBanner: false,
            // home:SplashPage()
        initialRoute: '/',
        getPages: AppRoutes.routes,
        );
      },);
  }
}

//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         Duration(seconds: 3),
//             () => Navigator.of(context).pushReplacement(MaterialPageRoute(
//             builder: (BuildContext context) => HomeScreen())));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Image.asset('assets/splash.png'),
//       ),
//     );
//   }
// }