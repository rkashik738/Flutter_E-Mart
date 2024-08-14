import 'package:emart_app/consts/consts.dart';

Widget detalisCart({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.semiBold.color(darkFontGrey).make()
    ],
  ).box.white.rounded.width(width).height(60).padding(EdgeInsets.all(4)).make();
}
