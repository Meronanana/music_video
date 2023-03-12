import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static final LocalNotification _instance = LocalNotification._internal();

  factory LocalNotification() => _instance;
  LocalNotification._internal();

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static initialize() async {
    const AndroidInitializationSettings initSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');
    final DarwinInitializationSettings initSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: false,
      requestSoundPermission: true,
    );
    final InitializationSettings initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
      macOS: initSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  static void requestPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  static Future<void> testNotification() async {
    const AndroidNotificationDetails android =
        AndroidNotificationDetails('channelId', 'Name');
    const NotificationDetails notiDetails = NotificationDetails(
        android: android, iOS: DarwinNotificationDetails(badgeNumber: 1));
    await flutterLocalNotificationsPlugin.show(0, 'Hi', 'so hard', notiDetails);
  }
}
