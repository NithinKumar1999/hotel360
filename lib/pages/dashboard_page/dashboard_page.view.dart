// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/local_storage/global_controller.dart';
import 'package:hotel_app/pages/dashboard_page/dashboard_page.controller.dart';

class DashBoardPage extends GetResponsiveView<DashBoardPageController> {
  DashBoardPage({super.key}) {
    Get.lazyPut(() => DashBoardPageController());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          backgroundColor: const Color.fromARGB(255, 247, 230, 255),
          floatingActionButton: GlobalController.orderList.isNotEmpty
              ? FloatingActionButton(
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                  backgroundColor: Colors.black,
                  child: const Icon(Icons.add),
                )
              : null,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              GlobalController.orderList.isNotEmpty
                  ? Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                mainAxisExtent: 250),
                        itemCount: GlobalController.orderList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _gridItem(
                              context, GlobalController.orderList[index]);
                        },
                      ),
                    )
                  : Center(
                      child: buttonWidget(
                          onTapButton: () => _showBottomSheet(context),
                          text: 'Add order'))
            ],
          ))),
    );
  }

  _gridItem(context, data) {
    return Stack(
      children: [
        Card(
          elevation: 0,
          color: Color.fromARGB(255, 178, 225, 177),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(width: 1, color: Colors.black12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                titleWidget(data, context),
              ],
            ),
          ),
        ),
        Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: () {
                GlobalController.orderList
                    .removeWhere((element) => element['id'] == data['id']);
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )),
      ],
    );
  }

  void _showBottomSheet(BuildContext context, {intialData}) {
    if (intialData != null) {
      controller.selectedMainDish.value = intialData['Main_dish'];
      controller.selectedStarters.value = intialData['Starters'];
      controller.selectedGravy.value = intialData['gravy'];
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select main dish',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          ...GlobalController.mainDishList.map((data) {
                            return InkWell(
                              onTap: () {
                                if (controller.selectedMainDish.value ==
                                    data['name']) {
                                  controller.selectedMainDish.value = '';
                                } else {
                                  controller.selectedMainDish.value =
                                      data['name'];
                                }
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: controller.selectedMainDish.value ==
                                            data['name']
                                        ? const Color.fromARGB(255, 65, 65, 65)
                                        : const Color.fromARGB(
                                            255, 201, 218, 255),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    data['name'],
                                    style: TextStyle(
                                        color:
                                            controller.selectedMainDish.value ==
                                                    data['name']
                                                ? Colors.white
                                                : Colors.black),
                                  ))),
                            );
                          }),
                        ]),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select starters',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          ...GlobalController.startersList.map((data) {
                            return InkWell(
                              onTap: () {
                                if (controller.selectedStarters.value ==
                                    data['name']) {
                                  controller.selectedStarters.value = '';
                                } else {
                                  controller.selectedStarters.value =
                                      data['name'];
                                }
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: controller.selectedStarters.value ==
                                            data['name']
                                        ? const Color.fromARGB(255, 65, 65, 65)
                                        : const Color.fromARGB(
                                            255, 201, 218, 255),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    data['name'],
                                    style: TextStyle(
                                        color:
                                            controller.selectedStarters.value ==
                                                    data['name']
                                                ? Colors.white
                                                : Colors.black),
                                  ))),
                            );
                          }),
                        ]),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select Gravy',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          ...GlobalController.gravyList.map((data) {
                            return InkWell(
                              onTap: () {
                                if (controller.selectedGravy.value ==
                                    data['name']) {
                                  controller.selectedGravy.value = '';
                                } else {
                                  controller.selectedGravy.value = data['name'];
                                }
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: controller.selectedGravy.value ==
                                            data['name']
                                        ? const Color.fromARGB(255, 65, 65, 65)
                                        : const Color.fromARGB(
                                            255, 201, 218, 255),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    data['name'],
                                    style: TextStyle(
                                        color: controller.selectedGravy.value ==
                                                data['name']
                                            ? Colors.white
                                            : Colors.black),
                                  ))),
                            );
                          }),
                        ]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttonWidget(
                          onTapButton: () =>
                              controller.save(context, intialData),
                          text: intialData != null
                              ? 'Update order'
                              : 'Place order'),
                    ],
                  )
                ],
              )),
        );
      },
    );
  }

  titleWidget(data, context) {
    return InkWell(
      onTap: () {
        _showBottomSheet(context, intialData: data);
      },
      child: Column(children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage("assets/main_dish.jpg"),
            ),
            const SizedBox(width: 10),
            Text(
              data['Main_dish'],
              style: const TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(255, 111, 14, 144),
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage("assets/starters.jpg"),
            ),
            const SizedBox(width: 10),
            Text(
              data['Starters'],
              style: const TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(255, 111, 14, 144),
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage("assets/gravy.jpg"),
            ),
            const SizedBox(width: 10),
            Text(
              data['gravy'],
              style: const TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(255, 111, 14, 144),
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        TextButton(
          onPressed: () {
            data['assigned'] == true
                ? data['assigned'] = false
                : data['assigned'] = true;
            GlobalController.orderList.refresh();
          },
          child: Text(
            data['assigned'] ? "Unassign order" : 'Assign order',
            style: data['assigned'] == false
                ? const TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 27, 3, 205))
                : const TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 236, 36, 36)),
          ),
        )
      ]),
    );
  }
}

buttonWidget({required onTapButton, text, Color? color}) {
  return InkWell(
    onTap: () async {
      onTapButton();
    },
    child: Container(
      decoration: BoxDecoration(
        color: color ?? const Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(5),
      ),
      width: 100,
      height: 30,
      child: Center(
          child: Text(text, style: const TextStyle(color: Colors.white))),
    ),
  );
}
