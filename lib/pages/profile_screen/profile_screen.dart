import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/pages/auth_screen/login_screen.dart';
import 'package:emart_app/pages/profile_screen/component/detils_cart.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidgdet(
        child: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // edit prifile button
            const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.edit,
                  color: whiteColor,
                )).onTap(() {}),

            //
            Row(
              children: [
                Image.asset(
                  imgProfile2,
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.widthBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy User".text.fontFamily(semibold).white.make(),
                      "custome@email.com".text.white.make()
                    ],
                  ),
                ),
                OutlinedButton(
                    onPressed: () async {
                      await Get.put(AuthController()).signOutMrthod(context);
                      Get.offAll(() => const LoginScreen());
                    },
                    child: "Log Out".text.fontFamily(semibold).white.make())
              ],
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detalisCart(
                  count: "00",
                  title: "In Your Cart",
                  width: context.screenWidth / 3.5,
                ),
                detalisCart(
                  count: "23",
                  title: "WishList",
                  width: context.screenWidth / 3.5,
                ),
                detalisCart(
                  count: "07",
                  title: "Your Order",
                  width: context.screenWidth / 3.5,
                ),
              ],
            ),

            40.heightBox,

            // button section
            ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: lightGrey,
                      );
                    },
                    itemCount: profileButtomList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: "${profileButtomList[index]}".text.make(),
                      );
                    })
                .box
                .white
                .rounded
                .shadowSm
                .padding(EdgeInsets.symmetric(horizontal: 8))
                .make(),
          ],
        ),
      ),
    ));
  }
}
