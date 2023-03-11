import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
class ProfileTile extends StatelessWidget {
  String slNo,text;
  var ontap;
  ProfileTile({Key? key,required this.slNo,required this.text,required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0,left: 22,right: 22,bottom: 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 4,offset: const Offset(0, 1),),
            ]
        ),
        child: ListTile(
          onTap: ontap,
          leading: CircleAvatar(
              radius: 10,
              backgroundColor: kNavyBlue,
              child: Text(slNo,style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: kFDCDColor),)),
          title: Text(text,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.black),),
          trailing: Image.asset('assets/images/profileArrowForward.png',height: 17,width: 17,fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
