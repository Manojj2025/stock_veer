import 'package:flutter/material.dart';
import 'package:stock_veer/custom%20widgets/custom_appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/utils/colors.dart';

class ScreenYields extends StatelessWidget {
  const ScreenYields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 39,
                width: 317,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 2),
                  ],
                ),
                child: TextFormField(
                  controller: searchController,
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 14, color: const Color(0xff817979)),
                  cursorColor: Colors.black.withOpacity(0.4),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 4),
                      hintText: 'Search stocks or brands',
                      hintStyle: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 14, color: const Color(0xff817979)),
                      prefixIcon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                        size: 15,
                      ),
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                        color: Colors.grey,
                        icon: const Icon(
                          Icons.close,
                          size: 15,
                          color: Color(0xff9AA4B2),
                        ),
                        onPressed: (){},
                      )
                          : const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 25,
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 115,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 2),
                ],
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Nifty | ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color:k007AColor)),
                        TextSpan(text: 'SENSEX',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                      ]
                  )),
                  Row(
                    children: [
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(text: '18,159.95',style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w500,color:k1013Color)),
                            TextSpan(text: '-147.70\n',style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w500,color: kF611Color)),
                            TextSpan(text: '21 Nov 2022\n',style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w500,color: const Color(0xff141313))),
                            TextSpan(text: 'FII Cash\n',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color:k1013Color)),
                            TextSpan(text: '-1,593.83 cr\n',style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w500,color: kF611Color)),
                            TextSpan(text: '21 Nov 2022',style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w500,color: const Color(0xff141313))),
                          ]
                      ),),
                      Image.asset('assets/images/niftyGraph.png',height: 79,width: 230,fit: BoxFit.fill,)
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 4)
                  ],color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(

                  children: [
                    const SizedBox(height: 20,),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'Welcome,\n',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor)),
                          TextSpan(text: 'Long Terms Common',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k5552Color)),
                          TextSpan(text: ' Stock Investors!',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w600,color: k1190Color)),
                        ]
                    )),
                    const SizedBox(height: 10,),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'The genius investing process starts and probably ends with the',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k5552Color)),
                          TextSpan(text: " \"right\" ",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k1190Color)),
                          TextSpan(text: "STOCKVEER ",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k1190Color)),
                          TextSpan(text: " we make this complex, pain staking and time guzzling task - a cake work for you. Also, you will appreciate, while creating wealth with above-average returns, 'great' investor knows that a the investing genius lies in :-Knowing the actual worth of the underlying business of the stock. Identifying the paramount or Values & Ratios. Earnings or EPS figures alone are not enough.  A more diligent study beyond this is required. Other important financial positions & considerations really matter like:- Working Capital, Cath structure, Finercial Strengths & Capital Structure, earnings power, cash flows, etc. With our advanced Research and Analytics online plat- form, we provide complete Fundamental Analysis (Quanti- tative and Qualitative) in a simple, easy yet full of valuable insights, like no one else. At the click of a button, you just have to Search / type the stock name or run our superior stock screening tool.",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k5552Color)),

                        ]
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




