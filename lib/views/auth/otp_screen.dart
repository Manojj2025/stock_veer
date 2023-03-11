import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/custom_button.dart';
import 'package:stock_veer/utils/colors.dart';
import 'package:pinput/pinput.dart';
import 'package:stock_veer/views/auth/register_screen.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  String mobileNumber;
  OtpScreen({Key? key,required this.mobileNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Image.asset('assets/icons/backIcon.png',height: 20,width: 20,fit: BoxFit.fill,)),
        ),
        title: Text('Enter Verification Code',style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: k3836Color
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 200,),
              Text('ENTER OTP',style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: k3836Color
              ),),
              const SizedBox(height: 5,),
              Text('We have sent an otp ON +91-$mobileNumber',style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: k998Color
              ),),
              const SizedBox(height: 70,),
              Pinput(
                length: 6,
                separator: const SizedBox(width: 18,),
                defaultPinTheme: PinTheme(
                  height: 50,
                  width: 31,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(90),
                  )
                ),
              ),
              const SizedBox(height: 16,),
              Text('Resend OTP?',style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: kFDCDColor
              ),),
              const SizedBox(height: 63,),
              CustomButton(text: 'Submit', onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen()));
              }),
              const SizedBox(height: 104,)
            ],
          ),
        ),
      ),
    );
  }
}
