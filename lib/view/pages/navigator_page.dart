import 'package:disoccupied_app/controller/navbar_controller.dart';
import 'package:disoccupied_app/utils/ColorConstants.dart';
import 'package:disoccupied_app/view/pages/HomePage.dart';
import 'package:disoccupied_app/view/pages/more_page.dart';
import 'package:disoccupied_app/view/pages/submit_page.dart';
import 'package:disoccupied_app/view/pages/volunteer_page.dart';
import 'package:disoccupied_app/view/widgets/item_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NavigatorPage extends StatelessWidget {
  final NavbarController navbarController = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavbarController>(
        builder: (controller){
          switch(controller.currentNavIndex){
            case 0: return HomePage();
            case 1: return HomePage();
            case 2: return VolunteerPage();
            case 3: return SubmitPage();
            case 4: return MorePage();
            default: return HomePage();
          }
        },
      ),
      bottomNavigationBar: GetBuilder<NavbarController>(builder: (controller) {
        return BottomNavigationBar(
          onTap: (index){
            navbarController.changeIndex(index);
          },
          currentIndex: controller.currentNavIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorConstants.seedColorText,
          items: [
            BottomNavigationBarItem(
                icon: ItemIcon(
                  imagePath: 'assets/svg/nav-bar-icons/home_inactive.svg',
                  label: 'Home',
                ),
                activeIcon: ItemIcon(
                  imagePath: 'assets/svg/nav-bar-icons/home_active.svg',
                  label: 'Home',
                ),
                label: '',
            ),
            BottomNavigationBarItem(
                icon: ItemIcon(
                  imagePath: 'assets/svg/nav-bar-icons/donate_inactive.svg',
                  label: 'Donate',
                ),
                activeIcon: ItemIcon(
                  imagePath: 'assets/svg/nav-bar-icons/donate_active.svg',
                  label: 'Donate',
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ItemIcon(
                  imagePath: 'assets/svg/nav-bar-icons/volunteer_inactive.svg',
                  label: 'Volunteer',
                ),
                activeIcon: ItemIcon(
                  imagePath: 'assets/svg/nav-bar-icons/volunteer_active.svg',
                  label: 'Volunteer',
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ItemIcon(
                  imagePath: 'assets/svg/nav-bar-icons/submit_inactive.svg',
                  label: 'Submit',
                ),
                activeIcon: ItemIcon(
                  imagePath: 'assets/svg/nav-bar-icons/submit_active.svg',
                  label: 'Submit',
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ItemIcon(
                  imagePath: 'assets/svg/nav-bar-icons/more_inactive.svg',
                  label: 'More',
                ),
                activeIcon: ItemIcon(
                  imagePath: 'assets/svg/nav-bar-icons/more_active.svg',
                  label: 'More',
                ),
                label: ''),
          ],
        );
      }),
    );
  }
}
