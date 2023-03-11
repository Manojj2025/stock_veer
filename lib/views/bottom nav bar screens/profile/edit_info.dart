import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/edit_info_tile.dart';
import 'package:stock_veer/utils/colors.dart'; // import this

class EditInfo extends StatelessWidget {
  const EditInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(),numberController = TextEditingController(),emailController = TextEditingController(),aboutController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kNavyBlue,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: InkWell(
                onTap: ()=>Get.back(),
                child: Image.asset('assets/images/profileArrowForward.png')),
          ),
        ),
        title: Text('EDIT PROFILE',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20 ),
        children: [
          EditInfoTile(imageSrc: 'assets/icons/editName.png', text: 'Name*', controller: nameController),
          const SizedBox(height: 10,),
          EditInfoTile(imageSrc: 'assets/icons/editPhone.png', text: 'Mobile Number *', controller: numberController),
          const SizedBox(height: 10,),
          EditInfoTile(imageSrc: 'assets/icons/editMail.png', text: 'Email', controller: emailController),
          const SizedBox(height: 10,),
          EditInfoTile(imageSrc: 'assets/icons/editAbout.png', text: 'About', controller: aboutController),
          const SizedBox(height: 10,),
          EditInfoTile(imageSrc: 'assets/icons/editAbout.png', text: 'About', controller: aboutController),
          const SizedBox(height: 180,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 72.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 41),
                    maximumSize: const Size(200, 41),
                  backgroundColor: kNavyBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Save',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),)),
          )
        ],
      ),
    );
  }
}
