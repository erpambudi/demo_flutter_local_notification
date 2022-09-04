import 'package:demo_flutter_local_notification/main.dart';
import 'package:flutter/material.dart';

import '../helper/notification_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    super.initState();
    _notificationHelper.configureSelectNotificationSubject(
        context, "/notification");
    _notificationHelper.configureDidReceiveLocalNotificationSubject(
        context, "/notification");
  }

  @override
  void dispose() {
    super.dispose();
    selectNotificationSubject.close();
    didReceiveLocalNotificationSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/notification");
              },
              icon: const Icon(
                Icons.notifications,
              )),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _notificationHelper
                    .showNotification(flutterLocalNotificationsPlugin);
              },
              child: const Text("Simple Notification"),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                _notificationHelper.showBigPictureNotification(
                    flutterLocalNotificationsPlugin);
              },
              child: const Text("Big Picture Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
