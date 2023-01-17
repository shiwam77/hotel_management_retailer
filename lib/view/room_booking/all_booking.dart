import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:horizontal_data_table/refresh/hdt_refresh_controller.dart';
import 'package:hotel_management_retailer/theme.dart';
import 'package:hotel_management_retailer/view/report/data.dart';
import 'package:hotel_management_retailer/widgets/widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

enum SampleItem { Edit, Delete }


class AllBookings extends StatefulWidget {
  const AllBookings({Key? key}) : super(key: key);

  @override
  State<AllBookings> createState() => _AllBookingsState();
}

class _AllBookingsState extends State<AllBookings> {

  List<String> status = <String>[
    'Active',
    'Inactive',
  ];
  SampleItem? selectedMenu;
  final HDTRefreshController _hdtRefreshController = HDTRefreshController();
  final User user = User();

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
                  Text('Booking Reports',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Expanded(
              child : HorizontalDataTable(
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
      _getTitleItemWidget('Customer', 150),
      _getTitleItemWidget('Package', 150),
      _getTitleItemWidget('Booking', 150),
      _getTitleItemWidget('Room Type', 150),
      _getTitleItemWidget('Arrive', 150),
      _getTitleItemWidget('Payment', 150),
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
          child: Text("AB-357"),
        ),

        Container(
          width: 150,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text("Shiwam karn"),
        ),
        Container(
          width: 150,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text("Continental"),
        ),

        Container(
          width: 150,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text("Active"),
        ),

        Container(
          width: 150,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child:Text("Super Delux"),
        ),

        Container(
          width: 150,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text("10 Feb 2020"),
        ),
        Container(
          width: 150,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text("Paid"),
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
                  showContentDialog(context);
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
  void showContentDialog(BuildContext context) async {
    await showDialog<String?>(
      context: context,
      builder: (context) => Container(
        color:Colors.transparent,
        alignment: Alignment.center,
        child: Container(
          height: 400,
          width: 700,
          decoration:  BoxDecoration(
              color:Colors.white,
              border: Border.all(color: Colors.black.withAlpha(40),),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Stack(
            children: [
              Positioned(
                  right: 24,
                  top: 24,
                  child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.clear,size: 25,))),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24,left: 16),
                    child:  Text('Room Type',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                              fit: FlexFit.loose,
                              child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Room Name')),
                          Flexible(
                              fit: FlexFit.loose,
                              child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Room Rent')),
                        ],),
                      Row(
                        children: [
                          Flexible(
                              fit: FlexFit.loose,
                              child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Short Code')),
                          Flexible(
                              fit: FlexFit.loose,
                              child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Number Of Rooms')),
                        ],),
                      Row(
                        children: [
                          Flexible(
                              fit: FlexFit.loose,
                              child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Type')),
                          Flexible(
                            fit: FlexFit.loose,
                            child:  dropDown(label: "Gender",selectedValue: status[0],items: status,onChange: (value){}),),
                        ],),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            fluent.FilledButton(
                              child: const Text('Add Room Type'),
                              onPressed: () => Navigator.pop(context, 'User canceled dialog'),
                            ),
                            SizedBox(width: 50,),
                            fluent.Button(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context, 'User deleted file');
                                // Delete file here
                              },
                            ),

                          ],
                        ),
                      )

                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    setState(() {});
  }
}


