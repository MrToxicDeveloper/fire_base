import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class NotificationService {
  static NotificationService notificationService = NotificationService._();

  NotificationService._();

  FlutterLocalNotificationsPlugin notification =
  FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings AndroidSettings =
    AndroidInitializationSettings('img');

    DarwinInitializationSettings iOSSettings = DarwinInitializationSettings();

    InitializationSettings initializationSettings =
    InitializationSettings(android: AndroidSettings, iOS: iOSSettings);

    tz.initializeTimeZones();

    await notification.initialize(initializationSettings);
  }

  void showNotification() {
    AndroidNotificationDetails AndroidDetails =
    AndroidNotificationDetails("1", "Flutter Fire");

    DarwinNotificationDetails iOSDetails = DarwinNotificationDetails();

    NotificationDetails details =
    NotificationDetails(android: AndroidDetails,iOS: iOSDetails);

    notification.show(1, "Flutter Fire", "Hey bro!!!!", details);
  }

  void scheduleNotification() {

    AndroidNotificationDetails AndroidDetails =
    AndroidNotificationDetails("1", "Hey bro!!!!");

    DarwinNotificationDetails iOSDetails = DarwinNotificationDetails();

    NotificationDetails details =

    NotificationDetails(iOS: iOSDetails, android: AndroidDetails);

    notification.zonedSchedule(
        1, "Hey bro!!!!", "5 seconds",
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        details,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  }
}