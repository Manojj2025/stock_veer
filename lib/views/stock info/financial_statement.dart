import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/views/stock%20info/tabs/balance_sheet_view.dart';
import 'package:stock_veer/views/stock%20info/tabs/cash_flow_view.dart';
import 'package:stock_veer/views/stock%20info/tabs/income_view.dart';
import '../../utils/colors.dart';

class FinancialStatement extends StatelessWidget {
  String companyName;
  FinancialStatement({Key? key,required this.companyName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient:kBlueGradient
            ),
          ),
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: const Icon(Icons.arrow_left,size: 30,color: Colors.white,)),
          leadingWidth: 40,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(companyName,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),),
              Text('Financials',style: GoogleFonts.poppins(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.white),),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Consolidated',style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500,color: k1013Color),),
                      Text('Financial Statements',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: k1013Color),),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(padding:EdgeInsets.zero,onPressed: (){}, icon: const Icon(Icons.share,size: 12,color: Color(0xff1E1E23),),),
                      Text('3.2k',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 10,color: const Color(0xffB2B3C0) ),)
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
                    BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 2),
                  ]
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: GoogleFonts.poppins(fontSize: 11,fontWeight: FontWeight.w500,),
                  unselectedLabelStyle: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w500),
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
              const SizedBox(height: 15,),
              Expanded(child: TabBarView(children: [
                IncomeView(),
                BalanceSheetView(),
                CashFlowView(),
              ]))

            ],
          ),
        ),
      ),
    );
  }
}
