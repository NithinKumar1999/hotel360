// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/local_storage/global_controller.dart';
import 'package:hotel_app/pages/menu_pages/menu_pages.controller.dart';

class MenuPageView extends GetResponsiveView<MenuPageController> {
  MenuPageView({Key? key}) : super(key: key) {
    Get.lazyPut(() => MenuPageController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEditItemDialog(context);
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      body: Center(child: menuList(context)),
    );
  }

  Widget menuList(context) {
    return Obx(() => SingleChildScrollView(
          child: Column(
            children: [
              menuListWidget(context,
                  title: 'Main dish',
                  categoryList: GlobalController.mainDishList.value),
              menuListWidget(context,
                  title: 'Starters',
                  categoryList: GlobalController.startersList.value),
              menuListWidget(context,
                  title: 'Gravy',
                  categoryList: GlobalController.gravyList.value),
            ],
          ),
        ));
  }

  Widget menuListWidget(context, {required categoryList, required title}) {
    return Column(
      children: [
        categoryList.length > 0
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black12),
                  color: Color.fromARGB(255, 255, 201, 199),
                ),
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Color.fromARGB(255, 66, 66, 66),
                        fontWeight: FontWeight.bold,
                        fontFamily: "OpenSans",
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...categoryList
                        .map((e) => _cardWidget(context, e, categoryList)),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }

  Widget _cardWidget(context, data, categoryList) {
    return Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12),
            color: Color.fromARGB(255, 220, 198, 252),
          ),
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data['name'],
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w300),
                ),
                IconButton(
                    onPressed: () {
                      controller.onTapDelete(data, categoryList);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
          )),
        ));
  }

  void _showEditItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField(
                items: ['Starters', 'Main Dish', 'Gravy']
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedCategory.value = value.toString();
                },
                decoration: InputDecoration(labelText: 'Menu Category'),
              ),
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'Menu Name'),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.onTapSave(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
