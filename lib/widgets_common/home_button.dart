import 'package:emart_app/consts/consts.dart';

Widget homeButton({width, height, icon, String? title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 36,
      ),
      10.heightBox,
      title!.text.semiBold.color(darkFontGrey).make()
    ],
  ).box.rounded.white.size(width, height).shadow.make();
}
