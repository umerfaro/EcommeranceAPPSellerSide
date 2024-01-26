import "package:emart_seller/const/const.dart";

Widget customTextFormField2(
    {String? title,
      String? hint,
      BuildContext? context,
      FocusNode? myFocusNode,
      FormFieldSetter? onFiledSubmittedValue,
      FormFieldValidator? onValidateValue,
      TextEditingController? controller,
      bool? autoFocus= false,


    }) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: [
    title!.text.color(purpleColor).fontFamily(semibold).size(16).make(),
    TextFormField(

      onTapOutside: (event) {
        FocusScope.of(context!).unfocus();
      },
      maxLines: 4,


      controller: controller,
      onFieldSubmitted: onFiledSubmittedValue,
      validator: onValidateValue,
      autofocus: autoFocus!,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        hintText: hint,
        isDense: true,
        fillColor: lightGrey,
        hintStyle: const TextStyle(
          fontFamily: semibold,
          color: textfieldGrey,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: purpleColor),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: purpleColor),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: purpleColor),
        ),
        focusColor: purpleColor,

        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: textfieldGrey),
        ),
        border: InputBorder.none,
      ),
    ),
    5.heightBox,
  ]);
}
