import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:stock_veer/custom%20widgets/bullet_text.dart';
import 'package:stock_veer/custom%20widgets/checklist_tile.dart';
import 'package:stock_veer/custom%20widgets/pros_cons_tile.dart';
import 'package:stock_veer/utils/colors.dart';
import 'package:stock_veer/views/contact_us.dart';
import 'package:stock_veer/views/stock%20info/financial_statement.dart';
import 'package:stock_veer/views/stock%20info/forecast_and_ratings.dart';

import '../../providers/allapis.dart';
import '../../toast.dart';

class StockDetails extends StatefulWidget {
 final String companyName;
 final String symbol;
  StockDetails({Key? key, required this.companyName,required this.symbol }) : super(key: key);

  @override
  State<StockDetails> createState() => _StockDetailsState();
}

class _StockDetailsState extends State<StockDetails> {
   Map alldata={};
  bool loading=false;
  double mrkcap=0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      getstocksdetaillistC();
    });

    // searchController.addListener(() {
    //   search(searchController.text);
    //   final showSearchResults = searchController.text.isNotEmpty;
    //   setState(() {
    //     this.showSearchResults = showSearchResults;
    //   });
    // });
  }

  getstocksdetaillistC() async {
    setState(() {
      loading=true;
    });
    alldata.clear();
    try {
      var res = await ApisProvider().getstocksdetaillistP(widget.symbol.toString());
  //  print(res['profile']['price'].toString());
  setState(() {
    
   alldata.addAll(res);
   if(alldata['profile']['mktCap']!=null){

    var a=  int.parse( alldata['profile']['mktCap'].toString())/100000000;
    mrkcap=double.parse(a.toStringAsFixed(2));
   }
  });

    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
     setState(() {
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    List<String> _pros=[
      'Company is almost debt free.',
      'Company has a good return on equity(ROE) track record: 3 Years ROE 40.0%',
      'Company has been maintaining a healthy dividend payout of 56.4%',
      'Company’s working capital requirement  have reduced from 54.9 days to 36.0 days'
    ];

    List<String> _cons=[
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
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18, color: const Color(0xff030A39)),
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
        body:loading?const Center(child: CircularProgressIndicator(color: kNavyBlue,)): ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const Divider(
              color: Color(0xffC7B9B9),
              thickness: 1,
            ),
            const SizedBox(
              height: 18,
            ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(
              alldata.isEmpty?'':  "\u{20B9} ${alldata['profile']['price'].toString()}",
                      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xff1F1D1D)),
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
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500, color: const Color(0xff1F1D1D)),
            ),
            const SizedBox(
              height: 5,
            ),alldata.isNotEmpty?ReadMoreText(
 alldata['profile']['description'].toString(),  trimLines: 8,
  colorClickableText: Colors.pink,
  trimMode: TrimMode.Line,
  trimCollapsedText: 'Show more',
  trimExpandedText: 'Show less',
  moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
):Container(),
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
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500, color: const Color(0xff1F1D1D)),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Sector',style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color:kNavyBlue,),
                
               ),Text(alldata.isEmpty?'': alldata['profile']['sector'].toString(),style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xff1F1D1D),),
                ) ],),
                const SizedBox(height: 5,),
                 Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Industry',style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color:kNavyBlue,),
                
               ),SizedBox(
                width: MediaQuery.of(context).size.width*0.70,
                 child: Text(alldata.isEmpty?'': alldata['profile']['industry'].toString(),style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xff1F1D1D),),textAlign: TextAlign.end,
                  ),
               ) ],), const SizedBox(height: 5,),
                 Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Market Cap.',style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color:kNavyBlue,),
                
               ),Text(alldata.isEmpty?'': "${mrkcap.toString()} Cr.",style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xff1F1D1D),),
                ) ],),
            ],),
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
            Row(
              children: [
                Container(
                  height: 39,
                  width: 195,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffF5f3f3),
                    ),
                  ),
                  child: TabBar(
                      labelColor: const Color(0xff524F4F),
                      unselectedLabelColor: const Color(0xff524F4F),
                      labelStyle: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400),
                      unselectedLabelStyle: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffedeafd),
                      ),
                      tabs: [
                        const Text('Price'),
                        const Text('PE Ratio'),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('More'),
                            Expanded(
                                child: Icon(
                              Icons.arrow_drop_down,
                              size: 18,
                            ))
                          ],
                        )
                      ]),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage('assets/icons/bellIcon.png')),
                    color: const Color(0xfffcfcfc),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xfff5f3f3),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            // Image.asset('assets/images/stockDetailsGraph.png',height:310,width: 310,fit: BoxFit.fill,),
            StockGraph(),
            const SizedBox(height: 30,),
            ProsConsTile(listItems: _pros, text: 'PROS', isPro: true),
            const SizedBox(height: 16,),
            ProsConsTile(listItems: _cons, text: 'CONS',isPro: false,),
            const SizedBox(height: 21,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Investment Checklist',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Basic',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16,decoration: TextDecoration.underline,color: const Color(0xff007AFF)),),
                    const SizedBox(width: 8,),
                    Text('Pro',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16,color: const Color(0xff007AFF)),)
                  ],
                )
              ],
            ),
            const SizedBox(height: 11,),
            const Divider(color: Color(0xffDDCFCF),thickness: 1,),
            const SizedBox(height:15,),
            CheckListTile(isRed: true, title: 'Intrinsic Value', subtitle: 'Current price is more than the\nintrinsic value'),
            CheckListTile(isRed: false, title: 'ROE vs FD rates', subtitle: 'Stock has been generated better retrun on\nequity than bank FD'),
            CheckListTile(isRed: false, title: 'Dividend Returns', subtitle: 'Stock offer good dividend retruns'),
            CheckListTile(isRed: false, title: 'Entry Point', subtitle: 'Good time consider,as stock is not overbought\nzone'),
            CheckListTile(isRed: false, title: 'No Red Flags', subtitle: 'Stock not in ASM/GSM lists and not a lot of\npromoter hold in pledged'),
            const SizedBox(height: 23,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForecastAndRatings()));
              },
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 2),
                  ],
                  color: const Color(0xffEFF3FC),
                ),
                child: Center(child: Text('Stockveer! Unlock deeper Insight',style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500,color: const Color(0xff007AFF)),)),
              ),
            ),
            const SizedBox(height: 53,),

          ],
        ),
        floatingActionButton: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FinancialStatement(companyName:widget.companyName)));
          },
          child: Container(
            height: 24,
            width: 111,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: const Color(0xff096DDA),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 2), blurRadius: 2, spreadRadius: 0),
              ],
            ),
            child: Center(
              child: Text(
              'Financial Statement',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 8, color: Colors.white),
          ),
            )
          ),
        ),
      ),
    );
  }
}

class StockGraph extends StatelessWidget {
  const StockGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      width: MediaQuery.of(context).size.width,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 200,
          minY: 0,
          maxY: 6000,
          borderData: FlBorderData(
              show: true,
              border: const Border(
                top: BorderSide(color: Colors.black, width: 0.5),
                bottom: BorderSide(color: Colors.black, width: 0.5),
              )),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
            )),
            leftTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            )),
            topTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            )),
          ),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(color: Colors.black.withOpacity(0.5), strokeWidth: 0.5);
            },
            getDrawingVerticalLine: (value) {
              return FlLine(color: Colors.white);
            },
          ),
          lineBarsData: [
            LineChartBarData(
              color: const Color(0xff4c47a4),
              isCurved: true,
              isStrokeCapRound: true,
              spots: [for (final entry in data.entries) FlSpot(entry.key.toDouble(), entry.value.toDouble())],
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

final data = [
  2581,
  2764.36,
  1338,
  3189,
  2948,
  3844,
  3817,
  2713,
  2041,
  3730,
  2856,
  3414,
  3321,
  2990,
  2411,
  2152,
  3104,
  2537,
  3635,
  1616,
  3416,
  3174,
  3717,
  2946,
  2346,
  3502,
  3215,
  3526,
  1894,
  1746,
  2565,
  1507,
  3308,
  3689,
  2323,
  3321,
  2990,
  2411,
  2152,
  3104,
  2537,
  3635,
  3490,
  3620,
  2524,
  2259,
  3628,
  2108,
  3278,
  2251,
  2130,
  3982,
  2752,
  3445,
  3042,
  3838,
  2942,
  1884,
  2227,
  2296,
  1986,
  3819,
  3215,
  3513,
  3520,
  2175,
  3960,
  3582,
  3552,
  1021,
  3275,
  1982,
  3649,
  1969,
  2206,
  2050,
  2062,
  1619,
  1796,
  1852,
  239,
  2300,
  1401,
  1322,
  3182,
  2827,
  1009,
  3191,
  2433,
  3872,
  1516,
  2592,
  1449,
  1412,
  1486,
  2780,
  1623,
  3459,
  3800,
  1482,
  3220,
  2611,
  3228,
  1476,
  3302,
  3014,
  3930,
  3590,
  2439,
  2592,
  2981,
  2528,
  3450,
  1007,
  2384,
  2136,
  3414,
  3137,
  2269,
  2236,
  1549,
  2773,
  3628,
  2012,
  2161,
  1841,
  1604,
  3270,
  3881,
  3238,
  1325,
  3579,
  3050,
  2008,
  2463,
  1350,
  3753,
  1336,
  2417,
  3852,
  2679,
  2605,
  3287,
  3397,
  1573,
  2355,
  1456,
  3384,
  1765,
  2722,
  3889,
  2264,
  3075,
  3074,
  1762,
  3409,
  1998,
  1016,
  1552,
  2547,
  1721,
  3399,
  2043,
  3429,
  2428,
  1732,
  2511,
  2959,
  1870,
  1442,
  1169,
  3043,
  1142,
  1607,
  3970,
  1115,
  2807,
  3007,
  2083,
  1543,
  2674,
  2452,
  3895,
  1779,
  1582,
  3555,
  3067,
  3913,
  2780,
  3277,
  1895,
  2651,
  3978,
  1889,
  1205,
  2222,
  2559,
  1455,
].asMap();
