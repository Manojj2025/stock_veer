import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
                size: 24,
              )),
          title: Text(
            'Privacy Policy',
            style: GoogleFonts.mulish(fontWeight: FontWeight.w500, fontSize: 24, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Container(
                height: 38,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(90),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.25),offset: const Offset(0, 2),blurRadius: 2,spreadRadius: 0)
                  ]
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelStyle: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500),
                  labelStyle: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500),
                  unselectedLabelColor: const Color(0xff57574A),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff040717),
                          const Color(0xff010938).withOpacity(0.81),
                        ],
                      ),
                    ),
                    tabs: const [
                      Tab(
                        text: 'HUMAN-FRIENDLY',
                      ),
                      Tab(
                        text: 'OVERVIEW',
                      ),
                    ]),
              ),
              const SizedBox(height: 20,),
              const Expanded(
                child:  TabBarView(children: [
                  HumanFriendlyView(),
                  Overview(),
                ]),
              ),
              const SizedBox(height: 30,)

            ],
          ),
        ),
      ),
    );
  }
}

class HumanFriendlyView extends StatelessWidget {
  const HumanFriendlyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(

        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 4,spreadRadius: 0),
            ],
            color: Colors.white
        ),
        child: Column(
          children: [
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.",style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: const Color(0xff2E2A2A),
            ),),
            const SizedBox(height: 30,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.",style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: const Color(0xff2E2A2A),
            ),),
          ],
        ),
      ),
    );
  }
}

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(

        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 4,spreadRadius: 0),
            ],
            color: Colors.white
        ),
        child: Column(
          children: [
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.",style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: const Color(0xff2E2A2A),
            ),),
            const SizedBox(height: 30,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.",style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: const Color(0xff2E2A2A),
            ),),
          ],
        ),
      ),
    );
  }
}


