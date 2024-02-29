import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'custom_bottom_bar_model.dart';

class CustomBottomBarController extends GetxController {

  final RxInt selectedIndex = 0.obs;


  final List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: "assets/images/homeicon.png",
      activeIcon: "assets/images/homeiconbg.png",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: "assets/images/categoryicon.png",
      activeIcon: "assets/images/categoryiconbg.png",
      type: BottomBarEnum.Category,
    ),
    BottomMenuModel(
      icon: "assets/images/profileicon.png",
      activeIcon: "assets/images/profileiconbg.png",
      type: BottomBarEnum.Profile,
    )
  ];

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Category:
        return "/category";
      case BottomBarEnum.Profile:
        return "/profile";
      default:
        return "/";
    }
  }

}