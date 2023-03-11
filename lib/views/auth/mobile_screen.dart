import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/custom_textField.dart';
import 'package:stock_veer/utils/colors.dart';
import 'package:stock_veer/views/auth/otp_screen.dart';

import '../../custom widgets/custom_button.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 140,
            ),
            Center(
              child: Image.asset(
                'assets/images/mobile.png',
                height: 160,
                width: 160,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              'CONTINUE WITH YOUR MOBILE NUMBER',
              style: GoogleFonts.oswald(fontSize: 19, fontWeight: FontWeight.w500, color: k1D1BColor),
            ),
            const SizedBox(
              height: 37,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/India.png',
                    height: 37,
                    width: 37,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '+91',
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w800, fontSize: 18, color: k1E1BColor),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: CustomTextfield(
                    textInputType: TextInputType.number,
                    controller: phoneController,
                    hintText: 'Type Mobile Number',
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 47,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: CustomButton(
                text: 'Continue',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OtpScreen(
                        mobileNumber: phoneController.text,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 54.0),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'By Creating an account, you agree to our ',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 14, color: kC1B6Color),
                ),
                TextSpan(
                  text: 'Terms & Conditions ',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 14, color: kFDCDColor),
                ),
                TextSpan(
                  text: 'and ',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 14, color: kC1B6Color),
                ),
                TextSpan(
                  text: 'Privacy Policy.',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 14, color: kFDCDColor),
                ),
              ])),
            )
          ],
        ),
      ),
    );
  }
}
