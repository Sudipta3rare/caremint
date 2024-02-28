import 'package:caremint/franchise/views/tabview.dart';
import 'package:caremint/ui/pages/categories/category_page.dart';
import 'package:caremint/ui/pages/categories/exterior_services.dart';
import 'package:caremint/ui/pages/home_page.dart';
import 'package:caremint/ui/pages/my_orders_page.dart';
import 'package:caremint/ui/pages/profile_page.dart';
import 'package:caremint/ui/pages/splash_screen.dart';
import 'package:get/get.dart';


class AppRoutes {

  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () =>  ProfilePage(), transition: Transition.fade),
    GetPage(name: '/', page: () =>  SplashPage(), transition: Transition.fade),
    GetPage(name: '/home', page: () =>  HomePage(), transition: Transition.fade),
    GetPage(name: '/service', page: () =>  ExteriorServices(), transition: Transition.fade),
    // GetPage(name: '/auth', page: () => const AuthPage()),
    // GetPage(name: '/dashboard', page: () => const DashboardPage()),
    // GetPage(name: '/orders', page: () =>  const ListOrders(), transition: Transition.fade),
    GetPage(name: '/order', page: () =>   MyOrdersPage(), transition: Transition.fade),
    // GetPage(name: '/cart', page: () =>   CartPage(), transition: Transition.fade),
    GetPage(name: '/tabview', page: () =>   TabView(), transition: Transition.fade),
  ];
}