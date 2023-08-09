import 'package:caremint/app_routes.dart';
import 'package:caremint/controllers/cart_controller.dart';
import 'package:caremint/controllers/categories_controller/exterior_service_controller.dart';
import 'package:caremint/controllers/controllers.dart';
import 'package:caremint/controllers/my_orders_controller/my_order_controller.dart';
import 'package:caremint/controllers/single_service_controller.dart';
import 'package:caremint/franchise/controllers/customerInfo_controller.dart';
import 'package:caremint/franchise/controllers/listing_services_controller.dart';
import 'package:caremint/franchise/controllers/order_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get_core/src/get_main.dart';
import 'controllers/firebase_controller.dart';

import 'controllers/home_controller.dart';
import 'controllers/service_order_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  _initController();

  // _initFirebase();
  /*runApp(const MainApp());*/
}
// _initFirebase() async {
//   await Firebase.initializeApp(
//     // options: DefaultFirebaseOptions.currentPlatform,
//   );
// }
_initController() {
  Get.put(SplashScreenViewModel());
/*
  Get.put(FirebaseController());
*/
/*
  Get.put(HomeController());
*/
  Get.put(SignUpController());
/*
  Get.put(ExteriorServiceController());
*/
  Get.put(SingleServiceController());
/*
  Get.put<ServiceOrderController>(ServiceOrderController());
*/
  Get.lazyPut(() => OrderController(), fenix: true);
  Get.put<ListingServicesController>(ListingServicesController());
  Get.put<CustomerInfoController>(CustomerInfoController());
/*
  Get.put<MyOrderController>(MyOrderController());
*/


/*
  Get.put<CartController>(CartController());}
class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}
*/

/*class _MainAppState extends State<MainApp> {
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
}*/

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
}