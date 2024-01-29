

import 'package:json_annotation/json_annotation.dart';
part 'notification_data_model.g.dart';

@JsonSerializable()
class NotificationDataModel {
  String? title;
  String? body;

  NotificationDataModel({this.title, this.body});

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationDataModelToJson(this);

}
