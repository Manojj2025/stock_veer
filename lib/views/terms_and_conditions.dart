import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Terms & Conditions',
          style: GoogleFonts.mulish(fontWeight: FontWeight.w500, fontSize: 24, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Text('Condition of Use',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
            const SizedBox(height: 5),
            Container(
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
                  Text("Welcome to Stock Veer ! My company  and its associates provide their services to you subject to the following conditions.",style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xff2E2A2A),
                  ),),
                  const SizedBox(height: 20,),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.",style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xff2E2A2A),
                  ),),
                  const SizedBox(height: 20,),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus vitae sodales egestas feugiat etiam.",style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xff2E2A2A),
                  ),),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(child: InkWell(
              onTap: (){
                setState(() {
                  selectedIndex=1;
                });
              },
              child: Ink(
                height: 38,
                decoration: BoxDecoration(
                  gradient: selectedIndex==1?LinearGradient(colors: [const  Color(0xff040717),const Color(0xff010938).withOpacity(0.81)]):null,
                  color: selectedIndex==1?null:Colors.white,
                  boxShadow: selectedIndex==1?null:[BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 4)]
                ),
                child: Center(
                  child: Text('ACCEPT',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16,color: selectedIndex==1?Colors.white:const Color(0xffCAC6C6)),),
                ),
              ),
            )),
            const SizedBox(width: 13,),
            Expanded(child: InkWell(
              onTap: (){
                setState(() {
                  selectedIndex=2;
                });
              },
              child: Ink(
                height: 38,
                decoration: BoxDecoration(
                    gradient: selectedIndex==2?LinearGradient(colors: [const  Color(0xff040717),const Color(0xff010938).withOpacity(0.81)]):null,
                    color: selectedIndex==2?null:Colors.white,
                    boxShadow: selectedIndex==2?null:[BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 4)]
                ),
                child: Center(
                  child: Text('DECLINE',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16,color: selectedIndex==2?Colors.white:const Color(0xffCAC6C6)),),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
