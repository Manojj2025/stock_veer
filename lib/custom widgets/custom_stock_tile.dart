import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class CustomStockTile extends StatelessWidget {
 final String companyName,abbCompanyName;
  int index;
  CustomStockTile({Key? key,required this.companyName,required this.abbCompanyName,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      // height: 47,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xffE8E3E3), width: 0.5),
          bottom: BorderSide(color: Color(0xffE8E3E3), width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    companyName.toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xff5A5959),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        abbCompanyName.toString(),
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: const Color(0xff868383),
                        ),
                      ),
                      Container(
                        height: 15,
                        width: 41,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFF5CD),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Stock',
                            style: GoogleFonts.roboto(fontSize: 8, fontWeight: FontWeight.w400, color: kFDCDColor),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text(
                    //   stockPrice[index].toString(),
                    //   style: GoogleFonts.roboto(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 16,
                    //     color: const Color(0xff5A5959),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 7,
                    // ),
                    const Icon(
                      Icons.bookmark_border_outlined,
                      size: 15,
                      color: Colors.black,
                    ),
                  ],
                ),
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     percentPrice[index] < 0
                //         ? const Icon(
                //             Icons.arrow_drop_down,
                //             color: Color(0xffF61111),
                //           )
                //         : const Icon(
                //             Icons.arrow_drop_down,
                //             color: Color(0xff119004),
                //           ),
                //     const SizedBox(
                //       width: 3,
                //     ),
                //     Text(
                //       "${percentPrice[index].toString()}%",
                //       style: GoogleFonts.roboto(
                //         fontSize: 12,
                //         fontWeight: FontWeight.w400,
                //         color: const Color(0xff868383),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
