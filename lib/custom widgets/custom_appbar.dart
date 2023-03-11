import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/views/premium_subscription.dart';

import '../utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        height: 26,
        width: 40,
        decoration: BoxDecoration(
            color: const Color(0xff0B1344),
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/stockveer_Splash.png',)

            )
        ),
      ),
      title: Text('StockVeer',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 18,color: const Color(0xff030A39)),),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15),
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PremiumSubscription()));
            },
            child: Ink(
              height: 21,
              width: 125,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.white,
                  border: Border.all(color: kFDCDColor,width: 1),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 1,)
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Click To Subscription offer',style: GoogleFonts.poppins(fontSize: 8,fontWeight: FontWeight.w600,color: kF611Color),),
                  Image.asset('assets/icons/doubleArrow.png',height: 13,width: 13,fit: BoxFit.fill,),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset('assets/images/profilePhoto.png',height: 24,width: 24,fit: BoxFit.fill,),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
