import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base/screens/home/controller/home_controller.dart';
import 'package:fire_base/screens/home/model/home_model.dart';
import 'package:fire_base/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/notification_service/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  NotificationService.notificationService.showNotification();
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  NotificationService.notificationService.scheduleNotification();
                },
                icon: Icon(
                  Icons.notifications_active,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  FireBaseHelper.fireBaseHelper.logut();
                  Get.offAndToNamed('/');
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                )),
          ],
        ),
        // drawer: Drawer(
        //   child: Column(
        //     children: [
        //       Text("hi"),
        //     ],
        //   ),
        // ),
        body: StreamBuilder(
          stream: FireBaseHelper.fireBaseHelper.read(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              QuerySnapshot? snapData = snapshot.data;

              controller.productList.clear();

              for (var x in snapData!.docs) {
                Map? data = x.data() as Map;

                HomeModel m1 = HomeModel(
                    Price: data['price'],
                    Name: data['name'],
                    Category: data['category'],
                  key: x.id
                );

                controller.productList.add(m1);

                print(
                    "================================${data['name']} ${data['price']} ${data['category']}");
              }
              return ListView.builder(
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${controller.productList[index].Name}"),
                    subtitle: Text("${controller.productList[index].Price}"),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        HomeModel h1 = HomeModel(
                            Category: controller.productList[index].Category,
                            Name: controller.productList[index].Name,
                            Price: controller.productList[index].Price,
                            key: controller.productList[index].key,
                        );
                        Get.toNamed('/edit', arguments: h1);
                      },
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator(
              color: Colors.green,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          heroTag: 'add',
          onPressed: () {
            Get.toNamed('/input');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
