// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      to: json['to'] as String?,
      priority: json['priority'] as String? ?? 'high',
      notification: json['notification'] == null
          ? null
          : NotificationDataModel.fromJson(
              json['notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'to': instance.to,
      'priority': instance.priority,
      'notification': instance.notification,
    };
