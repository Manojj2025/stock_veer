import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/controllers/root_controller.dart';
import 'package:get/get.dart';
import 'package:stock_veer/utils/colors.dart';

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);
  final RootController rootController = Get.put(RootController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => rootController.tabs[rootController.currentIndex.value]),
      bottomNavigationBar: Obx(
          ()=> DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                 colors: [
                   const Color(0xff040717),
                   const Color(0xff010938).withOpacity(0.81)
                 ]
              )
            ),
            child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedFontSize: 12,
                unselectedLabelStyle: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.white),
                currentIndex: rootController.currentIndex.value,
                selectedItemColor: kFDCDColor,
                unselectedItemColor: Colors.white,
                selectedLabelStyle: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w500,color: kFDCDColor),
                onTap: (value) => rootController.changeTab(value),
                items:  [
                  BottomNavigationBarItem(icon: Image.asset('assets/icons/bottomHome.png',height:20,width:20,fit:BoxFit.fill,), label: "Home"),
                  BottomNavigationBarItem(icon: Image.asset('assets/icons/bottomWatchlist.png',height:20,width:20,fit:BoxFit.fill,color: rootController.currentIndex.value== 1?kFDCDColor:Colors.white,), label: "Watchlist"),
                  BottomNavigationBarItem(icon:  Image.asset('assets/icons/bottomScreenYeild.png',height:25,width:25,color: rootController.currentIndex.value== 2?kFDCDColor:Colors.white,), label: "Screen Yields",),
                  BottomNavigationBarItem(icon:  Image.asset('assets/icons/bottomScrutiny.png',height:25,width:25,color: rootController.currentIndex.value== 3?kFDCDColor:Colors.white), label: "Grand Scrutiny & Bonus"),
                  BottomNavigationBarItem(icon: Image.asset('assets/icons/bottomProfile.png',height:25,width:25,color: rootController.currentIndex.value== 4?kFDCDColor:Colors.white), label: "Profile"),
                ],
            ),
          )
      ),
    );
  }
}
