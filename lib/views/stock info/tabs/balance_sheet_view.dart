import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/custom_table.dart';
import 'package:stock_veer/utils/colors.dart';

import '../../../custom widgets/question_tile.dart';

class BalanceSheetView extends StatelessWidget {
  const BalanceSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _headers =[
      'Financial Year',
      'FY 2020',
      'FY 2021',
      'FY 2022'
    ];
    final List<String> _category = [
      'Current Assets',
      "Non Current Assets",
      'Total Assets',
      'Current Liabilities',
      'Non Current Liabilities',
      'Total Liabilities',
      'Total Equity',
      "Total Liabilities & Shareholder's Equity",
      "Total Common Shares Outstanding"
    ];

    final List<double> _fy2021 = [155885.28, 44181.16, 42706.15, 23693.25, 23532.33, 57.80, 6.40, 0.11,129.0];
    final List<double> _fy2022 = [1255885.28, 424181.16, 142706.15, 323693.25, 2354432.33, 257.80, 61.40, 10.11,129.0];
    final List<double> _TTM = [6712585.28, 43281.16, 35142706.15, 433293.25, 3523532.33, 2657.80, 56.40, 1.11,129.0];
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
          style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 16, color: k1013Color),
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  border: Border.all(color: Colors.black54.withOpacity(0.3),),
                ),child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.visibility_outlined,color: Color(0xff207dba),size: 18,),
                      const SizedBox(width: 10,),
                      Text('Normal View',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),)
                    ],
                  ),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
              ),
            ),
            const SizedBox(width: 10,),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: const Color(0xff624bfc),
                borderRadius: BorderRadius.circular(4),
              ),child: Icon(Icons.lock_person,color: Colors.white,),
            )
          ],
        ),
        const SizedBox(height: 15,),
        CustomTable(headers: _headers, category: _category, fy2021: _fy2021, fy2022: _fy2022, ttm: _TTM, containerHeight: 50)
      ],
    );
  }
}
