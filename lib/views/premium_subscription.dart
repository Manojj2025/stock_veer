import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/utils/colors.dart';

class PremiumSubscription extends StatelessWidget {
  const PremiumSubscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20,),
            Container(
              height: 44,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: Colors.white,
                border: Border.all(color: const Color(0xffBFB6B6)),
              ),child: Center(child: Text('PREMIUM SUBSCRIPTION OFFER',style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16,color: kF611Color),)),
            ),
            const SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star,color: kF611Color,size: 20,),
                const SizedBox(width: 10,),
                Expanded(
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Time is money. ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                        TextSpan(text: 'Save your precious time ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                        TextSpan(text: 'that is guzzled up (hundreds of thousands in studying annual reports and financial statements. man-hours)',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                      ]
                  )),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star,color: kF611Color,size: 20,),
                const SizedBox(width: 10,),
                Expanded(
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Know the important valuation considerations (including',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                        TextSpan(text: 'INTRINSIC BUSINESS VALUE (IBV) ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                        TextSpan(text: 'and the ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                        TextSpan(text: 'MARGIN OF SAFETY ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                        TextSpan(text: 'inside the stock).',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                      ]
                  )),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star,color: kF611Color,size: 20,),
                const SizedBox(width: 10,),
                Expanded(
                  child:Text('Uncover the deep rooted worth. instantly at just a click of a button of stock,',style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/smallRupee.png'),
                Text('OR',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff096DDA)),),
                Image.asset('assets/images/bigRupee.png')
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star,color: kF611Color,size: 20,),
                const SizedBox(width: 10,),
                Expanded(
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Discover the ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                        TextSpan(text: 'Bargain issues ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                        TextSpan(text: 'or Deep discounted stocks.',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                      ]
                  )),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star,color: kF611Color,size: 20,),
                const SizedBox(width: 10,),
                Expanded(
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Get the paramount or ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                        TextSpan(text: "grand' Voles and Ratios ",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                        TextSpan(text: '(fin- ancial and accounting) along with valuable hidden insights.',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                      ]
                  )),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star,color: kF611Color,size: 20,),
                const SizedBox(width: 10,),
                Expanded(
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Know the company behind the stock, inside out (Complete ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                        TextSpan(text: "financial strength and capital structure)",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                      ]
                  )),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star,color: kF611Color,size: 20,),
                const SizedBox(width: 10,),
                Expanded(
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Get the Financial Health ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                        TextSpan(text: "Scorecard,",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                        TextSpan(text: 'summarized.',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),

                      ]
                  )),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star,color: kF611Color,size: 20,),
                const SizedBox(width: 10,),
                Expanded(
                  child:Text(' Stock selection/screens for enterprising and defensive investor.',style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star,color: kF611Color,size: 20,),
                const SizedBox(width: 10,),
                Expanded(
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Signs of winners and losers ( Stock still having skam) Shocking ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                        TextSpan(text: "revealations ",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                        TextSpan(text: 'and ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                        TextSpan(text: "growth indicators. ",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                      ]
                  )),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star,color: kF611Color,size: 20,),
                const SizedBox(width: 10,),
                Expanded(
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Get the stock category, or rim the cate- gory screens to uncover the ',style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                        TextSpan(text: " the nature of stock :-",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: k007AColor,decoration: TextDecoration.underline)),
                      ]
                  )),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  StarredText(first: 'Growth Stock', second: 'Turnaround Stock'),
                  const SizedBox(height: 20,),
                  StarredText(first: 'Dividend Stock', second: 'Hidden Asset'),
                  const SizedBox(height: 20,),
                  StarredText(first: 'Blue-chip Stock', second: 'Special situation'),
                  const SizedBox(height: 20,),
                  StarredText(first: 'Cyclical', second: 'Slack & Snowball'),
                  const SizedBox(height: 20,),

                ],
              ),
            ),
            const SizedBox(height: 30,)
          ],
        )
      ),
    );
  }
}



class StarredText extends StatelessWidget {
  String first,second;
  StarredText({Key? key,required this.first,required this.second}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.star,color: kF611Color,size: 20,),
            const SizedBox(width: 8,),
            Text(first,style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xff096DDA),),)
          ],
        ),
        Row(
          children: [
            const Icon(Icons.star,color: kF611Color,size: 20,),
            const SizedBox(width: 8,),
            Text(second,style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xff096DDA),),)
          ],
        ),
      ],
    );
  }
}

