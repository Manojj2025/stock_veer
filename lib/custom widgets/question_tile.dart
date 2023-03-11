import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class QuestionTile extends StatelessWidget {
  String question,answer;
  QuestionTile({Key? key,required this.question,required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 11),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 4),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(question,style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 12,color: k1013Color),),
              const Icon(Icons.close,color: k1013Color,size: 10,),
            ],
          ),
          const SizedBox(height: 8,),
          Text(answer,style: GoogleFonts.roboto(fontSize: 9,fontWeight: FontWeight.w400,color: const Color(0xff8A8282)),)
        ],
      ),
    );
  }
}
