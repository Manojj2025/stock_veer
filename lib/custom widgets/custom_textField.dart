import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
class CustomTextfield extends StatelessWidget {
  double? width;
  TextInputType? textInputType;
  String? hintText;
  TextEditingController controller;
  List<TextInputFormatter>? inputFormatter;
  var onChanged;
  var validator;

  CustomTextfield({Key? key,this.width, this.textInputType=TextInputType.name,this.hintText,required this.controller,this.inputFormatter,this.validator,this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(90),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0
            )
          ]
      ),
      child: TextFormField(
        style: GoogleFonts.roboto(fontWeight: FontWeight.w400,fontSize: 18,color: k1E1BColor),
        controller: controller,
        keyboardType: textInputType,
        cursorColor: k1E1BColor,
        inputFormatters: inputFormatter,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.roboto(fontWeight: FontWeight.w400,fontSize: 16,color: kC0B7Color),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
