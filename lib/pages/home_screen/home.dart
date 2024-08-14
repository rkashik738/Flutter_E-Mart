import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/home_controller.dart';
import 'package:emart_app/pages/cart_screen/cart_screen.dart';
import 'package:emart_app/pages/categories/categories_screen.dart';
import 'package:emart_app/pages/home_screen/home_screen.dart';
import 'package:emart_app/pages/profile_screen/profile_screen.dart';

import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navBarItem = [
      BottomNavigationBarItem(
        label: home,
        icon: Image.asset(
          icHome,
          width: 26,
        ),
      ),
      BottomNavigationBarItem(
        label: category,
        icon: Image.asset(
          icCategories,
          width: 26,
        ),
      ),
      BottomNavigationBarItem(
        label: cart,
        icon: Image.asset(
          icCart,
          width: 26,
        ),
      ),
      BottomNavigationBarItem(
        label: profile,
        icon: Image.asset(
          icProfile,
          width: 26,
        ),
      ),
    ];

    var navBody = [
      const HomeScreen(),
      const Categories(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
            currentIndex: controller.currentNavIndex.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: redColor,
            backgroundColor: whiteColor,
            items: navBarItem),
      ),
    );
  }
}
