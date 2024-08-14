import 'package:emart_app/consts/consts.dart';

Widget fututeButton({String? title, icon,}) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 70,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .width(200)
      .margin (const EdgeInsets.symmetric(horizontal: 4))
      .white
      .rounded
      .outerShadowSm
      .padding(const EdgeInsets.all(4))
      .make();
}
