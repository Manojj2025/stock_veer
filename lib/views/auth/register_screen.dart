import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/custom_button.dart';
import 'package:stock_veer/custom%20widgets/custom_textField.dart';
import 'package:stock_veer/views/root.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController(),
      countryController = TextEditingController(),
      emailController = TextEditingController(),
      phoneController = TextEditingController(),
      dayController = TextEditingController(),
      monthController = TextEditingController(),
      yearController = TextEditingController();

  int selectedGender = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 30,
        title: Text(
          'Register',
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xff484646),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            'FULL NAME',
            style: GoogleFonts.oswald(fontWeight: FontWeight.w500, fontSize: 19, color: const Color(0xff111010)),
          ),
          const SizedBox(
            height: 6,
          ),
          CustomTextfield(controller: nameController,hintText: 'Enter Name',),
          const SizedBox(
            height: 20,
          ),
          Text(
            'COUNTRY',
            style: GoogleFonts.oswald(fontWeight: FontWeight.w500, fontSize: 19, color: const Color(0xff111010)),
          ),
          const SizedBox(
            height: 6,
          ),
          CustomTextfield(controller: countryController,hintText: 'Enter country',),
          const SizedBox(
            height: 20,
          ),
          Text(
            'E-MAIL',
            style: GoogleFonts.oswald(fontWeight: FontWeight.w500, fontSize: 19, color: const Color(0xff111010)),
          ),
          const SizedBox(
            height: 6,
          ),
          CustomTextfield(controller: emailController,hintText: 'Enter email',),
          const SizedBox(
            height: 20,
          ),
          Text(
            'PHONE NUMBER',
            style: GoogleFonts.oswald(fontWeight: FontWeight.w500, fontSize: 19, color: const Color(0xff111010)),
          ),
          const SizedBox(
            height: 6,
          ),
          CustomTextfield(controller: phoneController,hintText: 'Enter phone number',textInputType: TextInputType.number,),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'GENDER',
                style: GoogleFonts.oswald(fontWeight: FontWeight.w500, fontSize: 19, color: const Color(0xff111010)),
              ),
              const SizedBox(
                width: 13,
              ),
              Expanded(
                  child: InkWell(
                onTap: () {
                  setState(() {
                    selectedGender = 1;
                  });
                },
                child: Ink(
                  height: 36,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      gradient: selectedGender == 1
                          ? const LinearGradient(
                              colors: [
                                Color(0xff007AFF),
                                Color(0xff096DDA),
                              ],
                            )
                          : null,
                      color: selectedGender == 1 ? null : Colors.white,
                      border: Border.all(color: selectedGender == 1 ? Colors.white : const Color(0xffE3E1E1)),
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
                      'Male',
                      style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700, color: selectedGender == 1 ? Colors.white : const Color(0xffBCBCBE)),
                    ),
                  ),
                ),
              )),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: InkWell(
                onTap: () {
                  setState(() {
                    selectedGender = 2;
                  });
                },
                child: Ink(
                  height: 36,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      gradient: selectedGender == 2
                          ? const LinearGradient(
                              colors: [
                                Color(0xff007AFF),
                                Color(0xff096DDA),
                              ],
                            )
                          : null,
                      color: selectedGender == 2 ? null : Colors.white,
                      border: Border.all(color: selectedGender == 1 ? Colors.white : const Color(0xffE3E1E1)),
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
                      'Female',
                      style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700, color: selectedGender == 2 ? Colors.white : const Color(0xffBCBCBE)),
                    ),
                  ),
                ),
              )),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Text(
                'DATE OF BIRTH',
                style: GoogleFonts.oswald(fontWeight: FontWeight.w500, fontSize: 19, color: const Color(0xff111010)),
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: CustomTextfield(
                  controller: dayController,
                  hintText: 'D',
                  textInputType: TextInputType.number,
                  onChanged: (value) {
                    if (value.length == 2) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  inputFormatter: [
                    LengthLimitingTextInputFormatter(2),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: CustomTextfield(
                  controller: monthController,
                  hintText: 'M',
                  textInputType: TextInputType.number,
                  onChanged: (value) {
                    if (value.length == 2) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  inputFormatter: [
                    LengthLimitingTextInputFormatter(2),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                flex: 2,
                child: CustomTextfield(
                  controller: yearController,
                  hintText: 'YYYY',
                  textInputType: TextInputType.number,
                  onChanged: (value) {
                    if (value.length == 4) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  inputFormatter: [
                    LengthLimitingTextInputFormatter(4),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 55,
          ),
          CustomButton(
              text: 'Submit',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Root()));
              }),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    emailController.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    countryController.dispose();
    super.dispose();
  }
}
