import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomButton extends StatelessWidget {
  String text;
  VoidCallback onTap;
  CustomButton({Key? key,required this.text,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: 36,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            gradient: const LinearGradient(colors: [
              Color(0xff007AFF),
              Color(0xff096DDA),
            ]),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
                spreadRadius: 0,
                offset: const Offset(0, 0),
              )
            ]),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
          ),),
      ),
    );
  }
}
