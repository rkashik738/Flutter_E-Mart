import 'package:emart_app/consts/consts.dart';

import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/pages/auth_screen/sign_up_Screen.dart';

import 'package:emart_app/widgets_common/app_logo_widget.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_text_field.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

import '../home_screen/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //
    var controller = Get.put(AuthController());
    // text controller

    return bgWidgdet(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Log in to $appname".text.white.size(18).make(),
            15.heightBox,
            Column(
              children: [
                customTextField(
                    title: email,
                    hint: emailHint,
                    isPass: false,
                    controller: controller.emailController),
                customTextField(
                  title: password,
                  hint: passwordHint,
                  isPass: true,
                  controller: controller.passwordController,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: forgetPassword.text.make()),
                ),
                5.heightBox,
                ourButton(
                  title: login,
                  color: redColor,
                  textColor: whiteColor,
                  onPress: () async {
                    controller.loginMethon(context: context).then((value) {
                      if (value != null) {
                        VxToast.show(context, msg: loggedin);
                        Get.offAll(() =>const Home());
                      }
                    });
                  },
                ).box.white.rounded.width(context.screenWidth - 50).make(),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
                ourButton(
                    title: signup,
                    color: redColor,
                    textColor: whiteColor,
                    onPress: () {
                      Get.to(() => const SignUpScreen());
                    }).box.white.rounded.width(context.screenWidth - 50).make(),
                5.heightBox,
                loginWith.text.color(fontGrey).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: lightGrey,
                        child: Image.asset(socialIconList[index]),
                      ),
                    ),
                  ),
                ),
              ],
            )
                .box
                .white
                .rounded
                .padding(
                  const EdgeInsets.all(16),
                )
                .width(context.screenWidth - 70)
                .shadowSm
                .make()
          ],
        ),
      ),
    ));
  }
}
