import 'package:get/get.dart';
import 'package:stock_veer/views/bottom%20nav%20bar%20screens/screen_yields.dart';

import '../views/bottom nav bar screens/grand_scrutiny.dart';
import '../views/bottom nav bar screens/home screen/home_screen.dart';
import '../views/bottom nav bar screens/profile/profile.dart';
import '../views/bottom nav bar screens/watch_list.dart';

class RootController extends GetxController{
  RxInt currentIndex = 0.obs;

  changeTab(value){
    currentIndex.value = value;
  }

  List tabs = [];

  @override
  void onInit() {
    // TODO: implement onInit
    tabs = [
      HomeScreen(),
      WatchList(),
      ScreenYields(),
      GrandScrutiny(),
      Profile(),
    ];
    super.onInit();
  }
}