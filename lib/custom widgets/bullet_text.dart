import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BulletText extends StatelessWidget {
  String text;
  BulletText({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.translate(
          offset: const Offset(0, -8),
          child: const Text(
            '•',
            style: TextStyle(fontSize: 30,color: Color(0xff817979)),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w500,color: const Color(0xff817979)),
          ),
        ),
      ],
    );
  }
}
