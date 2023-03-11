import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/profile_tile.dart';
import 'package:stock_veer/utils/colors.dart';
import 'package:stock_veer/views/FAQ.dart';
import 'package:stock_veer/views/auth/mobile_screen.dart';
import 'package:stock_veer/views/bottom%20nav%20bar%20screens/profile/edit_info.dart';
import 'package:stock_veer/views/bottom%20nav%20bar%20screens/watch_list.dart';
import 'package:stock_veer/views/privacy_policy.dart';
import 'package:stock_veer/views/terms_and_conditions.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kNavyBlue,
          elevation: 0,
          actions: [
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditInfo()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/editIcon.png',
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Center(
                      child: Text(
                    'Edit',
                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                  )),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 140,
                width: double.infinity,
                color: kNavyBlue,
                child: Column(
                  children: [
                    CircleAvatar(
                        radius: 40,
                        backgroundColor: kNavyBlue,
                        child: Image.asset(
                          'assets/images/profileImage.png',
                        )),
                    Text(
                      'Harsh',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              ProfileTile(slNo: '1', text: 'Invite & Earn', ontap: () {}),
              ProfileTile(slNo: '2', text: 'Privacy Policy', ontap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
              }),
              ProfileTile(slNo: '3', text: 'Terms and Condition', ontap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TermsAndConditions()));
              }),
              ProfileTile(slNo: '4', text: 'Contact Us', ontap: () {}),
              ProfileTile(slNo: '5', text: 'Watchlist', ontap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WatchList()));
              }),
              ProfileTile(slNo: '6', text: 'FAQ', ontap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FAQ()));
              }),
              ProfileTile(slNo: '7', text: 'Logout', ontap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MobileScreen()));
              }),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }
}
