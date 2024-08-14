import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:emart_app/pages/home_screen/home.dart';

import 'package:emart_app/widgets_common/app_logo_widget.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_text_field.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  // text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgWidgdet(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Join The $appname".text.white.size(18).make(),
            15.heightBox,
            Column(
              children: [
                customTextField(
                  isPass: false,
                  title: name,
                  hint: nameHint,
                  controller: nameController,
                ),
                customTextField(
                  isPass: false,
                  title: email,
                  hint: emailHint,
                  controller: emailController,
                ),
                customTextField(
                    isPass: true,
                    title: password,
                    hint: passwordHint,
                    controller: passwordController),
                customTextField(
                  isPass: true,
                  title: reTyoePassword,
                  hint: reTypepassHint,
                  controller: passwordRetypeController,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: forgetPassword.text.make()),
                ),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                        checkColor: redColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        }),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "I agree to the",
                              style:
                                  TextStyle(fontFamily: bold, color: fontGrey),
                            ),
                            TextSpan(
                              text: privecyPolicy,
                              style:
                                  TextStyle(fontFamily: bold, color: redColor),
                            ),
                            TextSpan(
                              text: tramsCondation,
                              style:
                                  TextStyle(fontFamily: bold, color: fontGrey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                5.heightBox,
                ourButton(
                    title: signup,
                    color: isCheck == true ? redColor : lightGrey,
                    textColor: whiteColor,
                    onPress: () async {
                      if (isCheck != false) {
                        try {
                          await controller
                              .signupMethon(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            return controller.storeUSerData(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text);
                          }).then((value) {
                            VxToast.show(context, msg: loggedin);
                            Get.offAll(() => const Home());
                          });
                        } catch (e) {
                          auth.signOut();
                          // ignore: use_build_context_synchronously
                          VxToast.show(context, msg: e.toString());
                        }
                      }
                    }).box.white.rounded.width(context.screenWidth - 50).make(),
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
                .make(),
            10.heightBox,
            // wrap with gusterdetector
            RichText(
              text: const TextSpan(children: [
                TextSpan(
                  text: alreadyHaveAnAccount,
                  style: TextStyle(
                    fontFamily: bold,
                    color: fontGrey,
                  ),
                ),
                TextSpan(
                  text: login,
                  style: TextStyle(
                    fontFamily: bold,
                    color: redColor,
                  ),
                ),
              ]),
            ).onTap(() {
              Get.back();
            }),
          ],
        ),
      ),
    ));
  }
}
