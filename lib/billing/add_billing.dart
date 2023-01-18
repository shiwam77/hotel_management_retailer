import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:hotel_management_retailer/widgets/widget.dart';


class CreateBilling extends StatefulWidget {
  const CreateBilling({Key? key}) : super(key: key);

  @override
  State<CreateBilling> createState() => _CreateBillingState();
}

class _CreateBillingState extends State<CreateBilling> {
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
       child: Padding(
         padding: const EdgeInsets.all(5.0),
         child: Column(
           children: [
             Container(
               decoration:  const BoxDecoration(
                   color:Colors.white,

               ),
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                 child: Column(
                   children: [
                     Container(
                       decoration:  BoxDecoration(
                           color: Colors.white,
                           border: Border.all(color: Colors.black.withAlpha(40))
                       ),
                       child: Column(
                         children: [
                           SizedBox(height: 8,),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                             child: Row(
                               children: [
                                 Expanded(
                                   flex:1,
                                   child: Row(
                                     children: [
                                       subtitle(
                                         content:  Text("Bill TO",style: const TextStyle(fontSize: 12),),
                                       ),
                                       SizedBox(width: 30,),
                                       Flexible(
                                         fit: FlexFit.loose,
                                         child: fluent.TextBox(
                                           expands: false,
                                           controller:TextEditingController(),
                                           maxLines: null,
                                           onChanged: (value){

                                           },
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                                 SizedBox(width: 100,),
                                 Expanded(
                                   child: Row(
                                     children: [
                                       subtitle(
                                         content:  Text("Invoice",style: const TextStyle(fontSize: 12),),
                                       ),
                                       SizedBox(width: 30,),
                                       Flexible(
                                         fit: FlexFit.loose,
                                         child: fluent.TextBox(
                                           expands: false,
                                           controller:TextEditingController(),
                                           maxLines: null,
                                           onChanged: (value){

                                           },
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                             child: Row(
                               children: [
                                 Expanded(
                                   child: Row(
                                     children: [
                                       subtitle(
                                         content:  Text("Address",style: const TextStyle(fontSize: 12),),
                                       ),
                                       SizedBox(width: 30,),
                                       Flexible(
                                         fit: FlexFit.loose,
                                         child: fluent.TextBox(
                                           expands: false,
                                           controller:TextEditingController(),
                                           maxLines: null,
                                           onChanged: (value){

                                           },
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                                 SizedBox(width: 100,),
                                 Expanded(
                                   child: Row(
                                     children: [
                                       subtitle(
                                         content:  Text("Invoice Date",style: const TextStyle(fontSize: 12),),
                                       ),
                                       SizedBox(width: 30,),
                                       Flexible(
                                           fit: FlexFit.loose,
                                         child: fluent.DatePicker(
                                           selected: DateTime.now(),
                                           onChanged: (time) {

                                           },
                                         )
                                         ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                             child:  Expanded(
                               child: Row(
                                 children: [
                                   subtitle(
                                     content:  Text("Invoice For",style: const TextStyle(fontSize: 12),),
                                   ),
                                   SizedBox(width: 30,),
                                   Expanded(
                                     child: fluent.TextBox(
                                       expands: false,
                                       controller:TextEditingController(),
                                       maxLines: null,
                                       onChanged: (value){

                                       },
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           SizedBox(height: 8,),
                         ],
                       ),
                     ),
                     const SizedBox(height: 10,),
                     Container(
                       decoration:  BoxDecoration(
                           color: Colors.white,
                           border: Border.all(color: Colors.black.withAlpha(40))
                       ),
                       child:Column(
                         mainAxisSize: MainAxisSize.min,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Flexible(
                                   fit: FlexFit.loose,
                                   child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Items Name')),
                               Flexible(
                                   fit: FlexFit.loose,
                                   child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Qty/Kg')),
                               Flexible(
                                   fit: FlexFit.loose,
                                   child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Unit Price')),
                               Flexible(
                                   fit: FlexFit.loose,
                                   child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Discount')),
                               Flexible(
                                   fit: FlexFit.loose,
                                   child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Total')),

                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                                 child: fluent.FilledButton(
                                   child: const Text('Add'),
                                   onPressed: (){

                                   },
                                 ),
                               )
                             ],),



                         ],
                       )
                     ),
                     Container(
                       decoration:  BoxDecoration(
                           color: Colors.white,
                           border: Border.all(color: Colors.black.withAlpha(40))
                       ),
                       child:Column(
                         mainAxisSize: MainAxisSize.min,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Flexible(
                                   fit: FlexFit.loose,
                                   child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Items Name')),
                               Flexible(
                                   fit: FlexFit.loose,
                                   child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Qty/Kg')),
                               Flexible(
                                   fit: FlexFit.loose,
                                   child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Unit Price')),
                               Flexible(
                                   fit: FlexFit.loose,
                                   child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Discount')),
                               Flexible(
                                   fit: FlexFit.loose,
                                   child: textField(controller: TextEditingController(),onChange: (value){}, label: 'Total')),

                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                                 child: fluent.FilledButton(
                                   child: const Text('Add'),
                                   onPressed: (){

                                   },
                                 ),
                               )
                             ],),



                         ],
                       )
                     ),
                   ],
                 ),
               ),
             ),
           ],
         ),
       ),
     ),
    );
  }

  Widget textField({required String label,required TextEditingController controller,required Function onChange}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: subtitle(
              content:  Text(label,style: const TextStyle(fontSize: 15),),
            ),
          ),
          const SizedBox(height: 5,),
          fluent.TextBox(
            expands: false,
            controller:controller,
            maxLines: null,
            onChanged: (value){
              onChange(value);
            },
          ),
        ],
      ),
    );
  }


}
