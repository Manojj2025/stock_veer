import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/custom_table.dart';

import '../../../custom widgets/question_tile.dart';

class CashFlowView extends StatelessWidget {
  CashFlowView({Key? key}) : super(key: key);
  final List<String> _headers =[
    'Financial Year',
    'FY 2020',
    'FY 2021',
    'FY 2022',
  ];

  final List<String> _category = [
    'Net Change in Cash',
    "Changes in Working Capital",
    'Capital Expenditures',
    'Free Cash Flow',
  ];

  final List<double> _fy2021 = [155885.28, 44181.16, 42706.15, 23693.25,  57.80, 6.40, 0.11];

  final List<double> _fy2022 = [1255885.28, 424181.16, 142706.15, 323693.25, 57.80, 6.40, 0.11 ];

  final List<double> _TTM = [6712585.28, 43281.16, 35142706.15, 433293.25, 57.80, 6.40, 0.11];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        QuestionTile(
            question: '1. what is an Cash Flow?',
            answer:
            'A balance sheet  outlines a  company’s assets, liabilites and shareholders’ equity at a  fiven point in time. It’s a snapshot pf what a company  own and owes, and the amount  invested by shareholders. The balancing  principle is Assests= Liabilites+ share holders’ equity'),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Cash Flow Statement',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.black),),
                Icon(Icons.info)
              ],
            ),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: const Color(0xff624bfc),
                borderRadius: BorderRadius.circular(4),
              ),child: const Icon(Icons.lock_person,color: Colors.white,),
            )
          ],
        ),
        const SizedBox(height: 15,),
        CustomTable(headers: _headers, category: _category, fy2021: _fy2021, fy2022: _fy2022, ttm: _TTM, containerHeight: 50)
      ],
    );
  }
}
