import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:hotel_management_retailer/theme.dart';
import 'package:hotel_management_retailer/widgets/widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

enum SampleItem { Edit, Delete }


class RoomTypes extends StatefulWidget {
  const RoomTypes({Key? key}) : super(key: key);

  @override
  State<RoomTypes> createState() => _RoomTypesState();
}

class _RoomTypesState extends State<RoomTypes> {

  List<String> status = <String>[
    'Active',
    'Inactive',
  ];
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: fluent.ScaffoldPage.scrollable(
          header: fluent.PageHeader(title: Text('Room Type'),
              commandBar: GestureDetector(
                onTap: () async{
                  showContentDialog(context);
                },
                child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
          ),
              )),
          children:  [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 600,
                decoration:  BoxDecoration(
                    color:Colors.white,
                    border: Border.all(color: Colors.black.withAlpha(40))
                ),
                child: ScreenTypeLayout.builder(
                  mobile: (BuildContext context) => mblView(),
                  tablet: (BuildContext context) => deskTopView(),
                  desktop: (BuildContext context) => deskTopView(),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget deskTopView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          fit:FlexFit.loose,
          child: Container(
            height: 50,
            decoration:   BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xff121212).withOpacity(.12)),
                bottom: BorderSide(width: 1.0, color:Color(0xff121212).withOpacity(.12)),
              ),

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  fluent.Checkbox(
                      checked: false,
                      onChanged: (value){}
                  ),

                  SizedBox(
                      width: 50,child: Text("##",style: const TextStyle(fontSize: 12),)),


                  SizedBox(
                      width: 50,child: Text("Name",style: const TextStyle(fontSize: 12),)),


                  SizedBox(
                      width: 50,child: Text("Rent (Basic)",style: const TextStyle(fontSize: 12),)),


                  SizedBox(
                      width: 50,child: Text("Code",style: const TextStyle(fontSize: 12),)),

                  SizedBox(
                      width:50,child: Text("Rooms Count",style: const TextStyle(fontSize: 12),)),

                  SizedBox(
                    width: 150,
                    child: Text("Types",style: const TextStyle(fontSize: 12),),),

                  SizedBox(
                      width: 50,child: Text("Status",style: TextStyle(fontSize: 12),)),

                  Icon(Icons.more_horiz_outlined,color: Colors.black38,),
                ],
              ),
            ),
          ),
        ),
        Flexible(
            fit:FlexFit.loose,
            child: ListView.separated(
              separatorBuilder:(context,index){
                return  const Divider();
              },
              itemCount: 7,
              itemBuilder: (context,index){
                return   Container(
                  height: 50,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        fluent.Checkbox(
                            checked: true,
                            onChanged: (value){}
                        ),

                        SizedBox(
                            width: 50,
                            child: Text("0$index",style: const TextStyle(fontSize: 12),)),


                        SizedBox(
                            width: 50,
                            child: Text("Single",style: const TextStyle(fontSize: 12),)),


                        SizedBox(
                            width: 50,
                            child: Text("Rs 2000",style: const TextStyle(fontSize: 12),)),


                        SizedBox(
                            width: 50,
                            child: Text("SR",style: const TextStyle(fontSize: 12),)),

                        SizedBox(
                            width: 50,
                            child: Text("60",style: const TextStyle(fontSize: 12),)),

                        SizedBox(
                          width: 150,
                          child: Row(
                            children: [
                              Icon(Icons.star,color: Colors.amber,),
                              Icon(Icons.star,color: Colors.amber,),
                              Icon(Icons.star,color: Colors.amber,),
                              Icon(Icons.star,color: Colors.amber,)
                            ],),),

                        SizedBox(
                            width: 50,
                            child: Text("active",style: const TextStyle(fontSize: 12),)),

                        SizedBox(
                          width: 50,
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
                    ),
                  ),
                );
              },
            )
        )
      ],
    );
  }

  Widget mblView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          fit:FlexFit.loose,
          child: Container(
            height: 50,
            decoration:   BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xff121212).withOpacity(.12)),
                bottom: BorderSide(width: 1.0, color:Color(0xff121212).withOpacity(.12)),
              ),

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  fluent.Checkbox(
                      checked: false,
                      onChanged: (value){}
                  ),

                  SizedBox(
                      width: 50,child: Text("##",style: const TextStyle(fontSize: 12),)),


                  SizedBox(
                      width: 50,child: Text("Name",style: const TextStyle(fontSize: 12),)),


                  SizedBox(
                      width: 50,child: Text("Status",style: TextStyle(fontSize: 12),)),

                  Icon(Icons.more_horiz_outlined,color: Colors.black38,),
                ],
              ),
            ),
          ),
        ),
        Flexible(
            fit:FlexFit.loose,
            child: ListView.separated(
              separatorBuilder:(context,index){
                return  const Divider();
              },
              itemCount: 7,
              itemBuilder: (context,index){
                return   Container(
                  height: 50,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        fluent.Checkbox(
                            checked: true,
                            onChanged: (value){}
                        ),

                        SizedBox(
                            width: 50,
                            child: Text("0$index",style: const TextStyle(fontSize: 12),)),


                        SizedBox(
                            width: 50,
                            child: Text("Single",style: const TextStyle(fontSize: 12),)),


                        SizedBox(
                            width: 50,
                            child: Text("active",style: const TextStyle(fontSize: 12),)),


                        SizedBox(
                          width: 50,
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
        )
      ],
    );
  }

  Widget tabletView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          fit:FlexFit.loose,
          child: Container(
            height: 50,
            decoration:   BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xff121212).withOpacity(.12)),
                bottom: BorderSide(width: 1.0, color:Color(0xff121212).withOpacity(.12)),
              ),

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  fluent.Checkbox(
                      checked: false,
                      onChanged: (value){}
                  ),

                  SizedBox(
                      width: 50,child: Text("##",style: const TextStyle(fontSize: 12),)),


                  SizedBox(
                      width: 50,child: Text("Name",style: const TextStyle(fontSize: 12),)),


                  SizedBox(
                      width: 50,child: Text("Rent (Basic)",style: const TextStyle(fontSize: 12),)),


                  SizedBox(
                      width: 50,child: Text("Code",style: const TextStyle(fontSize: 12),)),

                  SizedBox(
                      width:50,child: Text("Rooms Count",style: const TextStyle(fontSize: 12),)),

                  SizedBox(
                    width: 90,
                    child: Text("Types",style: const TextStyle(fontSize: 12),),),

                  SizedBox(
                      width: 50,child: Text("Status",style: TextStyle(fontSize: 12),)),

                  Icon(Icons.more_horiz_outlined,color: Colors.black38,),
                ],
              ),
            ),
          ),
        ),
        Flexible(
            fit:FlexFit.loose,
            child: ListView.separated(
              separatorBuilder:(context,index){
                return  const Divider();
              },
              itemCount: 7,
              itemBuilder: (context,index){
                return   Container(
                  height: 50,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        fluent.Checkbox(
                            checked: true,
                            onChanged: (value){}
                        ),

                        SizedBox(
                            width: 50,
                            child: Text("0$index",style: const TextStyle(fontSize: 12),)),


                        SizedBox(
                            width: 50,
                            child: Text("Single",style: const TextStyle(fontSize: 12),)),


                        SizedBox(
                            width: 50,
                            child: Text("Rs 2000",style: const TextStyle(fontSize: 12),)),


                        SizedBox(
                            width: 50,
                            child: Text("SR",style: const TextStyle(fontSize: 12),)),

                        SizedBox(
                            width: 50,
                            child: Text("60",style: const TextStyle(fontSize: 12),)),

                        SizedBox(
                          width: 90,
                          child: Row(
                            children: [
                              Icon(Icons.star,color: Colors.amber,),
                              Icon(Icons.star,color: Colors.amber,),
                              Icon(Icons.star,color: Colors.amber,),
                              Icon(Icons.star,color: Colors.amber,)
                            ],),),

                        SizedBox(
                            width: 50,
                            child: Text("active",style: const TextStyle(fontSize: 12),)),

                        SizedBox(
                          width: 50,
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
        )
      ],
    );
  }

  void showContentDialog(BuildContext context) async {
      await showDialog<String>(
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


