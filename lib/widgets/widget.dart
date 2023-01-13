import 'package:fluent_ui/fluent_ui.dart';

Widget subtitle({required Widget content}) {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 14.0, bottom: 2.0),
      child: DefaultTextStyle(
        style: FluentTheme.of(context).typography.subtitle!,
        child: content,
      ),
    );
  });
}

Widget submitButton(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    child: FilledButton(
      child: const Text('Add Booking'),
      onPressed: (){

      },
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
        TextBox(
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

Widget datePicker({required String label,required Function onChanged, DateTime? simpleTime}){
  return  Padding(
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
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: DatePicker(
            selected: simpleTime,
            onChanged: (time) {
              onChanged(time);
            },
          ),
        ),
      ],
    ),
  );
}

Widget dropDown({required String label,required String selectedValue, required List<String> items,required Function onChange }){
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
        ComboBox<String>(
          isExpanded: true,
          value: selectedValue,
          items: items.map<ComboBoxItem<String>>((e) {
            return ComboBoxItem<String>(
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: (value){
            onChange(value);
          },
          placeholder: const Text('Select a cat breed'),
        ),
      ],
    ),
  );
}

Widget filePicker({required String label,required TextEditingController controller,required Function onChange} ){
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
        Row(
          children: [
            Flexible(
              child: TextBox(
                expands: false,
                readOnly: true,
                controller:controller,
                maxLines: 1,
                onChanged: (value){
                  onChange(value);
                },
              ),
            ),
            FilledButton(
              child: const Text("Browse"),
              onPressed: (){

              },
            ),
          ],
        ),

      ],
    ),
  );
}