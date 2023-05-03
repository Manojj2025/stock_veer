import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/custom_appbar.dart';
import 'package:stock_veer/utils/app_basestyles.dart';
import 'package:stock_veer/utils/app_colors.dart';
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

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late TextEditingController searchController;
  bool showSearchResults = false;
  int currentIndex = 1;
  List stocklist = [];
  List searchlist = [];
  List topgainer = [];
  List toploser = [];

  List topactive = [];
  bool loading = false;
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
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {});
    });
    searchController = TextEditingController();
    Future.delayed(Duration.zero, () {
      getstocktopgainerC();

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
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
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

  getstocktopgainerC() async {
    topgainer.clear();
    // profiledata.clear();
    setState(() {
      loading = true;
    });
    try {
      var res = await ApisProvider().getstocktopgainerP();
      var res2 = await ApisProvider().getstocktoploserP();

      var res3 = await ApisProvider().getstockactiveP();
      //  print(res['profile']['price'].toString());
      // print(res2);
      setState(() {
        // List data = [];
        // data.addAll(res);
        // print(data);
        topactive.addAll(res3);
        toploser.addAll(res2);
        topgainer.addAll(res);
      });
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // stocklistc();
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                  onChanged: (value) {
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
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 15),
                      hintText: 'Search stocks or brands',
                      hintStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xff817979)),
                      // prefixIcon: const Icon(
                      //   Icons.arrow_back_ios_new_outlined,
                      //   color: Colors.black,
                      //   size: 15,
                      // ),
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
            searchlist.isEmpty && searchController.text.isNotEmpty
                ? const Expanded(
                    child: Center(
                    child: CircularProgressIndicator(
                      color: kNavyBlue,
                    ),
                  ))
                : searchlist.isNotEmpty && searchController.text.isNotEmpty
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
                                  child: ListView.separated(
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
                                          onTap: () {
                                            print(searchlist[index]);
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        StockDetails(
                                                          companyName:
                                                              searchlist[index]
                                                                  ['name'],
                                                          // stockPrice:_stockPrice[index],
                                                          symbol:
                                                              searchlist[index]
                                                                  ['symbol'],
                                                          // percent:_percentPrice[index],
                                                        )));
                                          },
                                          child: CustomStockTile(
                                              companyName: searchlist[index]
                                                  ['name'],
                                              abbCompanyName: searchlist[index]
                                                  ['symbol'],
                                              index: index));
                                    },
                                  )),
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: kNavyBlue,
                                  ),
                                )
                              : SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Top Gainers',
                                              style: BaseStyles.blacklarge16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.24,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: topgainer.length,
                                            itemBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.30,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Card(
                                                          elevation: 3,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                heightSpace10,
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .analytics,
                                                                      color: Colors
                                                                          .green,
                                                                      size: 20,
                                                                    ),
                                                                    widthSpace5,
                                                                    Text(
                                                                      "${topgainer[index]['symbol']}",
                                                                      style: BaseStyles
                                                                          .blackMedium18,
                                                                    ),
                                                                  ],
                                                                ),
                                                                heightSpace5,
                                                                Text(
                                                                  "${topgainer[index]['name']}",
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: BaseStyles
                                                                      .blackMedium15,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                ),
                                                                heightSpace5,
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Price: ",
                                                                      style: BaseStyles
                                                                          .blacNormal15,
                                                                    ),
                                                                    Text(
                                                                      topgainer[index]['price'].toString().length <
                                                                              6
                                                                          ? "${topgainer[index]['price']}"
                                                                          : topgainer[index]['price'].toString().substring(
                                                                              0,
                                                                              6),
                                                                      style: BaseStyles
                                                                          .blackMedium16,
                                                                    ),
                                                                  ],
                                                                ),
                                                                heightSpace5,
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "%Changes: ",
                                                                      style: BaseStyles
                                                                          .blacNormal15,
                                                                    ),
                                                                    Text(
                                                                      topgainer[index]['changesPercentage'].toString().length <
                                                                              6
                                                                          ? "${topgainer[index]['changesPercentage']}"
                                                                          : topgainer[index]['changesPercentage'].toString().substring(
                                                                              0,
                                                                              6),
                                                                      style: BaseStyles
                                                                          .blackMedium16,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "change: ",
                                                                      style: BaseStyles
                                                                          .blacNormal15,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .arrow_drop_up_outlined,
                                                                          color:
                                                                              AppColors.primaryColor2,
                                                                          size:
                                                                              30,
                                                                        ),
                                                                        Text(
                                                                          "+ ${topgainer[index]['change']}%",
                                                                          style:
                                                                              BaseStyles.greenMedium14,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                // heightSpace5,
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                      ),
                                      heightSpace20,
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Top Losers',
                                              style: BaseStyles.blacklarge16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.24,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: toploser.length,
                                            itemBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.30,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Card(
                                                          elevation: 3,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                heightSpace10,
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .analytics,
                                                                      color: Colors
                                                                          .red,
                                                                      size: 20,
                                                                    ),
                                                                    widthSpace5,
                                                                    Text(
                                                                      "${toploser[index]['symbol']}",
                                                                      style: BaseStyles
                                                                          .blackMedium18,
                                                                    ),
                                                                  ],
                                                                ),
                                                                heightSpace5,
                                                                Text(
                                                                  "${toploser[index]['name']}",
                                                                  style: BaseStyles
                                                                      .blackMedium15,
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                                heightSpace5,
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Price: ",
                                                                      style: BaseStyles
                                                                          .blacNormal15,
                                                                    ),
                                                                    Text(
                                                                      toploser[index]['price'].toString().length <
                                                                              6
                                                                          ? "${toploser[index]['price']}"
                                                                          : toploser[index]['price'].toString().substring(
                                                                              0,
                                                                              6),
                                                                      style: BaseStyles
                                                                          .blackMedium16,
                                                                    ),
                                                                  ],
                                                                ),
                                                                heightSpace5,
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "%Changes: ",
                                                                      style: BaseStyles
                                                                          .blacNormal15,
                                                                    ),
                                                                    Text(
                                                                      toploser[index]['changesPercentage'].toString().length <
                                                                              6
                                                                          ? "${toploser[index]['changesPercentage']}"
                                                                          : toploser[index]['changesPercentage'].toString().substring(
                                                                              0,
                                                                              6),
                                                                      style: BaseStyles
                                                                          .blackMedium16,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "change: ",
                                                                      style: BaseStyles
                                                                          .blacNormal15,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .arrow_drop_up_outlined,
                                                                          color:
                                                                              Colors.red,
                                                                          size:
                                                                              30,
                                                                        ),
                                                                        Text(
                                                                          "${toploser[index]['change']}%",
                                                                          style:
                                                                              BaseStyles.redMedium14,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                // heightSpace5,
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                      ),
                                      heightSpace20,
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Most Active Stock',
                                              style: BaseStyles.blacklarge16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.24,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: topactive.length,
                                            itemBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.30,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Card(
                                                          elevation: 3,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                heightSpace10,
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .analytics,
                                                                      color:
                                                                          kNavyBlue,
                                                                      size: 20,
                                                                    ),
                                                                    widthSpace5,
                                                                    Text(
                                                                      "${topactive[index]['symbol']}",
                                                                      style: BaseStyles
                                                                          .blackMedium18,
                                                                    ),
                                                                  ],
                                                                ),
                                                                heightSpace5,
                                                                Text(
                                                                  "${topactive[index]['name']}",
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: BaseStyles
                                                                      .blackMedium15,
                                                                ),
                                                                heightSpace5,
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Price: ",
                                                                      style: BaseStyles
                                                                          .blacNormal15,
                                                                    ),
                                                                    Text(
                                                                      topactive[index]['price'].toString().length <
                                                                              6
                                                                          ? "${topactive[index]['price']}"
                                                                          : topactive[index]['price'].toString().substring(
                                                                              0,
                                                                              6),
                                                                      style: BaseStyles
                                                                          .blackMedium16,
                                                                    ),
                                                                  ],
                                                                ),
                                                                heightSpace5,
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "%Changes: ",
                                                                      style: BaseStyles
                                                                          .blacNormal15,
                                                                    ),
                                                                    Text(
                                                                      topactive[index]['changesPercentage'].toString().length <
                                                                              6
                                                                          ? "${topactive[index]['changesPercentage']}"
                                                                          : topactive[index]['changesPercentage'].toString().substring(
                                                                              0,
                                                                              6),
                                                                      style: BaseStyles
                                                                          .blackMedium16,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "change: ",
                                                                      style: BaseStyles
                                                                          .blacNormal15,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .arrow_drop_up_outlined,
                                                                          color:
                                                                              Colors.red,
                                                                          size:
                                                                              30,
                                                                        ),
                                                                        Text(
                                                                          "${topactive[index]['change']}%",
                                                                          style:
                                                                              BaseStyles.redMedium14,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                // heightSpace5,
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                      ),
                                      heightSpace10,
                                    ],
                                  ),
                                ),
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
