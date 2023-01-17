import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../room_booking/all_booking.dart';
import 'data.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;




class ExpenseList extends StatefulWidget {
  const ExpenseList({
    Key? key,
  }) : super(key: key);


  @override
  State<ExpenseList> createState() =>
      _ExpenseListState();
}

class _ExpenseListState
    extends State<ExpenseList> {
  final HDTRefreshController _hdtRefreshController = HDTRefreshController();
  final User user = User();
  SampleItem? selectedMenu;


  @override
  void initState() {
    user.initData(100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        ///since pull to refresh only works on drag action
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: Column(
          children: [
            SizedBox(height: 24,),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 24,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Expenses List',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Expanded(
              child: HorizontalDataTable(
                leftHandSideColumnWidth: 100,
                rightHandSideColumnWidth: 1200,
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(),
                leftSideItemBuilder: _generateFirstColumnRow,
                rightSideItemBuilder: _generateRightHandSideColumnRow,
                itemCount: user.userInfo.length,
                rowSeparatorWidget: const Divider(
                  color: Colors.black54,
                  height: 1.0,
                  thickness: 0.0,
                ),
                leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
                rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
                enablePullToRefresh: true,
                refreshIndicator: const ClassicHeader(),
                fixedSidePlaceHolderRefreshIndicator: const PlaceholderHeader(),
                refreshIndicatorHeight: 60,
                onRefresh: () async {
                  debugPrint('onRefresh');
                  //Do sth
                  await Future.delayed(const Duration(milliseconds: 500));
                  _hdtRefreshController.refreshCompleted();
                },
                enablePullToLoadNewData: true,
                loadIndicator: const ClassicFooter(),
                fixedSidePlaceHolderLoadIndicator: const PlaceholderFooter(),
                onLoad: () async {
                  debugPrint('onLoad');
                  //Do sth
                  await Future.delayed(const Duration(milliseconds: 500));
                  _hdtRefreshController.loadComplete();
                },
                htdRefreshController: _hdtRefreshController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      Container(
        width: 100,
        height: 56,
        alignment: Alignment.center,
        child: fluent.Checkbox(
            checked: false,
            onChanged: (value){}
        ),
      ),
      _getTitleItemWidget('Id', 100),
      _getTitleItemWidget('Supplier Name', 200),
      _getTitleItemWidget('Description', 200),
      _getTitleItemWidget('Date', 200),
      _getTitleItemWidget('Amount', 200),
      Container(
        width: 100,
        height: 56,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child:  Icon(Icons.more_horiz_outlined,color: Colors.black38,),
      ),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return  Container(
      width: 50,
      height: 56,
      alignment: Alignment.center,
      child: fluent.Checkbox(
          checked: false,
          onChanged: (value){}
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text("#565601"),
        ),
        Container(
          width: 200,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text("XYY Enterprise"),
        ),
        Container(
          width: 200,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text("Internet Bill"),
        ),

        Container(
          width: 200,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text("01 Jan 2021"),
        ),

        Container(
          width: 200,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child:Text("Rs1229.99"),
        ),

        Container(
          width: 100,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: PopupMenuButton<SampleItem>(
            initialValue: selectedMenu,
            // Callback that sets the selected popup menu item.
            onSelected: (SampleItem item) {
              setState(() {
                selectedMenu = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              PopupMenuItem<SampleItem>(
                value: SampleItem.Edit,
                onTap: () async {

                },
                child: Text('Edit'),
              ),
              PopupMenuItem<SampleItem>(
                value: SampleItem.Delete,
                child: Text('Delete'),
                onTap: () async {

                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}