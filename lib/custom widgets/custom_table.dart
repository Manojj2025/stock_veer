import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';


class CustomTable extends StatefulWidget {
  List<String> category,headers;
  List<double> fy2021,fy2022,ttm;
  double containerHeight;
  CustomTable({Key? key,required this.headers,required this.category,required this.fy2021,required this.fy2022,required this.ttm,required this.containerHeight}) : super(key: key);

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.category.length*widget.containerHeight+widget.containerHeight,
      width: double.infinity,
      child: HorizontalDataTable(
        // isFixedFooter: true,
        elevation: 0,
        horizontalScrollPhysics: const BouncingScrollPhysics(),
        scrollPhysics: const BouncingScrollPhysics(),
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 360,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: widget.category.length,
      ),
    );
  }


  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget(widget.headers[0], 100),
      _getTitleItemWidget(widget.headers[1], 120),
      _getTitleItemWidget(widget.headers[2], 120),
      _getTitleItemWidget(widget.headers[3], 120),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: widget.containerHeight,
      decoration: BoxDecoration(color: const Color(0xfff9fafc), border: Border(right: BorderSide(color: Colors.black54.withOpacity(0.1)))),
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
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
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          alignment: Alignment.centerLeft,
          child: Center(child: Text(widget.fy2021[index].toString())),
        ),
        Container(
          width: 120,
          height: widget.containerHeight,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          alignment: Alignment.centerLeft,
          child: Center(child: Text(widget.fy2022[index].toString())),
        ),
        Container(
          width: 120,
          height: widget.containerHeight,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black54.withOpacity(0.1)))),
          child: Center(child: Text(widget.ttm[index].toString())),
        ),
      ],
    );
  }
}
