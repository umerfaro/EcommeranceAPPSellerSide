import "package:emart_seller/const/const.dart";



Widget customButtonWidget({
  onPress,
  String? title,
  textColor,
  color,
  bool loading = false,
}) {
  return ElevatedButton(

    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: color,
      padding: const EdgeInsets.all(15),
    ),
    onPressed: loading ? null : onPress,
    child:loading ? const RepaintBoundary(
        child: CircularProgressIndicator(

          valueColor: AlwaysStoppedAnimation(white),
        ))   :  title!.text.color(textColor).fontFamily(bold).make(),
  );
}