import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/utils/colors.dart';

class GrandScrutiny extends StatelessWidget {
  const GrandScrutiny({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20,),
            Center(child: Image.asset('assets/images/rewardImage.png',height: 62,width: 41,fit: BoxFit.fill,)),
            Center(child: Text('REWARDS & BONUSES',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w700,color: k007AColor),)),
            const SizedBox(height: 15,),
            Text('1. Insights to Life VS stock market. ',style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
            const SizedBox(height: 10,),
            Text('2. Golden rules of Value investing.',style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
            const SizedBox(height: 10,),
            Text('3. Lessons from the investing legends (check repeat)',style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
            const SizedBox(height: 10,),
            Text('4. Famous Quotes and thoughts from the Goats. ',style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
            const SizedBox(height: 10,),
            RichText(text: TextSpan(
              children: [
                TextSpan(text: '5. The element ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                TextSpan(text: 'Probability and Psychology ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                TextSpan(text: 'investing (The two most simple and popular ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                TextSpan(text: "probabinvilistic theories and its application to invecting):",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),

              ]
            )),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("(a )How to calculate the chances of success, Return on Investment.",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                  const SizedBox(height: 10,),
                  Text("(b) How To Decide how much. Amount to invest).",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            RichText(text: TextSpan(
                children: [
                  TextSpan(text: '6. ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                  TextSpan(text: 'Wealth Building formula',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                  TextSpan(text: '(ms excel).',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                ]
            )),
            const SizedBox(height: 10,),
            RichText(text: TextSpan(
                children: [
                  TextSpan(text: '7. ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                  TextSpan(text: 'Margin of safety ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                  TextSpan(text: 'concept simplyfied.',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                ]
            )),
            const SizedBox(height: 10,),
            RichText(text: TextSpan(
                children: [
                  TextSpan(text: '8. The',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                  TextSpan(text: 'Cost of Less ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                  TextSpan(text: 'illustration. ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                ]
            )),
            const SizedBox(height: 10,),
            RichText(text: TextSpan(
                children: [
                  TextSpan(text: '9. ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                  TextSpan(text: 'Thought of section',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                  TextSpan(text: '/sharing section of the premium user community.',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                ]
            )),
          ],
        )
      ),
    );
  }
}




