import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:stock_veer/custom%20widgets/bullet_text.dart';
import 'package:stock_veer/custom%20widgets/checklist_tile.dart';
import 'package:stock_veer/custom%20widgets/pros_cons_tile.dart';
import 'package:stock_veer/models/historicalstock.dart';
import 'package:stock_veer/utils/app_basestyles.dart';
import 'package:stock_veer/utils/colors.dart';
import 'package:stock_veer/views/contact_us.dart';
import 'package:stock_veer/views/stock%20info/financial_statement.dart';
import 'package:stock_veer/views/stock%20info/forecast_and_ratings.dart';
import 'package:stock_veer/views/stock%20info/tabs/balance_sheet_view.dart';
import 'package:stock_veer/views/stock%20info/tabs/cash_flow_view.dart';
import 'package:stock_veer/views/stock%20info/tabs/income_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../providers/allapis.dart';
import '../../toast.dart';
import '../../utils/custom_decoration.dart';
import '../../utils/values.dart';
import '../newsdetails.dart';

class StockDetails extends StatefulWidget {
  final String companyName;
  final String symbol;
  StockDetails({Key? key, required this.companyName, required this.symbol})
      : super(key: key);

  @override
  State<StockDetails> createState() => _StockDetailsState();
}

class _StockDetailsState extends State<StockDetails> {
  Map alldata = {};
  bool loading2 = false;
  bool loading = false;
  String d_s = 'dividend';
  double matrixmrkcap = 0.0;
  double mrkcap = 0.0;

  double mrkcap2 = 0.0;
  List name = [
    'Overview',
    'Future & Options',
    'My Metrics',
    'Peers',
    // 'Fundamentals',
    'Technicals',
    'Shareholding',
    'Reports',
    'Deals',
    'News',
    'Documents',
    'Corporate Actions'
  ];
  String selectname = 'Overview';
  late TrackballBehavior trackballBehavior;
  List<Historical> allstock = [];
  List newsdata = [];

  List<Historical> alltechnical = [];
  List shareholddate = [];
  List shareholdlist = [];
  String selectshareholddate = '';
  List split = [];
  String selectpeer = '';
  List dividend = [];
  Map materixdata = {};
  List peers = [];
  List profiledata = [];
  List alldays = [
    '1D',
    '1W',
    '1M',
    '3M',
    '6M',
    '1Y',
  ];
  List allmin = [
    '1min',
    '5min',
    '15min',
    '30min',
    '1hour',
    '4hour',
  ];

  List alldays2 = [
    '1day',
    '1week',
    '1month',
    '3month',
    '6month',
    '1year',
  ];
  String selectmin = '1min';
  String selectday = '1day';
  // RxList<Results> chartData = RxList<Results>([]);
  //  List<Results> chartData=List;
  late ZoomPanBehavior zoomPanBehavior;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    zoomPanBehavior = ZoomPanBehavior(
        enableDoubleTapZooming: true,
        enablePinching: true,
        // Enables the selection zooming
        enableSelectionZooming: true);
    // trackballBehavior = TrackballBehavior(
    //     enable: true, activationMode: ActivationMode.singleTap);

    Future.delayed(Duration.zero, () {
      getstocksdetaillistC();
      getgraphstocksdetailC();
      // getpeersC();
    });
  }

  getpeersC() async {
    peers.clear();
    // profiledata.clear();
    setState(() {
      loading = true;
    });
    try {
      var res = await ApisProvider().getpeersP(widget.symbol);
      //  print(res['profile']['price'].toString());
      // print(res2);
      setState(() {
        List data = [];
        data.addAll(res);
        peers.addAll(data[0]['peersList']);
        // print(peers[0].toString());
        if (peers.isNotEmpty) {
          selectpeer = peers[0];
          getcompanydetaillistC(selectpeer.toString());
        }
      });
      // print(peers[0]['peersList'][3].toString() + 'mmm');
      // // for (var e in peers[0]['peersList']) {
      // //   var res = await ApisProvider().getcompanydetaillistP(e.toString());
      // //   Map data = {};
      // //   data.addAll(res[0]);
      // //   profiledata.add(data);
      // // }
      // // for (var i = 0; i < peers[0]['peersList'].length; i++) {
      //   var res = await ApisProvider()
      //       .getcompanydetaillistP(peers[0]['peersList'][i].toString());
      //   Map data = {};
      //   // data.clear();
      //   data.addAll(res[i]);
      //   print(peers[0]['peersList'][i].toString());
      //   print(data.toString() + 'mj');
      //   profiledata.add(data);
      // // }
      // print(profiledata);
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
    setState(() {
      loading = false;
    });
  }

  getcompanydetaillistC(name) async {
    profiledata.clear();
    // setState(() {
    //   loading = true;
    // });
    try {
      var res = await ApisProvider().getcompanydetaillistP(name);
      //  print(res['profile']['price'].toString());
      // print(res2);
      setState(() {
        profiledata.addAll(res);
        if (profiledata[0]['mktCap'] != null) {
          var a = int.parse(profiledata[0]['mktCap'].toString()) / 100000000;
          mrkcap2 = double.parse(a.toStringAsFixed(2));
        }
      });
      print(profiledata);
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
    // setState(() {
    //   loading = false;
    // });
  }

  getgraphtechnicalssdetailC() async {
    alltechnical.clear();

    try {
      var res2 = await ApisProvider()
          .getgraphtechnicaldetailP(widget.symbol.toString(), selectmin);
      //  print(res['profile']['price'].toString());
      // print(res2);
      setState(() {
        List<Historical> finalres =
            (res2 as List).map((item) => Historical.fromJson(item)).toList();
        print(finalres);
        alltechnical.addAll(finalres);
      });
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
    // setState(() {
    //   loading = false;
    // });
  }

  getgraphstocksdetailC() async {
 
    allstock.clear();

    try {
      var res2 = await ApisProvider()
          .getgraphstocksdetailP(widget.symbol.toString(), selectday);
      //  print(res['profile']['price'].toString());
      // print(res2);
         if (!mounted) {
        return;
      }
      setState(() {
        List<Historical> finalres =
            (res2 as List).map((item) => Historical.fromJson(item)).toList();
        print(finalres);
        allstock.addAll(finalres);
      });
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
    // setState(() {
    //   loading = false;
    // });
  }

  getshareholderdateC() async {
    setState(() {
      loading = true;
    });
    shareholddate.clear();
    try {
      var res = await ApisProvider().getshareholdersdateP();
      setState(() {
        shareholddate.addAll(res);
        selectshareholddate = shareholddate[0]['date'].toString();
      });
      print(selectshareholddate.toString() + 'manoj');
      getshareholdersdatelistC(shareholddate[0]['date'].toString());
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
    setState(() {
      loading = false;
    });
  }

  getshareholdersdatelistC(selectshareholddate) async {
    print(selectshareholddate);
    setState(() {
      loading2 = true;
    });
    shareholdlist.clear();
    try {
      var res2 = await ApisProvider().getshareholdersdatelistP(
          selectshareholddate, widget.symbol.toString());
      setState(() {
        List data = [];
        data.addAll(res2);
        data.sort((b, a) => a['ownership'].compareTo(b['ownership']));
        shareholdlist.addAll(data);
        print(shareholdlist);
        // selectshareholddate = shareholddate[0]['date'].toString();
      });
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
    setState(() {
      loading2 = false;
    });
  }

  getstocksdetaillistC() async {
   
    setState(() {
      loading = true;
    });
    alldata.clear();
    try {
      var res =
          await ApisProvider().getstocksdetaillistP(widget.symbol.toString());
      if (!mounted) {
        return;
      }
      setState(() {
        alldata.addAll(res);
        if (alldata['profile']['mktCap'] != null) {
          var a =
              int.parse(alldata['profile']['mktCap'].toString()) / 100000000;
          mrkcap = double.parse(a.toStringAsFixed(2));
        }
      });
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
    setState(() {
      loading = false;
    });
  }

  getmaterixC() async {
    materixdata.clear();
    setState(() {
      loading = true;
    });
    try {
      var res2 = await ApisProvider().getmaterixP(widget.symbol.toString());
      //  print(res['profile']['price'].toString());
      // print(res2);
      setState(() {
        materixdata.addAll(res2[0]);
        if (materixdata['marketCapTTM'] != null) {
          var a = int.parse(materixdata['marketCapTTM'].toString()) / 100000000;
          matrixmrkcap = double.parse(a.toStringAsFixed(2));
        }
      });
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
    setState(() {
      loading = false;
    });
  }

  getnewsC() async {
    newsdata.clear();
    setState(() {
      loading = true;
    });
    try {
      var res2 = await ApisProvider().getstocknewsP();
      //  print(res['profile']['price'].toString());
      // print(res2);
      setState(() {
        newsdata.addAll(res2);
      });
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
    setState(() {
      loading = false;
    });
  }

  getdevidendsplitC() async {
    dividend.clear();
    split.clear();
    setState(() {
      loading = true;
    });
    try {
      var res = await ApisProvider().getdevidendP();

      var res2 = await ApisProvider().getsplitP();
      //  print(res['profile']['price'].toString());
      // print(res2);
      setState(() {
        dividend.addAll(res['historical']);
        split.addAll(res2['historical']);
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
    print(widget.symbol.toString());
    print(peers);
    List<String> _pros = [
      'Company is almost debt free.',
      'Company has a good return on equity(ROE) track record: 3 Years ROE 40.0%',
      'Company has been maintaining a healthy dividend payout of 56.4%',
      'Company’s working capital requirement  have reduced from 54.9 days to 36.0 days'
    ];

    List<String> _cons = [
      'Stock is trading at 12.9 times its book value',
      'The Company has delivered a poor  sales growth of 10.2% over past five years.'
    ];
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              height: 26,
              width: 40,
              decoration: BoxDecoration(
                  color: const Color(0xff0B1344),
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/stockveer_Splash.png',
                      ))),
            ),
            title: Text(
              'StockVeer',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: const Color(0xff030A39)),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/icons/searchIcon.png',
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Divider(
                height: 0.5,
                color: kNavyBlue,
                thickness: 0.5,
              ),
              // heightSpace5,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: name.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectname = name[index];
                                if (index == 2) {
                                  getmaterixC();
                                } else if (index == 8) {
                                  getnewsC();
                                } else if (index == 10) {
                                  getdevidendsplitC();
                                } else if (index == 5) {
                                  getshareholderdateC();
                                } else if (index == 4) {
                                  getgraphtechnicalssdetailC();
                                } else if (index == 3) {
                                  getpeersC();
                                }
                              });
                            },
                            child: Container(
                              // height: 35,
                              width: MediaQuery.of(context).size.width * 0.35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  color: selectname == name[index]
                                      ? kNavyBlue
                                      : Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  name[index],
                                  style: TextStyle(
                                      color: selectname == name[index]
                                          ? Colors.white
                                          : kNavyBlue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      );
                    }),
              ),
              // heightSpace5,
              Divider(
                height: 0.5,
                color: kNavyBlue,
                thickness: 0.5,
              ),
              loading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: kNavyBlue,
                    ))
                  : selectname == 'Overview'
                      ? Expanded(
                          child: ListView(
                            children: [
                              heightSpace10,
                              // const Divider(
                              //   color: Color(0xffC7B9B9),
                              //   thickness: 1,
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              Text(
                                widget.companyName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff1F1D1D),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Row(
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    alldata.isEmpty
                                        ? ''
                                        : "\u{20B9} ${alldata['profile']['price'].toString()}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff1F1D1D)),
                                  ),
                                  // alldata['profile']['image']==null?Container():  Image.network(alldata['profile']['image'].toString(),height: 50,width: 60,),
                                ],
                              ),
                              //     const SizedBox(
                              //       width: 10,
                              //     ),
                              //     percent > 0
                              //         ? const Icon(
                              //             Icons.arrow_upward_sharp,
                              //             color: k1BEDColor,
                              //             size: 18,
                              //           )
                              //         : const Icon(
                              //             Icons.arrow_downward_sharp,
                              //             size: 18,
                              //             color: kC213Color,
                              //           ),
                              //     const SizedBox(
                              //       width: 5,
                              //     ),
                              //     Text(
                              //       "$percent%",
                              //       style: GoogleFonts.poppins(
                              //         fontSize: 20,
                              //         fontWeight: FontWeight.w600,
                              //         color: percent > 0 ? k1BEDColor : kC213Color,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                'ABOUT',
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff1F1D1D)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              alldata.isNotEmpty
                                  ? ReadMoreText(
                                      alldata['profile']['description']
                                          .toString(),
                                      trimLines: 8,
                                      colorClickableText: Colors.pink,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: 'Show more',
                                      trimExpandedText: 'Show less',
                                      moreStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Container(),
                              // Text(
                              //  alldata['profile']['description'].toString(),   maxLines: 10,
                              //   overflow: TextOverflow.ellipsis,
                              //   style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 12, color: const Color(0xff524F4F)),
                              // ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Overview',
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff1F1D1D)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Sector',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: kNavyBlue,
                                        ),
                                      ),
                                      Text(
                                        alldata.isEmpty
                                            ? ''
                                            : alldata['profile']['sector']
                                                .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff1F1D1D),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Industry',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: kNavyBlue,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.70,
                                        child: Text(
                                          alldata.isEmpty
                                              ? ''
                                              : alldata['profile']['industry']
                                                  .toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff1F1D1D),
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Market Cap.',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: kNavyBlue,
                                        ),
                                      ),
                                      Text(
                                        alldata.isEmpty
                                            ? ''
                                            : "${mrkcap.toString()} Cr.",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff1F1D1D),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              // Text(
                              //   'KEY POINTS',
                              //   style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 12, color: const Color(0xff1F1D1D)),
                              // ),
                              // const SizedBox(
                              //   height: 2,
                              // ),
                              // Text(
                              //  alldata.isEmpty?"":  alldata['profile']['ceo'].toString(),
                              //   style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 12, color: const Color(0xff1F1D1D)),
                              // ),
                              const SizedBox(
                                height: 15,
                              ),
                              // Row(
                              //   children: [
                              //     Container(
                              //       height: 39,
                              //       width: 195,
                              //       decoration: BoxDecoration(
                              //         borderRadius:
                              //             BorderRadius.circular(10),
                              //         border: Border.all(
                              //           color: const Color(0xffF5f3f3),
                              //         ),
                              //       ),
                              //       child: TabBar(
                              //           labelColor: const Color(0xff524F4F),
                              //           unselectedLabelColor:
                              //               const Color(0xff524F4F),
                              //           labelStyle: GoogleFonts.roboto(
                              //               fontSize: 12,
                              //               fontWeight: FontWeight.w400),
                              //           unselectedLabelStyle:
                              //               GoogleFonts.roboto(
                              //                   fontSize: 12,
                              //                   fontWeight:
                              //                       FontWeight.w400),
                              //           indicator: BoxDecoration(
                              //             borderRadius:
                              //                 BorderRadius.circular(10),
                              //             color: const Color(0xffedeafd),
                              //           ),
                              //           tabs: [
                              //             const Text('Price'),
                              //             const Text('PE Ratio'),
                              //             Row(
                              //               mainAxisSize: MainAxisSize.min,
                              //               children: const [
                              //                 Text('More'),
                              //                 Expanded(
                              //                     child: Icon(
                              //                   Icons.arrow_drop_down,
                              //                   size: 18,
                              //                 ))
                              //               ],
                              //             )
                              //           ]),
                              //     ),
                              //     const SizedBox(
                              //       width: 15,
                              //     ),
                              //     Container(
                              //       height: 40,
                              //       width: 40,
                              //       decoration: BoxDecoration(
                              //         image: const DecorationImage(
                              //             image: AssetImage(
                              //                 'assets/icons/bellIcon.png')),
                              //         color: const Color(0xfffcfcfc),
                              //         borderRadius:
                              //             BorderRadius.circular(10),
                              //         border: Border.all(
                              //           color: const Color(0xfff5f3f3),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // const SizedBox(
                              //   height: 15,
                              // ),
                              // Image.asset('assets/images/stockDetailsGraph.png',height:310,width: 310,fit: BoxFit.fill,),
                              SizedBox(
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  child: Container(
                                      child: SfCartesianChart(
                                          enableAxisAnimation: true,
                                          trackballBehavior: TrackballBehavior(
                                              enable: true,
                                              activationMode:
                                                  ActivationMode.singleTap),
                                          // Initialize category axis
                                          primaryXAxis: CategoryAxis(),
                                          series: <
                                              CandleSeries<Historical, String>>[
                                        CandleSeries<Historical, String>(
                                            // Bind data source
                                            dataSource: allstock,
                                            xValueMapper: (Historical data, _) {
                                              // print(controller.loading.value);
                                              final DateTime date1 =
                                                  DateTime.parse(
                                                      data.date.toString());
                                              String date2 =
                                                  DateFormat("yyyy-MM-dd")
                                                      .format(date1);
                                              // DateTime date3 =
                                              //     DateTime.parse(date2);
                                              // // print(date3);
                                              return date2;
                                            },
                                            highValueMapper:
                                                (Historical data, _) =>
                                                    data.high,
                                            lowValueMapper:
                                                (Historical data, _) =>
                                                    data.low,
                                            openValueMapper:
                                                (Historical data, _) =>
                                                    data.open,
                                            closeValueMapper:
                                                (Historical data, _) =>
                                                    data.close)
                                        // yValueMapper:
                                        //     (Historical sales, _) =>
                                        //         sales.high)
                                      ]))),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                  alldays.length,
                                  (index) => InkWell(
                                    onTap: () {
                                      if (selectday == alldays2[index]) {
                                      } else {
                                        setState(() {
                                          selectday = alldays2[index];
                                        });
                                        getgraphstocksdetailC();
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: selectday != alldays2[index]
                                              ? Colors.white
                                              : kNavyBlue.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          alldays[index],
                                          style: TextStyle(
                                              color: kNavyBlue,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 30,
                              ),
                              ProsConsTile(
                                  listItems: _pros, text: 'PROS', isPro: true),
                              const SizedBox(
                                height: 16,
                              ),
                              ProsConsTile(
                                listItems: _cons,
                                text: 'CONS',
                                isPro: false,
                              ),
                              const SizedBox(
                                height: 21,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Investment Checklist',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Basic',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.underline,
                                            color: const Color(0xff007AFF)),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Pro',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: const Color(0xff007AFF)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                              const Divider(
                                color: Color(0xffDDCFCF),
                                thickness: 1,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CheckListTile(
                                  isRed: true,
                                  title: 'Intrinsic Value',
                                  subtitle:
                                      'Current price is more than the\nintrinsic value'),
                              CheckListTile(
                                  isRed: false,
                                  title: 'ROE vs FD rates',
                                  subtitle:
                                      'Stock has been generated better retrun on\nequity than bank FD'),
                              CheckListTile(
                                  isRed: false,
                                  title: 'Dividend Returns',
                                  subtitle:
                                      'Stock offer good dividend retruns'),
                              CheckListTile(
                                  isRed: false,
                                  title: 'Entry Point',
                                  subtitle:
                                      'Good time consider,as stock is not overbought\nzone'),
                              CheckListTile(
                                  isRed: false,
                                  title: 'No Red Flags',
                                  subtitle:
                                      'Stock not in ASM/GSM lists and not a lot of\npromoter hold in pledged'),
                              const SizedBox(
                                height: 23,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          ForecastAndRatings()));
                                },
                                child: Container(
                                  height: 35,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 2),
                                    ],
                                    color: const Color(0xffEFF3FC),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Stockveer! Unlock deeper Insight',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff007AFF)),
                                  )),
                                ),
                              ),
                              const SizedBox(
                                height: 53,
                              ),
                            ],
                          ),
                        )
                      : selectname == 'Future & Options'
                          ? Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Consolidated',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: k1013Color),
                                            ),
                                            Text(
                                              'Financial Statements',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: k1013Color),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.share,
                                                size: 12,
                                                color: Color(0xff1E1E23),
                                              ),
                                            ),
                                            Text(
                                              '3.2k',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                  color:
                                                      const Color(0xffB2B3C0)),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                blurRadius: 2),
                                          ]),
                                      child: TabBar(
                                        labelColor: Colors.white,
                                        unselectedLabelColor: Colors.black,
                                        labelStyle: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        unselectedLabelStyle:
                                            GoogleFonts.poppins(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500),
                                        indicator: BoxDecoration(
                                          gradient: kBlueGradient,
                                        ),
                                        tabs: const [
                                          Text('Income'),
                                          Text('Balance Sheet'),
                                          Text('Cash Flow'),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Expanded(
                                        child: TabBarView(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            children: [
                                          IncomeView(symbol: widget.symbol),
                                          BalanceSheetView(
                                              symbol: widget.symbol),
                                          CashFlowView(symbol: widget.symbol),
                                        ]))
                                  ],
                                ),
                              ),
                            )
                          : selectname == 'Technicals'
                              ? Center(
                                  child: Column(
                                    children: [
                                      heightSpace30,
                                      SizedBox(
                                          height: 300,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Container(
                                              child: SfCartesianChart(
                                                  enableAxisAnimation: true,
                                                  trackballBehavior:
                                                      TrackballBehavior(
                                                          enable: true,
                                                          activationMode:
                                                              ActivationMode
                                                                  .singleTap),
                                                  // Initialize category axis
                                                  primaryXAxis: CategoryAxis(),
                                                  series: <
                                                      CandleSeries<Historical,
                                                          String>>[
                                                CandleSeries<Historical,
                                                        String>(
                                                    // Bind data source
                                                    dataSource: alltechnical,
                                                    xValueMapper:
                                                        (Historical data, _) {
                                                      // print(controller.loading.value);
                                                      final DateTime date1 =
                                                          DateTime.parse(data
                                                              .date
                                                              .toString());
                                                      String date2 = DateFormat(
                                                              "yyyy-MM-dd")
                                                          .format(date1);
                                                      // DateTime date3 =
                                                      //     DateTime.parse(date2);
                                                      // // print(date3);
                                                      return date2;
                                                    },
                                                    highValueMapper:
                                                        (Historical data, _) =>
                                                            data.high,
                                                    lowValueMapper:
                                                        (Historical data, _) =>
                                                            data.low,
                                                    openValueMapper:
                                                        (Historical data, _) =>
                                                            data.open,
                                                    closeValueMapper:
                                                        (Historical data, _) =>
                                                            data.close)
                                                // yValueMapper:
                                                //     (Historical sales, _) =>
                                                //         sales.high)
                                              ]))),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: List.generate(
                                          allmin.length,
                                          (index) => InkWell(
                                            onTap: () {
                                              if (selectmin == allmin[index]) {
                                              } else {
                                                setState(() {
                                                  selectmin = allmin[index];
                                                });
                                                getgraphtechnicalssdetailC();
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      selectmin != allmin[index]
                                                          ? Colors.white
                                                          : kNavyBlue
                                                              .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  allmin[index],
                                                  style: TextStyle(
                                                      color: kNavyBlue,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : selectname == 'My Metrics'
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          heightSpace10,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Market Capitalization in Cr.',
                                                      style: BaseStyles
                                                          .blacNormal15,
                                                    ),
                                                    Text(
                                                      'Market Leader',
                                                      style: BaseStyles
                                                          .greennormal14,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                materixdata.isEmpty
                                                    ? ''
                                                    : "${matrixmrkcap.toString()} Cr.",
                                              )
                                            ],
                                          ),
                                          heightSpace10,
                                          Divider(),
                                          heightSpace10,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Price to Book Ratio',
                                                      style: BaseStyles
                                                          .blacNormal15,
                                                    ),
                                                    Text(
                                                      'High in Industry',
                                                      style: BaseStyles
                                                          .redNormal14,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                materixdata.isEmpty
                                                    ? ''
                                                    : materixdata['ptbRatioTTM']
                                                                .toString()
                                                                .length <
                                                            5
                                                        ? materixdata[
                                                                'ptbRatioTTM']
                                                            .toString()
                                                        : materixdata[
                                                                'ptbRatioTTM']
                                                            .toString()
                                                            .substring(0, 5),
                                              )
                                            ],
                                          ),
                                          heightSpace10,
                                          Divider(),
                                          heightSpace10,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'TTM PE Ratio',
                                                      style: BaseStyles
                                                          .blacNormal15,
                                                    ),
                                                    Text(
                                                      'Above Industry Median',
                                                      style: BaseStyles
                                                          .orange14normal,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                materixdata.isEmpty
                                                    ? ''
                                                    : materixdata['peRatioTTM']
                                                                .toString()
                                                                .length <
                                                            5
                                                        ? materixdata[
                                                                'peRatioTTM']
                                                            .toString()
                                                        : materixdata[
                                                                'peRatioTTM']
                                                            .toString()
                                                            .substring(0, 5),
                                              )
                                            ],
                                          ),
                                          heightSpace10,
                                          Divider(),
                                          heightSpace10,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'TTM PEG Ratio',
                                                      style: BaseStyles
                                                          .blacNormal15,
                                                    ),
                                                    Text(
                                                      'High In Industry',
                                                      style: BaseStyles
                                                          .greennormal14,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                materixdata.isEmpty
                                                    ? ''
                                                    : materixdata['priceToSalesRatioTTM']
                                                                .toString()
                                                                .length <
                                                            6
                                                        ? materixdata[
                                                                'priceToSalesRatioTTM']
                                                            .toString()
                                                        : materixdata[
                                                                'priceToSalesRatioTTM']
                                                            .toString()
                                                            .substring(0, 6),
                                              )
                                            ],
                                          ),
                                          heightSpace10,
                                          Divider(),
                                          heightSpace10,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Operating Revenues Qtr Cr',
                                                      style: BaseStyles
                                                          .blacNormal15,
                                                    ),
                                                    Text(
                                                      'Market Leader',
                                                      style: BaseStyles
                                                          .greennormal14,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                materixdata.isEmpty
                                                    ? ''
                                                    : materixdata['evToOperatingCashFlowTTM']
                                                                .toString()
                                                                .length <
                                                            6
                                                        ? materixdata[
                                                                'evToOperatingCashFlowTTM']
                                                            .toString()
                                                        : materixdata[
                                                                'evToOperatingCashFlowTTM']
                                                            .toString()
                                                            .substring(0, 6),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : selectname == 'Peers'
                                      ? Column(
                                          children: [
                                            heightSpace20,
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: peers.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              selectpeer =
                                                                  peers[index];
                                                              getcompanydetaillistC(
                                                                  peers[index]);
                                                            });
                                                          },
                                                          child: Container(
                                                            // height: 35,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.30,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            1),
                                                                color: selectpeer ==
                                                                        peers[
                                                                            index]
                                                                    ? kNavyBlue
                                                                        .withOpacity(
                                                                            0.6)
                                                                    : AppColors
                                                                        .greyprimarycolor
                                                                        .shade200),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5.0),
                                                              child: Text(
                                                                peers[index],
                                                                style: TextStyle(
                                                                    color: selectpeer ==
                                                                            peers[
                                                                                index]
                                                                        ? Colors
                                                                            .white
                                                                        : kNavyBlue,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        )
                                                      ],
                                                    );
                                                  }),
                                            ),
                                            heightSpace10,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Peers',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: kNavyBlue,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Company Name',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: kNavyBlue,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        profiledata.isEmpty
                                                            ? ''
                                                            : "${profiledata[0]['companyName'].toString()}",
                                                        textAlign:
                                                            TextAlign.right,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff1F1D1D),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Price',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: kNavyBlue,
                                                      ),
                                                    ),
                                                    Text(
                                                      profiledata.isEmpty
                                                          ? ''
                                                          : "${profiledata[0]['price'].toString()}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff1F1D1D),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '%chg',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: kNavyBlue,
                                                      ),
                                                    ),
                                                    Text(
                                                      profiledata.isEmpty
                                                          ? ''
                                                          : "${profiledata[0]['changes'].toString()}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff1F1D1D),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Market Cap.',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: kNavyBlue,
                                                      ),
                                                    ),
                                                    Text(
                                                      profiledata.isEmpty
                                                          ? ''
                                                          : "${mrkcap2.toString()} Cr.",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff1F1D1D),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '%volAvg',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: kNavyBlue,
                                                      ),
                                                    ),
                                                    Text(
                                                      profiledata.isEmpty
                                                          ? ''
                                                          : "${profiledata[0]['volAvg'].toString()}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff1F1D1D),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '%lastDiv',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: kNavyBlue,
                                                      ),
                                                    ),
                                                    Text(
                                                      profiledata.isEmpty
                                                          ? ''
                                                          : profiledata[0][
                                                                          'lastDiv']
                                                                      .toString()
                                                                      .length <
                                                                  5
                                                              ? profiledata[0][
                                                                      'lastDiv']
                                                                  .toString()
                                                              : profiledata[0][
                                                                      'lastDiv']
                                                                  .toString()
                                                                  .substring(
                                                                      0, 5),
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff1F1D1D),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      : selectname == 'News'
                                          ? Expanded(
                                              child: ListView.builder(
                                                  // physics: NeverScrollableScrollPhysics(),
                                                  itemCount: newsdata.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Column(children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.of(context).push(
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          NewsDetails(
                                                                            data:
                                                                                newsdata[index],
                                                                          )));
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  decorationbox2(
                                                                      opacity:
                                                                          0.1),
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.10,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.35,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      child: newsdata
                                                                              .isEmpty
                                                                          ? Container()
                                                                          : CachedNetworkImage(
                                                                              imageBuilder: (context, imageProvider) => Container(
                                                                                // height: 60.0,
                                                                                decoration: BoxDecoration(
                                                                                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                                                                                ),
                                                                              ),
                                                                              imageUrl: newsdata[index]['image'].toString(),
                                                                              // height: 80,
                                                                              // width: 100,
                                                                              fit: BoxFit.contain,
                                                                              placeholder: (context, url) => const Center(
                                                                                  child: CircularProgressIndicator(
                                                                                color: AppColors.blackColor,
                                                                              )),
                                                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                            ),
                                                                    ),
                                                                  ),
                                                                  widthSpace10,
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              10),
                                                                      child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment
                                                                              .start,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              newsdata[index]['symbol'].toString(),
                                                                              style: BaseStyles.grey1Medium14,
                                                                              maxLines: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ),
                                                                            heightSpace3,
                                                                            Text(
                                                                              newsdata[index]['title'].toString(),
                                                                              style: BaseStyles.blackMedium14,
                                                                              maxLines: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ),
                                                                            heightSpace3,
                                                                            Text(
                                                                              newsdata[index]['publishedDate'].toString().substring(0, 10),
                                                                              style: BaseStyles.grey3Normal10,
                                                                            ),
                                                                            // const Icon(
                                                                            //   Icons.share,
                                                                            //   color: AppColors.greycolor,
                                                                            // )
                                                                          ]),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          heightSpace10
                                                        ],
                                                      )
                                                    ]);
                                                  }),
                                            )
                                          : selectname == 'Corporate Actions'
                                              ? Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          heightSpace20,
                                                          Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    d_s =
                                                                        'dividend';
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: decorationbox2(
                                                                      color: d_s ==
                                                                              'dividend'
                                                                          ? kNavyBlue
                                                                          : AppColors
                                                                              .greyprimarycolor
                                                                              .shade400,
                                                                      radius:
                                                                          5.0),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      'Dividend',
                                                                      style: BaseStyles
                                                                          .whitebold14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              widthSpace20,
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    d_s =
                                                                        'split';
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: decorationbox2(
                                                                      color: d_s ==
                                                                              'split'
                                                                          ? kNavyBlue
                                                                          : AppColors
                                                                              .greyprimarycolor
                                                                              .shade400,
                                                                      radius:
                                                                          5.0),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      'Split',
                                                                      style: BaseStyles
                                                                          .whitebold14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          heightSpace10,
                                                          Divider(),
                                                          heightSpace10,
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .history,
                                                                    color:
                                                                        kNavyBlue,
                                                                  ),
                                                                  widthSpace5,
                                                                  Text(
                                                                    d_s == 'dividend'
                                                                        ? 'Dividend History'
                                                                        : 'Split History',
                                                                    style: BaseStyles
                                                                        .blackMedium16,
                                                                  )
                                                                ],
                                                              ),
                                                              heightSpace10,
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      'EX-DATE',
                                                                      style: BaseStyles
                                                                          .greyMedium13,
                                                                    ),
                                                                  ),
                                                                  widthSpace5,
                                                                  d_s != 'split'
                                                                      ? Expanded(
                                                                          child:
                                                                              Text(
                                                                            'DIVIDEND AMOUNT',
                                                                            style:
                                                                                BaseStyles.greyMedium13,
                                                                          ),
                                                                        )
                                                                      : Container(),
                                                                  d_s != 'split'
                                                                      ? widthSpace5
                                                                      : Container(),
                                                                  Expanded(
                                                                    child: Text(
                                                                      d_s == 'split'
                                                                          ? 'BONUS RATIO'
                                                                          : 'RECORD DATE',
                                                                      style: BaseStyles
                                                                          .greyMedium13,
                                                                    ),
                                                                  ),
                                                                  widthSpace5,
                                                                  Expanded(
                                                                    child: Text(
                                                                      d_s == 'split'
                                                                          ? 'RECORD DATE'
                                                                          : 'INSTRUMENT TYPE',
                                                                      style: BaseStyles
                                                                          .greyMedium13,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              d_s == 'dividend'
                                                                  ? ListView.builder(
                                                                      physics: NeverScrollableScrollPhysics(),
                                                                      shrinkWrap: true,
                                                                      itemCount: dividend.length,
                                                                      itemBuilder: (BuildContext context, int index) {
                                                                        return Column(
                                                                          children: [
                                                                            heightSpace10,
                                                                            Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    dividend[index]['label'],
                                                                                    style: BaseStyles.blackMedium12,
                                                                                  ),
                                                                                ),
                                                                                widthSpace5,
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    dividend[index]['dividend'].toString(),
                                                                                    style: BaseStyles.blackMedium12,
                                                                                    textAlign: TextAlign.center,
                                                                                  ),
                                                                                ),
                                                                                widthSpace5,
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    dividend[index]['recordDate'].toString(),
                                                                                    style: BaseStyles.blackMedium12,
                                                                                  ),
                                                                                ),
                                                                                widthSpace5,
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    'Equity Share',
                                                                                    style: BaseStyles.blackMedium12,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            // heightSpace5,
                                                                            Divider(),
                                                                            heightSpace5,
                                                                          ],
                                                                        );
                                                                      })
                                                                  : split.isEmpty
                                                                      ? SizedBox(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.50,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              'No Split',
                                                                              style: BaseStyles.blacNormal16,
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : ListView.builder(
                                                                          // physics:
                                                                          //     NeverScrollableScrollPhysics(),
                                                                          shrinkWrap: true,
                                                                          itemCount: split.length,
                                                                          itemBuilder: (BuildContext context, int index) {
                                                                            return Column(
                                                                              children: [
                                                                                heightSpace10,
                                                                                Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        split[index]['label'],
                                                                                        style: BaseStyles.blackMedium12,
                                                                                      ),
                                                                                    ),
                                                                                    widthSpace5,
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        "${split[index]['numerator'].toString()}:${split[index]['denominator'].toString()}",
                                                                                        style: BaseStyles.blackMedium12,
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                    widthSpace5,
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        split[index]['date'].toString(),
                                                                                        style: BaseStyles.blackMedium12,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                // heightSpace5,
                                                                                Divider(),
                                                                                heightSpace5,
                                                                              ],
                                                                            );
                                                                          }),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : selectname == 'Shareholding'
                                                  ? Expanded(
                                                      child: Column(
                                                      children: [
                                                        heightSpace20,
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .analytics_outlined,
                                                              size: 20,
                                                            ),
                                                            widthSpace5,
                                                            Text(
                                                              'Shareholding Summary',
                                                              style: BaseStyles
                                                                  .blackMedium16,
                                                            )
                                                          ],
                                                        ),
                                                        heightSpace10,
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'SORT BY:    ',
                                                              style: BaseStyles
                                                                  .greennormal12,
                                                            ),
                                                            Expanded(
                                                              child: SizedBox(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.05,
                                                                child: ListView
                                                                    .builder(
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis
                                                                                .horizontal,
                                                                        itemCount:
                                                                            shareholddate
                                                                                .length,
                                                                        itemBuilder:
                                                                            (BuildContext context,
                                                                                int index) {
                                                                          return Row(
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  setState(() {
                                                                                    selectshareholddate = shareholddate[index]['date'];
                                                                                    getshareholdersdatelistC(shareholddate[index]['date']);
                                                                                  });
                                                                                },
                                                                                child: Container(
                                                                                  // height:
                                                                                  //     35,
                                                                                  width: MediaQuery.of(context).size.width * 0.30,
                                                                                  alignment: Alignment.center,
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: selectshareholddate == shareholddate[index]['date'] ? kNavyBlue.withOpacity(0.6) : AppColors.greyprimarycolor.shade200),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Text(
                                                                                      shareholddate[index]['date'].toString(),
                                                                                      style: TextStyle(color: selectshareholddate == shareholddate[index]['date'] ? Colors.white : kNavyBlue, fontSize: 12, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              )
                                                                            ],
                                                                          );
                                                                        }),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: shareholdlist
                                                                      .isEmpty &&
                                                                  !loading2
                                                              ? Center(
                                                                  child: Text(
                                                                  'No Data',
                                                                  style: BaseStyles
                                                                      .grey1Medium14,
                                                                ))
                                                              : loading2
                                                                  ? Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                      color:
                                                                          kNavyBlue,
                                                                    ))
                                                                  : ListView.builder(
                                                                      // physics: NeverScrollableScrollPhysics(),
                                                                      itemCount: shareholdlist.length,
                                                                      itemBuilder: (BuildContext context, int index) {
                                                                        return Column(
                                                                            children: [
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  InkWell(
                                                                                    onTap: () {},
                                                                                    child: Container(
                                                                                      decoration: decorationbox2(opacity: 0.1),
                                                                                      child: Row(
                                                                                        children: [
                                                                                          widthSpace10,
                                                                                          Expanded(
                                                                                            child: Container(
                                                                                              padding: const EdgeInsets.all(10),
                                                                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                                Text(
                                                                                                  "Name: ${shareholdlist[index]['investorName'].toString()}",
                                                                                                  style: BaseStyles.grey1Medium14,
                                                                                                  maxLines: 2,
                                                                                                  overflow: TextOverflow.ellipsis,
                                                                                                ),
                                                                                                heightSpace3,
                                                                                                Text(
                                                                                                  "Owership: ${shareholdlist[index]['ownership'].toString()}",
                                                                                                  style: BaseStyles.grey1Medium14,
                                                                                                  maxLines: 2,
                                                                                                  overflow: TextOverflow.ellipsis,
                                                                                                ),
                                                                                                heightSpace3,
                                                                                              ]),
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  heightSpace10
                                                                                ],
                                                                              )
                                                                            ]);
                                                                      }),
                                                        )
                                                      ],
                                                    ))
                                                  : Container(),
            ],
          ),
        ),
        // floatingActionButton: selectname == 'Overview'
        //     ? InkWell(
        //         onTap: () {
        //           Navigator.of(context).push(MaterialPageRoute(
        //               builder: (context) => FinancialStatement(
        //                     companyName: widget.companyName,
        //                     symbol: widget.symbol,
        //                   )));
        //         },
        //         child: Container(
        //             height: 24,
        //             width: 111,
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(90),
        //               color: const Color(0xff096DDA),
        //               boxShadow: [
        //                 BoxShadow(
        //                     color: Colors.black.withOpacity(0.25),
        //                     offset: const Offset(0, 2),
        //                     blurRadius: 2,
        //                     spreadRadius: 0),
        //               ],
        //             ),
        //             child: Center(
        //               child: Text(
        //                 'Financial Statement',
        //                 style: GoogleFonts.poppins(
        //                     fontWeight: FontWeight.w600,
        //                     fontSize: 8,
        //                     color: Colors.white),
        //               ),
        //             )),
        //       )
        //     : Container(),
      ),
    );

//         loading?const Center(child: CircularProgressIndicator(color: kNavyBlue,)): ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           children: [
//             const Divider(
//               color: Color(0xffC7B9B9),
//               thickness: 1,
//             ),
//             const SizedBox(
//               height: 18,
//             ),
//             Text(
//               widget.companyName,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: GoogleFonts.poppins(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xff1F1D1D),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             // Row(
//             //   mainAxisSize: MainAxisSize.min,
//             //   children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [Text(
//               alldata.isEmpty?'':  "\u{20B9} ${alldata['profile']['price'].toString()}",
//                       style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xff1F1D1D)),
//                     ),
//                   // alldata['profile']['image']==null?Container():  Image.network(alldata['profile']['image'].toString(),height: 50,width: 60,),

//                   ],
//                 ),
//             //     const SizedBox(
//             //       width: 10,
//             //     ),
//             //     percent > 0
//             //         ? const Icon(
//             //             Icons.arrow_upward_sharp,
//             //             color: k1BEDColor,
//             //             size: 18,
//             //           )
//             //         : const Icon(
//             //             Icons.arrow_downward_sharp,
//             //             size: 18,
//             //             color: kC213Color,
//             //           ),
//             //     const SizedBox(
//             //       width: 5,
//             //     ),
//             //     Text(
//             //       "$percent%",
//             //       style: GoogleFonts.poppins(
//             //         fontSize: 20,
//             //         fontWeight: FontWeight.w600,
//             //         color: percent > 0 ? k1BEDColor : kC213Color,
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             const SizedBox(
//               height: 24,
//             ),
//             Text(
//               'ABOUT',
//               style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500, color: const Color(0xff1F1D1D)),
//             ),
//             const SizedBox(
//               height: 5,
//             ),alldata.isNotEmpty?ReadMoreText(
//  alldata['profile']['description'].toString(),  trimLines: 8,
//   colorClickableText: Colors.pink,
//   trimMode: TrimMode.Line,
//   trimCollapsedText: 'Show more',
//   trimExpandedText: 'Show less',
//   moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
// ):Container(),
//             // Text(
//             //  alldata['profile']['description'].toString(),   maxLines: 10,
//             //   overflow: TextOverflow.ellipsis,
//             //   style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 12, color: const Color(0xff524F4F)),
//             // ),
//             const SizedBox(
//               height: 15,
//             ),
//              Text(
//               'Overview',
//               style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500, color: const Color(0xff1F1D1D)),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Column(children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                 Text('Sector',style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color:kNavyBlue,),

//                ),Text(alldata.isEmpty?'': alldata['profile']['sector'].toString(),style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xff1F1D1D),),
//                 ) ],),
//                 const SizedBox(height: 5,),
//                  Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                 Text('Industry',style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color:kNavyBlue,),

//                ),SizedBox(
//                 width: MediaQuery.of(context).size.width*0.70,
//                  child: Text(alldata.isEmpty?'': alldata['profile']['industry'].toString(),style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xff1F1D1D),),textAlign: TextAlign.end,
//                   ),
//                ) ],), const SizedBox(height: 5,),
//                  Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                 Text('Market Cap.',style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color:kNavyBlue,),

//                ),Text(alldata.isEmpty?'': "${mrkcap.toString()} Cr.",style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xff1F1D1D),),
//                 ) ],),
//             ],),
//             // Text(
//             //   'KEY POINTS',
//             //   style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 12, color: const Color(0xff1F1D1D)),
//             // ),
//             // const SizedBox(
//             //   height: 2,
//             // ),
//             // Text(
//             //  alldata.isEmpty?"":  alldata['profile']['ceo'].toString(),
//             //   style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 12, color: const Color(0xff1F1D1D)),
//             // ),
//             const SizedBox(
//               height: 15,
//             ),
//             Row(
//               children: [
//                 Container(
//                   height: 39,
//                   width: 195,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: const Color(0xffF5f3f3),
//                     ),
//                   ),
//                   child: TabBar(
//                       labelColor: const Color(0xff524F4F),
//                       unselectedLabelColor: const Color(0xff524F4F),
//                       labelStyle: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400),
//                       unselectedLabelStyle: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400),
//                       indicator: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: const Color(0xffedeafd),
//                       ),
//                       tabs: [
//                         const Text('Price'),
//                         const Text('PE Ratio'),
//                         Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: const [
//                             Text('More'),
//                             Expanded(
//                                 child: Icon(
//                               Icons.arrow_drop_down,
//                               size: 18,
//                             ))
//                           ],
//                         )
//                       ]),
//                 ),
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 Container(
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     image: const DecorationImage(image: AssetImage('assets/icons/bellIcon.png')),
//                     color: const Color(0xfffcfcfc),
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: const Color(0xfff5f3f3),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             // Image.asset('assets/images/stockDetailsGraph.png',height:310,width: 310,fit: BoxFit.fill,),
//             StockGraph(),
//             const SizedBox(height: 30,),
//             ProsConsTile(listItems: _pros, text: 'PROS', isPro: true),
//             const SizedBox(height: 16,),
//             ProsConsTile(listItems: _cons, text: 'CONS',isPro: false,),
//             const SizedBox(height: 21,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Investment Checklist',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text('Basic',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16,decoration: TextDecoration.underline,color: const Color(0xff007AFF)),),
//                     const SizedBox(width: 8,),
//                     Text('Pro',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16,color: const Color(0xff007AFF)),)
//                   ],
//                 )
//               ],
//             ),
//             const SizedBox(height: 11,),
//             const Divider(color: Color(0xffDDCFCF),thickness: 1,),
//             const SizedBox(height:15,),
//             CheckListTile(isRed: true, title: 'Intrinsic Value', subtitle: 'Current price is more than the\nintrinsic value'),
//             CheckListTile(isRed: false, title: 'ROE vs FD rates', subtitle: 'Stock has been generated better retrun on\nequity than bank FD'),
//             CheckListTile(isRed: false, title: 'Dividend Returns', subtitle: 'Stock offer good dividend retruns'),
//             CheckListTile(isRed: false, title: 'Entry Point', subtitle: 'Good time consider,as stock is not overbought\nzone'),
//             CheckListTile(isRed: false, title: 'No Red Flags', subtitle: 'Stock not in ASM/GSM lists and not a lot of\npromoter hold in pledged'),
//             const SizedBox(height: 23,),
//             GestureDetector(
//               onTap: (){
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForecastAndRatings()));
//               },
//               child: Container(
//                 height: 35,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(2),
//                   boxShadow: [
//                     BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 2),
//                   ],
//                   color: const Color(0xffEFF3FC),
//                 ),
//                 child: Center(child: Text('Stockveer! Unlock deeper Insight',style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500,color: const Color(0xff007AFF)),)),
//               ),
//             ),
//             const SizedBox(height: 53,),

//           ],
//         ),
  }
}

// class StockGraph extends StatelessWidget {
//   const StockGraph({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 310,
//         width: MediaQuery.of(context).size.width,
//         child: Container(
//             child: SfCartesianChart(
//                 // Initialize category axis
//                 primaryXAxis: CategoryAxis(),
//                 series: <LineSeries<SalesData, String>>[
//               LineSeries<SalesData, String>(
//                   // Bind data source
//                   dataSource: <SalesData>[
//                     SalesData('Jan', 35),
//                     SalesData('Feb', 28),
//                     SalesData('Mar', 34),
//                     SalesData('Apr', 32),
//                     SalesData('May', 40)
//                   ],
//                   xValueMapper: (SalesData sales, _) => sales.year,
//                   yValueMapper: (SalesData sales, _) => sales.sales)
//             ])));
//   }
// }

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
