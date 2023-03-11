import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ForecastAndRatings extends StatelessWidget {
  const ForecastAndRatings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
        backgroundColor: Colors.white,
        elevation: 0,
        title:Text("Forecast & Ratings",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),

      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 10,),
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xff17E180),width: 5),
                  color: Colors.white,
                ),
                child: Center(child: Text('56%',style: GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.black),),),
              ),
              const SizedBox(width: 10,),
              Expanded(child: Text("Analysts have suggested that investors can buy this stock",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),)),

            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
              Text("Earnings",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
              Text("Revenue",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            height: 33,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xfff5f3f3),
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 2,),
              ]
            ),
            child: Center(
              child:Text("See Detailed Forecast",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),

            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 300,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 2,),
                ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text("Financial Trend",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                  Image.asset('assets/images/forcastBarGraph.png',height: 212,width: double.infinity,fit: BoxFit.fill,),
                  Container(
                  height: 33,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xfff5f3f3),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 2,),
                      ]
                  ),
                  child: Center(
                    child:Text("See financial Statement",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),

                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            height: 300,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 2,),
                ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text("Financial Trend",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Promoter Holding",style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black,decoration: TextDecoration.underline),),
                      Text("In the last 6 Month, Promoter holding in the Company has almost stayed consent",style: GoogleFonts.roboto(fontSize: 10,fontWeight: FontWeight.w300,color: const Color(0xffB4A5A5)),),
                    ],
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Low Pledge Promoter Holding",style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black,decoration: TextDecoration.underline),),
                    Text("In the last 6 Month, Promoter holding in the Company has almost stayed consent",style: GoogleFonts.roboto(fontSize: 10,fontWeight: FontWeight.w300,color: const Color(0xffB4A5A5)),),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mutual Fun Holding",style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black,decoration: TextDecoration.underline),),
                    Text("In the last 6 Month, Promoter holding in the Company has almost stayed consent",style: GoogleFonts.roboto(fontSize: 10,fontWeight: FontWeight.w300,color: const Color(0xffB4A5A5)),),
                  ],
                ),
                Container(
                  height: 33,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xfff5f3f3),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 2,),
                      ]
                  ),
                  child: Center(
                    child:Text("See financial Statement",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),

                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}
