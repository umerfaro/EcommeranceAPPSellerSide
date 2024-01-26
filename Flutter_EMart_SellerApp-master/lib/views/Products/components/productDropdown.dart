import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';


Widget productDropdown(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: fontGrey),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        hint: normalText(
          text: "Select Category",
          color: fontGrey,
        ),
        value: null,
        items: <String>['A', 'B', 'C', 'D'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,style: const TextStyle(color: fontGrey),),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    ),
  );
}