import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

SizedBox widthSpace10 = const SizedBox(width: 10.0);

SizedBox heightSpace10 = const SizedBox(height: 10.0);
SizedBox heightSpace5 = const SizedBox(height: 5.0);

SizedBox widthSpace8 = const SizedBox(width: 8.0);
SizedBox widthSpace5 = const SizedBox(width: 5.0);
SizedBox widthSpace3 = const SizedBox(width: 3.0);
SizedBox widthSpace20 = const SizedBox(width: 20.0);
SizedBox widthSpace50 = const SizedBox(width: 50.0);
SizedBox widthSpace30 = const SizedBox(width: 30.0);

SizedBox heightSpace3 = const SizedBox(height: 3.0);
SizedBox heightSpace20 = const SizedBox(height: 20.0);
SizedBox heightSpace30 = const SizedBox(height: 30.0);
SizedBox heightSpace50 = const SizedBox(height: 50.0);

class BaseStyles {
  static final purpleMedium16 = GoogleFonts.roboto(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
  );
  static final productTitle = GoogleFonts.roboto(
    fontSize: 14.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
  );
  static final purpleMedium18 = GoogleFonts.roboto(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
  );

  static final lightblackNormal18 = GoogleFonts.roboto(
    color: const Color(0xff4F4F4F),
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
  );
  static final lightblackMedium16 = GoogleFonts.roboto(
    color: const Color(0xff4F4F4F),
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
  );
  static final lightblacknormal16 = GoogleFonts.roboto(
    color: const Color(0xff4F4F4F),
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
  );
  static final lightblackMedium12 = GoogleFonts.roboto(
    color: const Color(0xff4F4F4F),
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static final lightblacklarge12 = GoogleFonts.roboto(
    color: const Color(0xff4F4F4F),
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
  static final grey2normal12 = GoogleFonts.roboto(
    color: AppColors.greycolor2,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static final grey2normal10 = GoogleFonts.roboto(
    color: AppColors.greycolor2,
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
  );
  static final grey2Medium12 = GoogleFonts.roboto(
    color: AppColors.greycolor2,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
  static final grey2Medium14 = GoogleFonts.roboto(
    color: AppColors.greycolor2,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static final grey1normal14 = GoogleFonts.roboto(
    color: AppColors.greycolor1,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final grey1normal12 = GoogleFonts.roboto(
    color: AppColors.greycolor1,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static final grey1Medium14 = GoogleFonts.roboto(
    color: AppColors.greycolor1,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final grey2normal14 = GoogleFonts.roboto(
    color: AppColors.greycolor2,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final grey4normal14 = GoogleFonts.roboto(
    color: AppColors.greycolor4,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final grey4normal12 = GoogleFonts.roboto(
    color: AppColors.greycolor4,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static final grey2medium16 = GoogleFonts.roboto(
    color: AppColors.greycolor2,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
  );
  static final grey2M50014 = GoogleFonts.roboto(
    color: AppColors.greycolor2,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static final grey3Normal14 = GoogleFonts.roboto(
    color: AppColors.greycolor3,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final grey3Normal16 = GoogleFonts.roboto(
    color: AppColors.greycolor3,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
  );
  static final grey3medium16 = GoogleFonts.roboto(
    color: AppColors.greycolor3,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );
  static final grey3normal16 = GoogleFonts.roboto(
    color: AppColors.greycolor3,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
  );
  static final grey3Normal10 = GoogleFonts.roboto(
    color: AppColors.greycolor3,
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
  );
  static final grey3Normal12 = GoogleFonts.roboto(
    color: AppColors.greycolor3,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static final grey3medium12 = GoogleFonts.roboto(
    color: AppColors.greycolor3,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
  static final grey3medium14 = GoogleFonts.roboto(
    color: AppColors.greycolor3,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static final blueMediuml16 = GoogleFonts.roboto(
    color: AppColors.bluecolor,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );
  static final blueNormal12 = GoogleFonts.roboto(
    color: AppColors.bluecolor,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static final redNormal12 = GoogleFonts.roboto(
    color: AppColors.redcolor,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static final redNormal14 = GoogleFonts.roboto(
    color: Color.fromARGB(255, 223, 14, 14),
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final blueNormal14 = GoogleFonts.roboto(
    color: AppColors.bluecolor,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final lightblackMedium14 = GoogleFonts.roboto(
    color: const Color(0xff4F4F4F),
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final lightblackMedium13 = GoogleFonts.roboto(
    color: const Color(0xff4F4F4F),
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
  );
  static final blackNormal18 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
  );
  static final blacknormal20 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w300,
    fontSize: 20.sp,
  );
  static final blackmedium18 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
  );
  static final blackBoldMedium18 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
  );
  static final purplebold25 = GoogleFonts.roboto(
    color: AppColors.primaryColor.withOpacity(.8),
    fontWeight: FontWeight.w700,
    fontSize: 25.sp,
  );
  static final blackMedium14 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static final orangeMedium14 = GoogleFonts.roboto(
    color: AppColors.orangecolor,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static final orangenormal14 = GoogleFonts.roboto(
    color: AppColors.orangecolor,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final orangeMedium16 = GoogleFonts.roboto(
    color: AppColors.orangecolor,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );
  static final blacknormal13 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
  );
  static final blackNormal14 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final blackMedium13 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
  );
  static final blackMedium12 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
  static final blackMedium10 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 10.sp,
  );
  // static final greyNormal12 = GoogleFonts.roboto(
  //   color: AppColors.greycolor3,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 12.sp,
  // );
  static final blackMedium16 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
  );
  static final blackMedium18 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
  );
  static final blackMedium19 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w900,
    fontSize: 19.sp,
  );
  static final blackMedium24 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 24.sp,
  );
  static final blackMedium30 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 30.sp,
  );
  static final blackMedium15 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
  );
  static final blacNormal16 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
  );
  static final blacNormal18 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
  );
  static final blacNormal15 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
  );
  static final blacNormal14 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final blacNormal12 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static final blackNormal12 = GoogleFonts.roboto(
    color: Colors.black,
    fontWeight: FontWeight.w300,
    fontSize: 12.sp,
  );
  static final greyMedium14 = GoogleFonts.roboto(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final greyMedium13 = GoogleFonts.roboto(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
  );
  static final greyNormal12 = GoogleFonts.roboto(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static final greyMedium15 = GoogleFonts.roboto(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
  );
  static final greysmall12 = GoogleFonts.roboto(
    color: Colors.grey,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
  static final greennormal12 = GoogleFonts.roboto(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
  );
  static final greennormal14 = GoogleFonts.roboto(
    color: AppColors.primaryColor2,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final greennormal10 = GoogleFonts.roboto(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
  );
  static final greenNormal14 = GoogleFonts.roboto(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final greenMedium14 = GoogleFonts.roboto(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static final greenMedium12 = GoogleFonts.roboto(
    color: AppColors.primaryColor2,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
  static final greenMedium10 = GoogleFonts.roboto(
    color: Colors.green,
    fontWeight: FontWeight.w500,
    fontSize: 10.sp,
  );
  static final greenMedium11 = GoogleFonts.roboto(
    color: AppColors.primaryColor2,
    fontWeight: FontWeight.w500,
    fontSize: 11.sp,
  );
  static final redMedium14 = GoogleFonts.roboto(
    color: Colors.red,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static final redMedium16 = GoogleFonts.roboto(
    color: Colors.red,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
  );
  static final orange14normal = GoogleFonts.roboto(
    color: AppColors.yellowcolor,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final greyNormal14 = GoogleFonts.roboto(
    color: Colors.black87,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static final greyMedium18 = GoogleFonts.roboto(
    color: Colors.grey,
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
  );
  static final whiteMedium22 = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 22.sp,
    color: AppColors.whiteColor,
  );
  static final whitesmall10 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: AppColors.whiteColor,
  );
  static final whitesmall11 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 11.sp,
    color: AppColors.whiteColor,
  );
  static final whitebold30 = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 30.sp,
    color: AppColors.whiteColor,
  );
  static final whitemedium14 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.whiteColor,
  );
  static final whitebold14 = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    color: AppColors.whiteColor,
  );
  static final whitenormal14 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.whiteColor,
  );
  static final whiteMedium16 = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.whiteColor,
  );
  static final whitelight16 = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.whiteColor.withOpacity(0.5),
  );
  static final whitelarge16 = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: AppColors.whiteColor,
  );
  static final whitenormal12 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: AppColors.whiteColor,
  );
  static final whitebold12 = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: AppColors.whiteColor,
  );
  static final whitebold18 = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    color: AppColors.whiteColor,
  );
  static final whitebold40 = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 40.sp,
    color: AppColors.whiteColor,
  );
}
