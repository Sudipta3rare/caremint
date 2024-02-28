import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

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

  final Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Color(0XFFB5F446),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    bottomMenuList[index].icon,
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    bottomMenuList[index].activeIcon,
                    width: 66,
                    height: 66,
                  ),
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Category,
  Profile,
}

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

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
