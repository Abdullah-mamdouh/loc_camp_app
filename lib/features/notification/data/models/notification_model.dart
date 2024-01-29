
import 'package:json_annotation/json_annotation.dart';
import 'package:loc_camp_app/features/notification/data/models/data_model.dart';
import 'package:loc_camp_app/features/notification/data/models/notification_data_model.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  String? to;
  String? priority;
  NotificationDataModel? notification;
  // DataModel? data;

  NotificationModel({this.to, this.priority = 'high', this.notification, //this.data
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

}
