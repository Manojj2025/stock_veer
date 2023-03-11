import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class CheckListTile extends StatelessWidget {
  bool isRed;
  String title,subtitle;
  CheckListTile({Key? key,required this.isRed,required this.title,required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.arrow_drop_down_circle,color: isRed?kC213Color: const Color(0xff17E180),size: 30,),
      horizontalTitleGap: 0,
      title: Text(title,style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w500,color:Colors.black),),
      subtitle: Text(subtitle,maxLines:2,softWrap:true,overflow:TextOverflow.ellipsis,style: GoogleFonts.roboto(fontWeight: FontWeight.w400,fontSize: 12,color: const Color(0xffA69A9A)),),
    );
  }
}
