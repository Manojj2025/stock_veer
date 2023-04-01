import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/custom_table.dart';
import 'package:stock_veer/utils/colors.dart';

import '../../../custom widgets/custome_table2.dart';
import '../../../custom widgets/question_tile.dart';
import '../../../providers/allapis.dart';
import '../../../toast.dart';
import '../../../utils/custom_decoration.dart';
import '../../../utils/values.dart';

class BalanceSheetView extends StatefulWidget {
  final String symbol;
  BalanceSheetView({Key? key, required this.symbol}) : super(key: key);

  @override
  State<BalanceSheetView> createState() => _BalanceSheetViewState();
}

class _BalanceSheetViewState extends State<BalanceSheetView> {
  final List<String> _headers = [];
  final List<String> _headers2 = [];
  // final List<String> _headers = [
  //   'Financial Year',
  //   'FY 2020',
  //   'FY 2021',
  //   'FY 2022'
  // ];
  final List<String> _category = [
    'Financial Year',
    'Current Assets',
    "Non Current Assets",
    'Other Current Assets',
    'Current Liabilities',
    'Non Current Liabilities',
    'Total Liabilities',
    'Total Equity',
    "Total Liabilities & Shareholder's Equity",
    "Total Common Shares Outstanding"
  ];

  bool loading = false;
  List annuallist = [];
  String selectname = 'Annual';
  List quarterlist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      getquarterbalncesheetC();
      getannualbalncesheetC();
    });
  }

  getquarterbalncesheetC() async {
    setState(() {
      loading = true;
    });
    quarterlist.clear();
    _headers.clear();
    try {
      var res =
          await ApisProvider().getquarterbalncesheetP(widget.symbol.toString());
      if (!mounted) {
        return;
      }
      setState(() {
        quarterlist.addAll(res);
        for (var e in quarterlist) {
          _headers.add(e['period'] + " " + e['calendarYear']);
        }
        // print(_headers);
        print(quarterlist);
        // print(quarterincomelist.length);
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

  getannualbalncesheetC() async {
    setState(() {
      loading = true;
    });
    annuallist.clear();
    _headers2.clear();
    try {
      var res2 =
          await ApisProvider().getannualbalncesheetP(widget.symbol.toString());
      if (!mounted) {
        return;
      }
      setState(() {
        annuallist.addAll(res2);
        for (var e in annuallist) {
          _headers2.add(e['period'] + " " + e['calendarYear']);
        }
        print(_headers2);
        // print(annualincomelist.length);
        // print(quarterincomelist.length);
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
            question: '1. what is an Balance Sheet?',
            answer:
                'A balance sheet  outlines a  company’s assets, liabilites and shareholders’ equity at a  fiven point in time. It’s a snapshot pf what a company  own and owes, and the amount  invested by shareholders. The balancing  principle is Assests= Liabilites+ share holders’ equity'),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Balance sheet',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500, fontSize: 16, color: k1013Color),
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: GestureDetector(
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
                                      selectname = 'Annual';
                                      getannualbalncesheetC();
                                    });
                                  },
                                  horizontalTitleGap: 2.0,
                                  dense: true,
                                  contentPadding:
                                      const EdgeInsets.only(left: 5),
                                  title: Text(
                                    'Annual',
                                    style: BaseStyles.blacNormal14,
                                  ),
                                  leading: Radio(
                                    activeColor: AppColors.primaryColor,
                                    visualDensity: const VisualDensity(
                                        horizontal: -0.4, vertical: -0.4),
                                    value: 'Annual',
                                    groupValue: selectname,
                                    onChanged: (String? value) {
                                      Navigator.pop(context);
                                      setState(() {
                                        selectname = value.toString();
                                        getannualbalncesheetC();
                                      });
                                    },
                                  ),
                                ),
                                heightSpace10,
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      selectname = 'Quarterly';
                                      getquarterbalncesheetC();
                                    });
                                  },
                                  horizontalTitleGap: 2.0,
                                  dense: true,
                                  contentPadding:
                                      const EdgeInsets.only(left: 5),
                                  title: Text(
                                    'Quarterly',
                                    style: BaseStyles.blacNormal14,
                                  ),
                                  leading: Radio(
                                    activeColor: AppColors.primaryColor,
                                    visualDensity: const VisualDensity(
                                        horizontal: -0.4, vertical: -0.4),
                                    value: 'Quarterly',
                                    groupValue: selectname,
                                    onChanged: (value) {
                                      Navigator.pop(context);
                                      setState(() {
                                        selectname = value.toString();
                                        getquarterbalncesheetC();
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black54.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.visibility_outlined,
                            color: Color(0xff207dba),
                            size: 18,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '$selectname Normal View',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ],
                      ),
                      const Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: const Color(0xff624bfc),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.lock_person,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        loading
            ? const Center(
                child: CircularProgressIndicator(
                color: kNavyBlue,
              ))
            : quarterlist.isNotEmpty || annuallist.isNotEmpty
                ? CustomTable2(
                    alldata: selectname == 'Annual' ? annuallist : quarterlist,
                    headers: selectname == 'Annual' ? _headers2 : _headers,
                    category: _category,
                    containerHeight: 40)
                : Container(
                    child: Center(child: Text('No Data')),
                  ),
      ],
    );
  }
}
