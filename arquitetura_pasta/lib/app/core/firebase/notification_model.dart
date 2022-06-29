import 'dart:convert';
import 'dart:io';

class NotificationModel {
  String? title;
  String? body;
  String? action;
  String? id;
  NotificationModel(
      {required this.title,
      required this.body,
      required this.action,
      required this.id});

  factory NotificationModel.fromMap(Map<String, dynamic>? map) {
    // print(map);
    //   if (map == null) return null;

    if (Platform.isAndroid) {
      return NotificationModel(
          title: map!['notification']['title'],
          body: map['notification']['body'],
          action: map['data']['action'],
          id: map['data']['id']);
    } else {
      return NotificationModel(
          title: map!['aps']['alert']['title'],
          body: map['aps']['alert']['body'],
          action: map['action'],
          id: map['id']);
    }
  }

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));
}
