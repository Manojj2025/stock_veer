import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_veer/custom%20widgets/custom_appbar.dart';
import 'package:stock_veer/views/root.dart';

import '../../custom widgets/custom_stock_tile.dart';

class WatchList extends StatelessWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _companyName = [
      'Tata Consultancy Services',
      'TCM Ltd',
      'Ecs Biztech Ltd',
      'Has Lifestyle Ltd',
      'PCS Technology',
      'Has Lifestyle Ltd',
      'Ecs Biztech Ltd',
      'Has Lifestyle Ltd',
      'Ecs Biztech Ltd',
      'Has Lifestyle Ltd',
      'Ecs Biztech Ltd',
    ];

    List<String> _abbCompanyName = [
      'TCS',
      'TCMLMTD',
      'TCS',
      'HAS JUICE',
      'PCS',
      'HAS JUICE',
      'TCS',
      'HAS JUICE',
      'PCS',
      'HAS JUICE',
      'HAS JUICE',
    ];

    List<double> _stockPrice = [
      3252.00,
      44.50,
      8.18,
      44.50,
      8.18,
      44.50,
      44.50,
      8.18,
      44.50,
      8.18,
      44.50,
    ];

    List<double> _percentPrice = [
      0.25,
      -4.71,
      3.15,
      0.25,
      -4.71,
      3.15,
      0.25,
      -4.71,
      3.15,
      -4.71,
      3.15,
    ];
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Root()));
              }, icon: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,size: 20,)),
              Text('Watchlist',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 18,color: const Color(0xff030A39)),)
            ],
          ),
          const SizedBox(height: 23,),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 9,
                );
              },
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _companyName.length,
              itemBuilder: (context, index) {
                // return CustomStockTile(companyName: _companyName, abbCompanyName: _abbCompanyName, index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
