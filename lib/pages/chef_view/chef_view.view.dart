// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/pages/chef_view/chef_view.controller.dart';
import 'package:hotel_app/pages/dashboard_page/dashboard_page.view.dart';

class ChefViewPage extends GetView<ChefViewController> {
  ChefViewPage({super.key}) {
    Get.lazyPut(() => ChefViewController());
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  _body(context) {
    RxList list = controller.fetchAssignedOrders().obs;
    return Obx(() => list.isNotEmpty
        ? SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Assigned Orders',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color.fromARGB(255, 3, 175, 29),
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cardWidget(context, list[index], list);
                  },
                ),
              ],
            ),
          )
        : _emptyWidget(context));
  }

  cardWidget(context, data, list) {
    return Column(
      children: [
        InkWell(
            onTap: () {},
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
              decoration: BoxDecoration(
                color: data['isCompleted'] != null && data['isCompleted']
                    ? const Color.fromARGB(255, 178, 240, 172)
                    : const Color.fromARGB(255, 129, 125, 125),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCard('Main Dish', data['Main_dish'],
                          isCompleted: data['isCompleted']),
                      _buildCard('Starters', data['Starters'],
                          isCompleted: data['isCompleted']),
                      _buildCard('Gravy', data['gravy'],
                          isCompleted: data['isCompleted']),
                    ],
                  ),
                  buttonWidget(
                      onTapButton: () {
                        data['isCompleted'] == true
                            ? data['isCompleted'] = false
                            : data['isCompleted'] = true;
                        list.refresh();
                      },
                      text: data['isCompleted'] != null && data['isCompleted']
                          ? 'Undo'
                          : 'Complete',
                      color: data['isCompleted'] != null && data['isCompleted']
                          ? const Color.fromARGB(255, 244, 6, 6)
                          : const Color.fromARGB(255, 77, 57, 57))
                ],
              ),
            )),
        const SizedBox(height: 20)
      ],
    );
  }

  Widget _buildCard(String title, String value, {isCompleted}) {
    return Container(
      width: Get.width * 0.3,
      child: Card(
        color: isCompleted != null && isCompleted
            ? const Color.fromARGB(255, 0, 180, 60)
            : const Color.fromARGB(255, 59, 59, 59),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyWidget(context) {
    return InkWell(
      onTap: () {
        controller.init();
      },
      child: const Center(
        child: Text("No orders yet"),
      ),
    );
  }
}
