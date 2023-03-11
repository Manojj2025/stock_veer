import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditInfoTile extends StatelessWidget {
  String imageSrc,text;
  TextEditingController controller;
  EditInfoTile({Key? key,required this.imageSrc,required this.text,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(imageSrc,height: 24,width: 24,fit: BoxFit.fill,),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text,style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 16,color: const Color(0xff1D1A1A)),),
              TextFormField(
                controller: controller,
                cursorColor: Colors.black.withOpacity(0.5),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xffF6F6F6),
                  filled: true,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
