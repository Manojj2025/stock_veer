import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:stock_veer/utils/app_basestyles.dart';

class CustomTable2 extends StatefulWidget {
  List<dynamic> category, headers;
  List<dynamic> alldata;
  // List<double> fy2021, fy2022, ttm;
  double containerHeight;
  CustomTable2(
      {Key? key,
      required this.headers,
      required this.alldata,
      required this.category,
      required this.containerHeight})
      : super(key: key);

  @override
  State<CustomTable2> createState() => _CustomTable2State();
}

class _CustomTable2State extends State<CustomTable2> {
  @override
  Widget build(BuildContext context) {
    print(widget.headers.length);
    return SizedBox(
      height: widget.category.length * widget.containerHeight +
          widget.containerHeight,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: List.generate(
                widget.category.length,
                (index) => Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.black54.withOpacity(0.1),
                          ),
                          bottom: BorderSide(
                            color: Colors.black54.withOpacity(0.1),
                          ),
                        ),
                      ),
                      width: 150,
                      height: widget.containerHeight,
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.category[index],
                        style: index == 0
                            ? BaseStyles.blackMedium14
                            : BaseStyles.blacNormal14,
                      ),
                    )),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(widget.headers.length, (index) {
                      return _getTitleItemWidget(
                          widget.headers[index].toString(), 120, index);
                    }),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTitleItemWidget(String label, double width, i) {
    return Column(
      children: [
        Container(
          width: width,
          height: widget.containerHeight,
          decoration: BoxDecoration(
              color: const Color(0xfff9fafc),
              border: Border(
                  right: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child:
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        Container(
          width: width,
          height: widget.containerHeight,
          decoration: BoxDecoration(
              color: const Color(0xfff9fafc),
              border: Border(
                  right: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Text(widget.alldata[i]['totalCurrentAssets'].toString(),
              style: const TextStyle(fontWeight: FontWeight.w400)),
        ),
        Container(
          width: width,
          height: widget.containerHeight,
          decoration: BoxDecoration(
              color: const Color(0xfff9fafc),
              border: Border(
                  right: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Text(widget.alldata[i]['totalNonCurrentAssets'].toString(),
              style: const TextStyle(fontWeight: FontWeight.w400)),
        ),
        Container(
          width: width,
          height: widget.containerHeight,
          decoration: BoxDecoration(
              color: const Color(0xfff9fafc),
              border: Border(
                  right: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Text(widget.alldata[i]['otherCurrentAssets'].toString(),
              style: const TextStyle(fontWeight: FontWeight.w400)),
        ),
        Container(
          width: width,
          height: widget.containerHeight,
          decoration: BoxDecoration(
              color: const Color(0xfff9fafc),
              border: Border(
                  right: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Text(widget.alldata[i]['totalCurrentLiabilities'].toString(),
              style: const TextStyle(fontWeight: FontWeight.w400)),
        ),
        Container(
          width: width,
          height: widget.containerHeight,
          decoration: BoxDecoration(
              color: const Color(0xfff9fafc),
              border: Border(
                  right: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Text(
              widget.alldata[i]['totalNonCurrentLiabilities'].toString(),
              style: const TextStyle(fontWeight: FontWeight.w400)),
        ),
        Container(
          width: width,
          height: widget.containerHeight,
          decoration: BoxDecoration(
              color: const Color(0xfff9fafc),
              border: Border(
                  right: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Text(widget.alldata[i]['totalLiabilities'].toString(),
              style: const TextStyle(fontWeight: FontWeight.w400)),
        ),
        Container(
          width: width,
          height: widget.containerHeight,
          decoration: BoxDecoration(
              color: const Color(0xfff9fafc),
              border: Border(
                  right: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Text(widget.alldata[i]['totalEquity'].toString(),
              style: const TextStyle(fontWeight: FontWeight.w400)),
        ),
        Container(
          width: width,
          height: widget.containerHeight,
          decoration: BoxDecoration(
              color: const Color(0xfff9fafc),
              border: Border(
                  right: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Text(
              widget.alldata[i]['totalLiabilitiesAndStockholdersEquity']
                  .toString(),
              style: const TextStyle(fontWeight: FontWeight.w400)),
        ),
        Container(
          width: width,
          height: widget.containerHeight,
          decoration: BoxDecoration(
              color: const Color(0xfff9fafc),
              border: Border(
                  right: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Text(widget.alldata[i]['commonStock'].toString(),
              style: const TextStyle(fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.black54.withOpacity(0.1),
          ),
          bottom: BorderSide(
            color: Colors.black54.withOpacity(0.1),
          ),
        ),
      ),
      width: 150,
      height: widget.containerHeight,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(widget.category[index]),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 120,
          height: widget.containerHeight,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          alignment: Alignment.centerLeft,
          child:
              Center(child: Text(widget.alldata[index]['revenue'].toString())),
        ),
        Container(
          width: 120,
          height: widget.containerHeight,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          alignment: Alignment.centerLeft,
          child:
              Center(child: Text(widget.alldata[index]['revenue'].toString())),
        ),
        Container(
          width: 120,
          height: widget.containerHeight,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          child:
              Center(child: Text(widget.alldata[index]['revenue'].toString())),
        ),
      ],
    );
  }
}
