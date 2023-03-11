import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bullet_text.dart';

class ProsConsTile extends StatelessWidget {
  List<String> listItems;
  String text;
  bool isPro;
  ProsConsTile({Key? key,required this.listItems,required this.text,required this.isPro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 18),
        decoration: BoxDecoration(
          border: Border.all(color: isPro? const Color(0xffC3FFF4):const Color(0xffF61111).withOpacity(0.15)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.black),),
            const SizedBox(height: 6,),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context,index){
                  return const SizedBox(height: 8,);
                },
                itemCount: listItems.length,
                itemBuilder: (context,index){
                  return BulletText(text: listItems[index]);
                }),
          ],
        )
    );
  }
}
