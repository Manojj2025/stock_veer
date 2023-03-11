// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:stock_veer/custom%20widgets/custom_stock_tile.dart';
// import 'package:stock_veer/utils/colors.dart';

// import '../../../stock info/stock_details.dart';

// class StockView extends StatelessWidget {
//   final List stocklist=[];
//    StockView({Key? key,required stocklist}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     print(stocklist.toString()+'mmm');
//     List<String> _companyName = [
//       'Tata Consultancy Services',
//       'TCM Ltd',
//       'Ecs Biztech Ltd',
//       'Has Lifestyle Ltd',
//       'PCS Technology',
//       'Has Lifestyle Ltd',
//       'Ecs Biztech Ltd',
//       'Has Lifestyle Ltd',
//       'Ecs Biztech Ltd',
//       'Has Lifestyle Ltd',
//       'Ecs Biztech Ltd',
//     ];

//     List<String> _abbCompanyName = [
//       'TCS',
//       'TCMLMTD',
//       'TCS',
//       'HAS JUICE',
//       'PCS',
//       'HAS JUICE',
//       'TCS',
//       'HAS JUICE',
//       'PCS',
//       'HAS JUICE',
//       'HAS JUICE',
//     ];

//     List<double> _stockPrice = [
//       3252.00,
//       44.50,
//       8.18,
//       44.50,
//       8.18,
//       44.50,
//       44.50,
//       8.18,
//       44.50,
//       8.18,
//       44.50,
//     ];

//     List<double> _percentPrice = [
//       0.25,
//       -4.71,
//       3.15,
//       0.25,
//       -4.71,
//       3.15,
//       0.25,
//       -4.71,
//       3.15,
//       -4.71,
//       3.15,
//     ];
//     return ListView.separated(
//       separatorBuilder: (context, index) {
//         return const SizedBox(
//           height: 9,
//         );
//       },
//       physics: const BouncingScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: _companyName.length,
//       itemBuilder: (context, index) {
//         return InkWell(
//             onTap: (){
//               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StockDetails(
//                 companyName:_companyName[index],
//                 stockPrice:_stockPrice[index],
//                 percent:_percentPrice[index],
//               )));
//             },
//             child: CustomStockTile(companyName: _companyName, abbCompanyName: _abbCompanyName, index: index));
//       },
//     );
//   }
// }
