import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/custom_table.dart';
import 'package:stock_veer/custom%20widgets/question_tile.dart';
import 'package:stock_veer/utils/colors.dart';
import 'package:stock_veer/utils/custom_decoration.dart';

import '../../../providers/allapis.dart';
import '../../../toast.dart';
import '../../../utils/values.dart';

class IncomeView extends StatefulWidget {
  final String symbol;
  IncomeView({Key? key, required this.symbol}) : super(key: key);

  @override
  State<IncomeView> createState() => _IncomeViewState();
}

class _IncomeViewState extends State<IncomeView> {
  final List<String> _headers = [];
  final List<String> _headers2 = [];

  bool loading = false;
  List annualincomelist = [];
  String selectincomename = 'Annual';
  List quarterincomelist = [];
  final List<String> _category = [
    'Financial Year',
    'Total Revenue',
    "EBITDA",
    'PBIT',
    'PBT',
    'Net Income',
    'EPS',
    'DPS',
    'Payout ratio',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      getquarterincomebalncesheetC();
      getannualincomebalncesheetC();
    });
  }

  getquarterincomebalncesheetC() async {
    setState(() {
      loading = true;
    });
    quarterincomelist.clear();
    _headers.clear();
    try {
      var res = await ApisProvider()
          .getquarterincomebalncesheetP(widget.symbol.toString());
      if (!mounted) {
        return;
      }
      setState(() {
        quarterincomelist.addAll(res);
        for (var e in quarterincomelist) {
          _headers.add(e['period'] + " " + e['calendarYear']);
        }
        print(_headers);
        print(annualincomelist.length);
        print(quarterincomelist.length);
        // _headers.addAll(quarterincomelist[]);
      });
    } catch (e) {
      showToast(e.toString());
      print(e.toString());
    }
    setState(() {
      loading = false;
    });
  }

  getannualincomebalncesheetC() async {
    setState(() {
      loading = true;
    });
    annualincomelist.clear();
    _headers2.clear();
    try {
      var res2 = await ApisProvider()
          .getannualincomebalncesheetP(widget.symbol.toString());
      if (!mounted) {
        return;
      }
      setState(() {
        annualincomelist.addAll(res2);
        for (var e in annualincomelist) {
          _headers2.add(e['period'] + " " + e['calendarYear']);
        }
        print(_headers2);
        print(annualincomelist);
        print(quarterincomelist.length);
        // _headers.addAll(quarterincomelist[]);
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
    return ListView(
      children: [
        QuestionTile(
            question: '1. what is an income statement?',
            answer:
                'The income statement indicates a company’s financial performance measured over a reporting period. Performance  is assessed by summarising  how the business incure  its revenues, expenses andnet profit or loss incurred over the period. It’s also called the P&L statement.'),
        const SizedBox(
          height: 10,
        ),
        BenefitsTile(
            title: 'Income Statement\nHigher than industry Revenue Growth',
            subtitle:
                'Over the last 5 years, revenue has grown at a yearly rate of 17.94%, vs industry avg of 13.26%.'),
        const SizedBox(
          height: 18,
        ),
        BenefitsTile(
            title: 'Increasing Market Share',
            subtitle:
                'Over the last 5 years, market share increased from 27.53% to 33%'),
        const SizedBox(
          height: 18,
        ),
        BenefitsTile(
            title: 'Higher than Industry Net Income',
            subtitle:
                'Over the last 5 years, income had grown  at a yearly rate of 15.21% vs industry avg of 8.9%'),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                isDismissible: true,
                backgroundColor: Colors.transparent,
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.28,
                    child: Container(
                      // height: 300,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Column(
                        children: [
                          heightSpace20,
                          Container(
                            height: 4,
                            width: 160,
                            decoration: MyDecoration.simpledecoration(
                                color: AppColors.greyprimarycolor),
                          ),
                          heightSpace20,
                          Text(
                            "Select",
                            style: BaseStyles.blackMedium16,
                          ),
                          heightSpace10,
                          ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                selectincomename = 'Annual';
                                getannualincomebalncesheetC();
                              });
                            },
                            horizontalTitleGap: 2.0,
                            dense: true,
                            contentPadding: const EdgeInsets.only(left: 5),
                            title: Text(
                              'Annual',
                              style: BaseStyles.blacNormal14,
                            ),
                            leading: Radio(
                              activeColor: AppColors.primaryColor,
                              visualDensity: const VisualDensity(
                                  horizontal: -0.4, vertical: -0.4),
                              value: 'Annual',
                              groupValue: selectincomename,
                              onChanged: (String? value) {
                                Navigator.pop(context);
                                setState(() {
                                  selectincomename = value.toString();
                                  getannualincomebalncesheetC();
                                });
                              },
                            ),
                          ),
                          heightSpace10,
                          ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                selectincomename = 'Quarterly';
                                getquarterincomebalncesheetC();
                              });
                            },
                            horizontalTitleGap: 2.0,
                            dense: true,
                            contentPadding: const EdgeInsets.only(left: 5),
                            title: Text(
                              'Quarterly',
                              style: BaseStyles.blacNormal14,
                            ),
                            leading: Radio(
                              activeColor: AppColors.primaryColor,
                              visualDensity: const VisualDensity(
                                  horizontal: -0.4, vertical: -0.4),
                              value: 'Quarterly',
                              groupValue: selectincomename,
                              onChanged: (value) {
                                Navigator.pop(context);
                                setState(() {
                                  selectincomename = value.toString();
                                  getquarterincomebalncesheetC();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container(
            width: double.infinity,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.11)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 2)
              ],
              color: const Color(0xffFFFCFC),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$selectincomename Normal View",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  size: 28,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        loading
            ? const Center(
                child: CircularProgressIndicator(
                color: kNavyBlue,
              ))
            : quarterincomelist.isNotEmpty || annualincomelist.isNotEmpty
                ? CustomTable(
                    alldata: selectincomename == 'Annual'
                        ? annualincomelist
                        : quarterincomelist,
                    headers:
                        selectincomename == 'Annual' ? _headers2 : _headers,
                    category: _category,
                    containerHeight: 40)
                : Container(
                    child: Center(child: Text('No Data')),
                  ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}

class BenefitsTile extends StatelessWidget {
  String title, subtitle;
  BenefitsTile({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.arrow_drop_down_circle,
            size: 30,
            color: Color(0xff17E180),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: k1013Color),
                ),
                const Divider(
                  color: Color(0xffB9ADAD),
                  thickness: 1,
                ),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffC1BDBD)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
