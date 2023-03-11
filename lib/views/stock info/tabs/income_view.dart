import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/custom_table.dart';
import 'package:stock_veer/custom%20widgets/question_tile.dart';
import 'package:stock_veer/utils/colors.dart';


class IncomeView extends StatelessWidget {
  IncomeView({Key? key}) : super(key: key);

  final List<String> _headers =[
    'Financial Year',
    'FY 2021',
    'FY 2022',
    'TTM'
  ];

  final List<String> _category = [
    'Total Revenue',
    "EBITDA",
    'PBIT',
    'PBT',
    'Net Income',
    'EPS',
    'DPS',
    'Payout ratio',
  ];

  final List<double> _fy2021 = [155885.28, 44181.16, 42706.15, 23693.25, 23532.33, 57.80, 6.40, 0.11];

  final List<double> _fy2022 = [1255885.28, 424181.16, 142706.15, 323693.25, 2354432.33, 257.80, 61.40, 10.11];

  final List<double> _TTM = [6712585.28, 43281.16, 35142706.15, 433293.25, 3523532.33, 2657.80, 56.40, 1.11];

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
            subtitle: 'Over the last 5 years, revenue has grown at a yearly rate of 17.94%, vs industry avg of 13.26%.'),
        const SizedBox(
          height: 18,
        ),
        BenefitsTile(title: 'Increasing Market Share', subtitle: 'Over the last 5 years, market share increased from 27.53% to 33%'),
        const SizedBox(
          height: 18,
        ),
        BenefitsTile(
            title: 'Higher than Industry Net Income', subtitle: 'Over the last 5 years, income had grown  at a yearly rate of 15.21% vs industry avg of 8.9%'),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 36,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.11)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 2)],
            color: const Color(0xffFFFCFC),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Annual Normal View",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
              ),
              const Icon(
                Icons.arrow_drop_down,
                size: 28,
                color: Colors.black,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTable(headers: _headers, category: _category, fy2021: _fy2021, fy2022: _fy2022, ttm: _TTM, containerHeight: 40),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}

class BenefitsTile extends StatelessWidget {
  String title, subtitle;
  BenefitsTile({Key? key, required this.title, required this.subtitle}) : super(key: key);

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
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 12, color: k1013Color),
                ),
                const Divider(
                  color: Color(0xffB9ADAD),
                  thickness: 1,
                ),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(fontSize: 11, fontWeight: FontWeight.w400, color: const Color(0xffC1BDBD)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
