import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:hotel_management_retailer/theme.dart';
import 'package:hotel_management_retailer/widgets/widget.dart';
import 'package:responsive_builder/responsive_builder.dart';


class EditRoom extends StatefulWidget {
  const EditRoom({Key? key}) : super(key: key);

  @override
  State<EditRoom> createState() => _EditRoomState();
}

class _EditRoomState extends State<EditRoom> {

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController totalPersonController = TextEditingController();
  TextEditingController notePersonController = TextEditingController();
  TextEditingController maleCountController = TextEditingController();
  TextEditingController femaleCountController = TextEditingController();
  TextEditingController childCountController = TextEditingController();
  TextEditingController photoNameController = TextEditingController();
  DateTime? simpleTime;
  List<String> packages = <String>[
    'Starter Package',
    'BirthDay Package'
  ];
  List<String> genders = <String>[
    'Male',
    'Female',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('Add Booking')),
      children:  [

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration:  BoxDecoration(
                color:material.Colors.white,
                border: Border.all(color: material.Colors.black.withAlpha(40))
            ),
            child: ScreenTypeLayout(
              mobile: mblView(),
              tablet: tabletView(),
              desktop: deskTopView(),
            ),
          ),
        )

      ],
    );
  }

  Widget mblView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textField(controller: nameController,onChange: (value){}, label: 'First Name'),
        textField(controller: lastNameController,onChange: (value){}, label: 'Last Name'),
        dropDown(label: "Gender",selectedValue: genders[0],items: genders,onChange: (value){}),
        textField(controller: phoneController,onChange: (value){}, label: 'Phone'),
        textField(controller: emailController,onChange: (value){}, label: 'Email Address'),
        textField(controller: addressController,onChange: (value){}, label: 'Address'),
        filePicker(label: 'Upload Photo',controller:photoNameController,onChange: (value){}),
        dropDown(label: "Select An Packages",selectedValue: packages[0],items: packages,onChange: (value){}),
        dropDown(label: "Select Room Type",selectedValue: packages[0],items: packages,onChange: (value){}),
        datePicker(label: "Arrived Time",onChanged: (time){}),
        datePicker(label: "Depart Time",onChanged: (time){}),
        textField(controller: maleCountController,onChange: (value){}, label: 'Total Male'),
        textField(controller: femaleCountController,onChange: (value){}, label: 'Total Female'),
        textField(controller: childCountController,onChange: (value){}, label: 'Total Children'),
        textField(controller: totalPersonController,onChange: (value){}, label: 'Total Person'),
        textField(controller: notePersonController,onChange: (value){}, label: 'Notes'),
        submitButton()

      ],
    );
  }

  Widget tabletView(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
                fit: FlexFit.loose,
                child: textField(controller: nameController,onChange: (value){}, label: 'First Name')),
            Flexible(
                fit: FlexFit.loose,
                child: textField(controller: lastNameController,onChange: (value){}, label: 'Last Name')),
          ],),

        Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child:  dropDown(label: "Gender",selectedValue: genders[0],items: genders,onChange: (value){}),),
            Flexible(
              fit: FlexFit.loose,
              child: textField(controller: phoneController,onChange: (value){}, label: 'Phone'),),
          ],),

        Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child:  textField(controller: emailController,onChange: (value){}, label: 'Email Address'),),
            Flexible(
              fit: FlexFit.loose,
              child:  textField(controller: addressController,onChange: (value){}, label: 'Address'),),
          ],),

        Row(
          children: [
            Flexible(
                fit: FlexFit.loose,
                child: filePicker(label: 'Upload Photo',controller:photoNameController,onChange: (value){})),
            Flexible(
              fit: FlexFit.loose,
              child:dropDown(label: "Select An Packages",selectedValue: packages[0],items: packages,onChange: (value){}),),
          ],),

        Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child:dropDown(label: "Select Room Type",selectedValue: packages[0],items: packages,onChange: (value){}),),
            Flexible(
              fit: FlexFit.loose,
              child:datePicker(label: "Arrived Time",onChanged: (time){}),),
          ],),

        Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child:datePicker(label: "Depart Time",onChanged: (time){}),),
            Flexible(
              fit: FlexFit.loose,
              child: textField(controller: maleCountController,onChange: (value){}, label: 'Total Male'),),
          ],),

        Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child:textField(controller: femaleCountController,onChange: (value){}, label: 'Total Female'),),
            Flexible(
              fit: FlexFit.loose,
              child: textField(controller: childCountController,onChange: (value){}, label: 'Total Children'), ),
          ],),
        Flexible(
          fit: FlexFit.loose,
          child: textField(controller: totalPersonController,onChange: (value){}, label: 'Total Person'),),
        textField(controller: notePersonController,onChange: (value){}, label: 'Notes'),
        submitButton()

      ],
    );
  }

  Widget deskTopView(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
                fit: FlexFit.loose,
                child: textField(controller: nameController,onChange: (value){}, label: 'First Name')),
            Flexible(
                fit: FlexFit.loose,
                child: textField(controller: lastNameController,onChange: (value){}, label: 'Last Name')),
            Flexible(
              fit: FlexFit.loose,
              child:  dropDown(label: "Gender",selectedValue: genders[0],items: genders,onChange: (value){}),),
          ],),

        Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: textField(controller: phoneController,onChange: (value){}, label: 'Phone'),),
            Flexible(
              fit: FlexFit.loose,
              child:  textField(controller: emailController,onChange: (value){}, label: 'Email Address'),),
            Flexible(
              fit: FlexFit.loose,
              child:  textField(controller: addressController,onChange: (value){}, label: 'Address'),),
          ],),

        Row(
          children: [
            Flexible(
                fit: FlexFit.loose,
                child: filePicker(label: 'Upload Photo',controller:photoNameController,onChange: (value){})),
            Flexible(
              fit: FlexFit.loose,
              child:dropDown(label: "Select An Packages",selectedValue: packages[0],items: packages,onChange: (value){}),),
            Flexible(
              fit: FlexFit.loose,
              child:dropDown(label: "Select Room Type",selectedValue: packages[0],items: packages,onChange: (value){}),),
          ],),

        Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child:datePicker(label: "Arrived Time",onChanged: (time){}),),
            Flexible(
              fit: FlexFit.loose,
              child:datePicker(label: "Depart Time",onChanged: (time){}),),
            Flexible(
              fit: FlexFit.loose,
              child: textField(controller: maleCountController,onChange: (value){}, label: 'Total Male'),),
          ],),

        Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child:textField(controller: femaleCountController,onChange: (value){}, label: 'Total Female'),),
            Flexible(
              fit: FlexFit.loose,
              child: textField(controller: childCountController,onChange: (value){}, label: 'Total Children'), ),
            Flexible(
              fit: FlexFit.loose,
              child: textField(controller: totalPersonController,onChange: (value){}, label: 'Total Person'),),
          ],),
        textField(controller: notePersonController,onChange: (value){}, label: 'Notes'),
        submitButton()

      ],
    );
  }

}
