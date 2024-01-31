import 'package:emart_seller/Controller/product_Controller.dart';
import 'package:emart_seller/WidgetCommons/NormalText.dart';
import 'package:emart_seller/const/const.dart';
import 'package:get/get.dart';


Widget productDropdown(hint,List<String>list,dropValue,ProductController controller){
  return Obx(
    ()=> Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: fontGrey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          hint: normalText(
            text: hint,
            color: fontGrey,
          ),

          value: dropValue== ''? null : dropValue.value,
          items: list.map((e){
            return DropdownMenuItem(value: e,child: e.toString().text.make(),
            );
          }).toList(),
          onChanged: (newValue) {
            if(hint=="Category")
              {
                controller.subCategoryvalue.value="";
                controller.populateSubCategoriesList(newValue.toString());

              }
            dropValue.value= newValue.toString();
          },
        ),
      ),
    ),
  );
}