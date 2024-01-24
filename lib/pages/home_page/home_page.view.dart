import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/pages/chef_view/chef_view.view.dart';
import 'package:hotel_app/pages/dashboard_page/dashboard_page.view.dart';
import 'package:hotel_app/pages/home_page/home_page.controller.dart';
import 'package:hotel_app/pages/login_page/login_page.view.dart';
import 'package:hotel_app/pages/menu_pages/menu_pages.view.dart';
import 'package:hotel_app/services/auth_services.dart';
import 'package:flutter/cupertino.dart';

class HomePageView extends GetResponsiveView<HomePageController> {
  HomePageView({super.key}) {
    Get.lazyPut(() => HomePageController());
  }

  final List<Widget> _screens = [
    DashBoardPage(),
    MenuPageView(),
    ChefViewPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Login Page',
        home: Obx(() => Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 47, 47, 47),
                title: Text(controller.currentIndex.value == 0
                    ? 'Order page'
                    : controller.currentIndex.value == 1
                        ? 'Menu page'
                        : 'Chef page'),
                actions: [
                  TextButton(
                      onPressed: () {
                        showDialog(context);
                      },
                      child: const Text("Log out")),
                ],
              ),
              body: _screens[controller.currentIndex.value],
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.black,
                currentIndex: controller.currentIndex.value,
                onTap: (index) {
                  controller.currentIndex.value = index;
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.lunch_dining),
                    label: 'Orders',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.food_bank),
                    label: 'Menu',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Chef view',
                  ),
                ],
              ),
            )));
  }
}

showDialog(context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            onPressed: () {
              AuthService().signOut();
              Get.to(LoginPageView());
            },
            isDestructiveAction: true,
            child: const Text('Logout'),
          ),
        ],
      );
    },
  );
}
