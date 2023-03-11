import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  bool _tileOneExpanded = false, _tileTwoExpanded = false, _tileThreeExpanded = false, _tileFourExpanded = false, _tileFiveExpanded = false,_tileSixExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              size: 24,
            )),
        title: Text(
          'FAQ',
          style: GoogleFonts.mulish(fontWeight: FontWeight.w500, fontSize: 24, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient:!_tileOneExpanded? LinearGradient(colors: [Color(0xff040717),Color(0xff010938).withOpacity(0.81)]):null
            ),
            child: ExpansionTile(
              trailing: const SizedBox(),
              title: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: _tileOneExpanded ?  Colors.black:Colors.white),
              ),
              leading: Icon(_tileOneExpanded?Icons.remove_circle:Icons.add_circle,size: 20,color: _tileOneExpanded?Colors.black:Colors.white,),
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 4,spreadRadius: 0),
                      ],
                      color: Colors.white
                  ),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: const Color(0xff6F6F6F)),
                  ),
                )
              ],
              onExpansionChanged: (bool expanded){
                setState(() {
                  _tileOneExpanded = expanded;
                });
              },

            ),
          ),
          const SizedBox(height: 33,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient:!_tileTwoExpanded? LinearGradient(colors: [Color(0xff040717),Color(0xff010938).withOpacity(0.81)]):null
            ),
            child: ExpansionTile(
              trailing: const SizedBox(),
              title: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: _tileTwoExpanded ?  Colors.black:Colors.white),
              ),
              leading: Icon(_tileTwoExpanded?Icons.remove_circle:Icons.add_circle,size: 20,color: _tileTwoExpanded?Colors.black:Colors.white,),
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 4,spreadRadius: 0),
                      ],
                      color: Colors.white
                  ),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: const Color(0xff6F6F6F)),
                  ),
                )
              ],
              onExpansionChanged: (bool expanded){
                setState(() {
                  _tileTwoExpanded = expanded;
                });
              },

            ),
          ),
          const SizedBox(height: 33,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient:!_tileThreeExpanded? LinearGradient(colors: [Color(0xff040717),Color(0xff010938).withOpacity(0.81)]):null
            ),
            child: ExpansionTile(
              trailing: const SizedBox(),
              title: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: _tileThreeExpanded ?  Colors.black:Colors.white),
              ),
              leading: Icon(_tileThreeExpanded?Icons.remove_circle:Icons.add_circle,size: 20,color: _tileThreeExpanded?Colors.black:Colors.white,),
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 4,spreadRadius: 0),
                      ],
                      color: Colors.white
                  ),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: const Color(0xff6F6F6F)),
                  ),
                )
              ],
              onExpansionChanged: (bool expanded){
                setState(() {
                  _tileThreeExpanded = expanded;
                });
              },

            ),
          ),
          const SizedBox(height: 33,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient:!_tileFourExpanded? LinearGradient(colors: [Color(0xff040717),Color(0xff010938).withOpacity(0.81)]):null
            ),
            child: ExpansionTile(
              trailing: const SizedBox(),
              title: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: _tileFourExpanded ?  Colors.black:Colors.white),
              ),
              leading: Icon(_tileFourExpanded?Icons.remove_circle:Icons.add_circle,size: 20,color: _tileFourExpanded?Colors.black:Colors.white,),
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 4,spreadRadius: 0),
                      ],
                      color: Colors.white
                  ),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: const Color(0xff6F6F6F)),
                  ),
                )
              ],
              onExpansionChanged: (bool expanded){
                setState(() {
                  _tileFourExpanded = expanded;
                });
              },

            ),
          ),
          const SizedBox(height: 33,),

          // const Divider(color: Color(0xffC3C3C3),thickness: 1,),
          // ExpansionTile(
          //   title: Text(
          //     'Typesetting industry?',
          //     maxLines: 1,
          //     overflow: TextOverflow.ellipsis,
          //     style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: _tileTwoExpanded ? kOrangeColor : Colors.black),
          //   ),
          //   trailing: Icon(_tileTwoExpanded?Icons.remove:Icons.add,size: 35,color: _tileTwoExpanded?const Color(0xff6F6F6F):kOrangeColor,),
          //   children: [
          //     Text(
          //       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
          //       style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: const Color(0xff6F6F6F)),
          //     )
          //   ],
          //   onExpansionChanged: (bool expanded){
          //     setState(() {
          //       _tileTwoExpanded = expanded;
          //     });
          //   },
          // ),
          // const Divider(color: Color(0xffC3C3C3),thickness: 1,),
          // ExpansionTile(
          //   title: Text(
          //     "Industry's standard dummy text ever?",
          //     maxLines: 1,
          //     overflow: TextOverflow.ellipsis,
          //     style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: _tileThreeExpanded ? kOrangeColor : Colors.black),
          //   ),
          //   trailing: Icon(_tileThreeExpanded?Icons.remove:Icons.add,size: 35,color: _tileThreeExpanded?const Color(0xff6F6F6F):kOrangeColor,),
          //   children: [
          //     Text(
          //       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
          //       style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: const Color(0xff6F6F6F)),
          //     )
          //   ],
          //   onExpansionChanged: (bool expanded){
          //     setState(() {
          //       _tileThreeExpanded = expanded;
          //     });
          //   },
          // ),
          // const Divider(color: Color(0xffC3C3C3),thickness: 1,),
          // ExpansionTile(
          //   title: Text(
          //     'Typesetting industry?',
          //     maxLines: 1,
          //     overflow: TextOverflow.ellipsis,
          //     style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: _tileFourExpanded ? kOrangeColor : Colors.black),
          //   ),
          //   trailing: Icon(_tileFourExpanded?Icons.remove:Icons.add,size: 35,color: _tileFourExpanded?const Color(0xff6F6F6F):kOrangeColor,),
          //   children: [
          //     Text(
          //       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
          //       style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: const Color(0xff6F6F6F)),
          //     )
          //   ],
          //   onExpansionChanged: (bool expanded){
          //     setState(() {
          //       _tileFourExpanded = expanded;
          //     });
          //   },
          // ),
          // const Divider(color: Color(0xffC3C3C3),thickness: 1,),
          // ExpansionTile(
          //   title: Text(
          //     'Text of the printing and type?',
          //     maxLines: 1,
          //     overflow: TextOverflow.ellipsis,
          //     style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: _tileFiveExpanded ? kOrangeColor : Colors.black),
          //   ),
          //   trailing: Icon(_tileFiveExpanded?Icons.remove:Icons.add,size: 35,color: _tileFiveExpanded?const Color(0xff6F6F6F):kOrangeColor,),
          //   children: [
          //     Text(
          //       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
          //       style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: const Color(0xff6F6F6F)),
          //     )
          //   ],
          //   onExpansionChanged: (bool expanded){
          //     setState(() {
          //       _tileFiveExpanded = expanded;
          //     });
          //   },
          // ),
          // const Divider(color: Color(0xffC3C3C3),thickness: 1,),
          // ExpansionTile(
          //   title: Text(
          //     'Ipsum is simply dummy text?',
          //     maxLines: 1,
          //     overflow: TextOverflow.ellipsis,
          //     style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: _tileSixExpanded ? kOrangeColor : Colors.black),
          //   ),
          //   trailing: Icon(_tileSixExpanded?Icons.remove:Icons.add,size: 35,color: _tileSixExpanded?const Color(0xff6F6F6F):kOrangeColor,),
          //   children: [
          //     Text(
          //       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
          //       style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: const Color(0xff6F6F6F)),
          //     )
          //   ],
          //   onExpansionChanged: (bool expanded){
          //     setState(() {
          //       _tileSixExpanded = expanded;
          //     });
          //   },
          // ),
          // const Divider(color: Color(0xffC3C3C3),thickness: 1,),
        ],
      ),
    );
  }
}
