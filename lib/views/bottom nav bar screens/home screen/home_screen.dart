import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/custom_appbar.dart';
import 'package:stock_veer/utils/colors.dart';
import 'package:stock_veer/views/bottom%20nav%20bar%20screens/home%20screen/tabs/mutual_funds_view.dart';
import 'package:stock_veer/views/bottom%20nav%20bar%20screens/home%20screen/tabs/profile_view.dart';
import 'package:stock_veer/views/bottom%20nav%20bar%20screens/home%20screen/tabs/space_view.dart';
import 'package:stock_veer/views/bottom%20nav%20bar%20screens/home%20screen/tabs/stock_view.dart';
import 'package:stock_veer/views/bottom%20nav%20bar%20screens/home%20screen/tabs/top_view.dart';

import '../../../custom widgets/custom_stock_tile.dart';
import '../../../providers/allapis.dart';
import '../../../toast.dart';
import '../../stock info/stock_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with WidgetsBindingObserver {
  late TextEditingController searchController;
  bool showSearchResults = false;
  int currentIndex = 1;
  List stocklist = [];
  List searchlist=[];
  // final List<String> _items = [
  //   'Top',
  //   'Stock',
  //   'Space',
  //   'Profile',
  //   'Mutual Funds'
  // ];
  // final List<Widget> _widgets = [
  //   const TopView(),
  //   const StockView(),
  //   const SpaceView(),
  //   const ProfileView(),
  //   const MutualFundsView()
  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
     
      setState(() {});
    });
    searchController = TextEditingController();
    Future.delayed(Duration.zero, () {
      // stocklistc();
    });

    // searchController.addListener(() {
    //   search(searchController.text);
    //   final showSearchResults = searchController.text.isNotEmpty;
    //   setState(() {
    //     this.showSearchResults = showSearchResults;
    //   });
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();    WidgetsBinding.instance.removeObserver(this);
    searchController.dispose();
  }

  search(keyword) async {
    searchlist.clear();
    Timer? debounce;

    int debouncetime = 1;
    if (debounce != null) {
      if (debounce.isActive) debounce.cancel();
    }
    debounce = Timer(Duration(seconds: debouncetime), () async {
      try {
        var res = await ApisProvider().getsearchstocksP(keyword);
        // print(res);
        setState(() {
          
        searchlist.addAll(res);
        });
        print(searchlist);
      } catch (e) {
        showToast(e.toString());
      }
    });
  }

  // stocklistc() async {stocklist.clear();
  //   try {
  //     var res = await ApisProvider().getstockslistP();
  //     // setState(() {
  //       for(int i=0;i<=res.length;i++){
  //         if(res[i]['exchangeShortName']=='NSA'){
  //           stocklist.addAll(res[i]);
  //         }
  //       }
  //       // for (var e in res) {
  //       //   if (e['exchangeShortName'] == 'NSA') {
  //       //     stocklist.add(e);
  //       //   }
  //       //   print(e);
  //       // }
  //     // });

  //     print(res[0]['exchangeShortName']);
  //   } catch (e) {
  //     showToast(e.toString());
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // stocklistc();
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 39,
                width: 317,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25), blurRadius: 2),
                  ],
                ),
                child: TextFormField(
                  onChanged: (value){
                    setState(() {
                      
                     search(value);
                    });
                  },
                  controller: searchController,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xff817979)),
                  cursorColor: Colors.black.withOpacity(0.4),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 4),
                      hintText: 'Search stocks or brands',
                      hintStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xff817979)),
                      prefixIcon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                        size: 15,
                      ),
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              color: Colors.grey,
                              icon: const Icon(
                                Icons.close,
                                size: 15,
                                color: Color(0xff9AA4B2),
                              ),
                              onPressed: () => setState(() {
                                searchController.clear();
                              }),
                            )
                          : const Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 25,
                            ),
                      border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          searchlist.isEmpty&&searchController.text.isNotEmpty?const Expanded(child: Center(child: CircularProgressIndicator(color: kNavyBlue,),)):  searchlist.isNotEmpty&& searchController.text.isNotEmpty
                ? Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 13,
                        ),
                        // Container(
                        //   height: 47,
                        //   width: double.infinity,
                        //   color: const Color(0xfffaf7ec),
                        //   padding: const EdgeInsets.symmetric(
                        //       vertical: 12, horizontal: 20),
                        //   child: ListView.builder(
                        //       scrollDirection: Axis.horizontal,
                        //       shrinkWrap: true,
                        //       physics: const BouncingScrollPhysics(),
                        //       itemCount: _items.length,
                        //       itemBuilder: (context, index) {
                        //         return GestureDetector(
                        //           onTap: () {
                        //             setState(() {
                        //               currentIndex = index;
                        //             });
                        //           },
                        //           child: AnimatedContainer(
                        //             height: 24,
                        //             // width: 79,
                        //             margin: const EdgeInsets.symmetric(
                        //                 horizontal: 6),
                        //             padding: const EdgeInsets.symmetric(
                        //                 horizontal: 15),
                        //             decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(90),
                        //                 color: currentIndex == index
                        //                     ? const Color(0xff0B1344)
                        //                     : Colors.white,
                        //                 border: Border.all(
                        //                     color: currentIndex == index
                        //                         ? Colors.transparent
                        //                         : const Color(0xffE5E1E1))),
                        //             duration: const Duration(milliseconds: 300),
                        //             child: Center(
                        //                 child: Text(
                        //               _items[index],
                        //               style: GoogleFonts.roboto(
                        //                   fontSize:
                        //                       currentIndex == index ? 9 : 8,
                        //                   fontWeight: FontWeight.w400,
                        //                   color: currentIndex == index
                        //                       ? Colors.white
                        //                       : const Color(0xff232121)),
                        //             )),
                        //           ),
                        //         );
                        //       }),
                        // ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child:ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 9,
        );
      },
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: searchlist.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StockDetails(
                companyName:searchlist[index]['name'],
                // stockPrice:_stockPrice[index],
                symbol: searchlist[index]['symbol'],
                // percent:_percentPrice[index],
              )));
            },
            child: CustomStockTile(companyName: searchlist[index]['name'], abbCompanyName: searchlist[index]['symbol'], index: index));
      },
    )
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search examples',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff6A6A6C)),
                        ),
                        SearchRows(text: 'TCS'),
                        const SizedBox(
                          height: 10,
                        ),
                        SearchRows(text: 'Indigo'),
                        const SizedBox(
                          height: 10,
                        ),
                        SearchRows(text: 'Adani Enterprises Ltd'),
                        const SizedBox(
                          height: 10,
                        ),
                        SearchRows(text: 'HDFC Bank'),
                        const SizedBox(
                          height: 10,
                        ),
                        SearchRows(text: 'Parachute'),
                      ],
                    ),
                  )
          ],
        ));
  }
}

class SearchRows extends StatelessWidget {
  String text;
  SearchRows({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/diagonalArrow.png',
          height: 8,
          width: 8,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: const Color(0xff38393C)),
        )
      ],
    );
  }
}
