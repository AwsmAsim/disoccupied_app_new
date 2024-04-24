import 'package:get/get.dart';


// we are using state management for navbar also
// so that we can control the state even from the outside.
class NavbarController extends GetxController{

  int currentNavIndex = 0;

  changeIndex(int index){
    currentNavIndex = index;
    update();
  }

}