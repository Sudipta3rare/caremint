import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_bottom_bar_controller.dart';

class CustomBottomBar extends StatelessWidget {

  final CustomBottomBarController controller = Get.put(
      CustomBottomBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomBarController>(
        builder: (controller) =>
            Container(
              height: 76,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: BottomNavigationBar(
                backgroundColor: Color(0XFFB5F446),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedFontSize: 0,
                elevation: 0,
                currentIndex: controller.selectedIndex.value,
                type: BottomNavigationBarType.fixed,
                items: List.generate(controller.bottomMenuList.length, (index) {
                  return BottomNavigationBarItem(
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          controller.bottomMenuList[index].icon,
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
                          controller.bottomMenuList[index].activeIcon,
                          width: 66,
                          height: 66,
                        ),
                      ],
                    ),
                    label: '',
                  );
                }),
                onTap: (index) {
                  controller.selectedIndex.value = index;
                  String route = controller.getCurrentRoute(
                      controller.bottomMenuList[index].type);
                  if (route == "/homenew") {
                    Get.offAllNamed(route);
                  } else {
                    Get.toNamed(route);
                  }
                },
              ),
            ));
  }
}




