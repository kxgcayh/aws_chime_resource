// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class DataMessage {
  final int? timestampMs;
  final String? topic;
  final List<int> data;
  final String senderAttendeeId;
  final String senderExternalUserId;
  final bool throttled;

  const DataMessage({
    this.timestampMs,
    this.topic,
    required this.data,
    required this.senderAttendeeId,
    required this.senderExternalUserId,
    this.throttled = false,
  });

  DataMessage copyWith({
    int? timestampMs,
    String? topic,
    List<int>? data,
    String? senderAttendeeId,
    String? senderExternalUserId,
    bool? throttled,
  }) {
    return DataMessage(
      timestampMs: timestampMs ?? this.timestampMs,
      topic: topic ?? this.topic,
      data: data ?? this.data,
      senderAttendeeId: senderAttendeeId ?? this.senderAttendeeId,
      senderExternalUserId: senderExternalUserId ?? this.senderExternalUserId,
      throttled: throttled ?? this.throttled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timestampMs': timestampMs,
      'topic': topic,
      'data': data,
      'senderAttendeeId': senderAttendeeId,
      'senderExternalUserId': senderExternalUserId,
      'throttled': throttled,
    };
  }

  factory DataMessage.fromMap(Map<String, dynamic> map) {
    return DataMessage(
      timestampMs:
          map['timestampMs'] != null ? map['timestampMs'] as int : null,
      topic: map['topic'] != null ? map['topic'] as String : null,
      data: List<int>.from(map["data"]).map((x) => x).toList(),
      senderAttendeeId: map['senderAttendeeId'] as String,
      senderExternalUserId: map['senderExternalUserId'] as String,
      throttled: map['throttled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  String text() => String.fromCharCodes(data);

  DataMessageCapabilities messageCapability() {
    return DataMessageCapabilities.fromMap(jsonDecode(text()));
  }

  factory DataMessage.fromJson(String source) =>
      DataMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DataMessage(timestampMs: $timestampMs, topic: $topic, data: ${text()}, senderAttendeeId: $senderAttendeeId, senderExternalUserId: $senderExternalUserId, throttled: $throttled)';
  }

  @override
  bool operator ==(covariant DataMessage other) {
    if (identical(this, other)) return true;

    return other.timestampMs == timestampMs &&
        other.topic == topic &&
        listEquals(other.data, data) &&
        other.senderAttendeeId == senderAttendeeId &&
        other.senderExternalUserId == senderExternalUserId &&
        other.throttled == throttled;
  }

  @override
  int get hashCode {
    return timestampMs.hashCode ^
        topic.hashCode ^
        data.hashCode ^
        senderAttendeeId.hashCode ^
        senderExternalUserId.hashCode ^
        throttled.hashCode;
  }
}

class DataMessageCapabilities {
  final String attendeeId;
  final String capabilities;
  final String authorization;

  const DataMessageCapabilities({
    required this.attendeeId,
    required this.capabilities,
    this.authorization = "Receive",
  });

  DataMessageCapabilities copyWith(
      {String? attendeeId, String? capabilities, String? authorization}) {
    return DataMessageCapabilities(
      attendeeId: attendeeId ?? this.attendeeId,
      capabilities: capabilities ?? this.capabilities,
      authorization: authorization ?? this.authorization,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attendeeId': attendeeId,
      'Capabilities': capabilities,
      'Authorization': authorization,
    };
  }

  factory DataMessageCapabilities.fromMap(Map<String, dynamic> map) {
    return DataMessageCapabilities(
      attendeeId: map['attendeeId'] as String,
      capabilities: map['Capabilities'] as String,
      authorization: map['Authorization'] != null
          ? map['Authorization'] as String
          : 'Receive',
    );
  }

  String toJson() => json.encode(toMap());

  factory DataMessageCapabilities.fromJson(String source) =>
      DataMessageCapabilities.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DataMessageCapabilities(attendeeId: $attendeeId, capabilities: $capabilities, authorization: $authorization)';

  @override
  bool operator ==(covariant DataMessageCapabilities other) {
    if (identical(this, other)) return true;

    return other.attendeeId == attendeeId &&
        other.capabilities == capabilities &&
        other.authorization == authorization;
  }

  @override
  int get hashCode =>
      attendeeId.hashCode ^ capabilities.hashCode ^ authorization.hashCode;
}

class DataMessageArguments {
  final String topic;
  final String data;
  final int lifeTimeMs;

  const DataMessageArguments({
    this.topic = 'chat',
    required this.data,
    this.lifeTimeMs = 60000,
  });

  DataMessageArguments copyWith({
    String? topic,
    String? data,
    int? lifeTimeMs,
  }) {
    return DataMessageArguments(
      topic: topic ?? this.topic,
      data: data ?? this.data,
      lifeTimeMs: lifeTimeMs ?? this.lifeTimeMs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'topic': topic,
      'data': data,
      'lifeTimeMs': lifeTimeMs,
    };
  }

  factory DataMessageArguments.fromMap(Map<String, dynamic> map) {
    return DataMessageArguments(
      topic: map['topic'] as String,
      data: map['data'] as String,
      lifeTimeMs: map['lifeTimeMs'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  DataMessage toDataMessage({
    required String attendeeId,
    required String externalUserId,
  }) {
    return DataMessage(
      data: data.codeUnits,
      senderAttendeeId: attendeeId,
      senderExternalUserId: externalUserId,
      topic: topic,
      timestampMs: lifeTimeMs ?? 6000,
    );
  }

  factory DataMessageArguments.fromJson(String source) {
    return DataMessageArguments.fromMap(
        json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() {
    return 'DataMessageArguments(topic: $topic, data: $data, lifeTimeMs: $lifeTimeMs)';
  }

  @override
  bool operator ==(covariant DataMessageArguments other) {
    if (identical(this, other)) return true;

    return other.topic == topic &&
        other.data == data &&
        other.lifeTimeMs == lifeTimeMs;
  }

  @override
  int get hashCode => topic.hashCode ^ data.hashCode ^ lifeTimeMs.hashCode;
}
