import 'dart:convert';

import 'package:aws_chime_resource/models/meetings/audiovideo/signal_strength.dart';
import 'package:aws_chime_resource/models/meetings/audiovideo/volume_level.dart';
import 'package:flutter/foundation.dart';

@immutable
class AttendeeInfo {
  final String attendeeId;
  final String externalUserId;
  final String? joinToken;
  final SignalStrength signalStrength;
  final VolumeLevel volumeLevel;
  final Capabilities capabilities;

  const AttendeeInfo({
    required this.attendeeId,
    required this.externalUserId,
    this.joinToken,
    this.signalStrength = SignalStrength.high,
    this.volumeLevel = VolumeLevel.notSpeaking,
    this.capabilities = const Capabilities(),
  });

  AttendeeInfo copyWith({
    String? attendeeId,
    String? externalUserId,
    String? joinToken,
    SignalStrength? signalStrength,
    VolumeLevel? volumeLevel,
    Capabilities? capabilities,
  }) {
    return AttendeeInfo(
      attendeeId: attendeeId ?? this.attendeeId,
      externalUserId: externalUserId ?? this.externalUserId,
      joinToken: joinToken ?? this.joinToken,
      signalStrength: signalStrength ?? this.signalStrength,
      volumeLevel: volumeLevel ?? this.volumeLevel,
      capabilities: capabilities ?? this.capabilities,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'AttendeeId': attendeeId,
      'ExternalUserId': externalUserId,
      'JoinToken': joinToken,
      'signalStrength': signalStrength.value,
      'volumeLevel': volumeLevel.value,
      'Capabilities': capabilities.toMap(),
    };
  }

  factory AttendeeInfo.fromMap(Map<String, dynamic> map) {
    return AttendeeInfo(
      attendeeId: map['attendeeId'] as String,
      externalUserId: map['ExternalUserId'] as String,
      joinToken: map['JoinToken'] != null ? map['JoinToken'] as String : null,
      signalStrength: map['signalStrength'] == null
          ? SignalStrength.high
          : SignalStrength.values.fromValue(map['signalStrength']),
      volumeLevel: map['volumeLevel'] == null
          ? VolumeLevel.high
          : VolumeLevel.values.fromValue(map['volumeLevel']),
      capabilities: map['Capabilities'] != null
          ? Capabilities.fromMap(map['Capabilities'])
          : const Capabilities(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendeeInfo.fromJson(String source) {
    return AttendeeInfo.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() {
    return 'AttendeeInfo(attendeeId: $attendeeId, externalUserId: $externalUserId, joinToken: $joinToken, signalStrength: $signalStrength, volumeLevel: $volumeLevel: capabilities: $capabilities)';
  }

  @override
  bool operator ==(covariant AttendeeInfo other) {
    if (identical(this, other)) return true;

    return other.attendeeId == attendeeId &&
        other.externalUserId == externalUserId &&
        other.joinToken == joinToken &&
        other.signalStrength == signalStrength &&
        other.volumeLevel == volumeLevel;
  }

  @override
  int get hashCode {
    return attendeeId.hashCode ^
        externalUserId.hashCode ^
        joinToken.hashCode ^
        signalStrength.hashCode ^
        volumeLevel.hashCode;
  }
}

class VolumeUpdate {
  final AttendeeInfo attendeeInfo;
  final VolumeLevel volumeLevel;

  const VolumeUpdate({
    required this.attendeeInfo,
    required this.volumeLevel,
  });

  VolumeUpdate copyWith({
    AttendeeInfo? attendeeInfo,
    VolumeLevel? volumeLevel,
  }) {
    return VolumeUpdate(
      attendeeInfo: attendeeInfo ?? this.attendeeInfo,
      volumeLevel: volumeLevel ?? this.volumeLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attendeeInfo': attendeeInfo.toMap(),
      'volumeLevel': volumeLevel.value,
    };
  }

  factory VolumeUpdate.fromMap(Map<String, dynamic> map) {
    return VolumeUpdate(
      attendeeInfo: AttendeeInfo.fromMap(
        map['attendeeInfo'] as Map<String, dynamic>,
      ),
      volumeLevel: VolumeLevel.values.fromValue(map["volumeLevel"]),
    );
  }

  String toJson() => json.encode(toMap());

  factory VolumeUpdate.fromJson(String source) =>
      VolumeUpdate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'VolumeUpdate(attendeeInfo: $attendeeInfo, volumeLevel: $volumeLevel)';

  @override
  bool operator ==(covariant VolumeUpdate other) {
    if (identical(this, other)) return true;

    return other.attendeeInfo == attendeeInfo &&
        other.volumeLevel == volumeLevel;
  }

  @override
  int get hashCode => attendeeInfo.hashCode ^ volumeLevel.hashCode;
}

class SignalUpdate {
  final AttendeeInfo attendeeInfo;
  final SignalStrength signalStrength;

  const SignalUpdate(
    this.attendeeInfo,
    this.signalStrength,
  );

  SignalUpdate copyWith({
    AttendeeInfo? attendeeInfo,
    SignalStrength? signalStrength,
  }) {
    return SignalUpdate(
      attendeeInfo ?? this.attendeeInfo,
      signalStrength ?? this.signalStrength,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attendeeInfo': attendeeInfo.toMap(),
      'signalStrength': signalStrength.value,
    };
  }

  factory SignalUpdate.fromMap(Map<String, dynamic> map) {
    return SignalUpdate(
      AttendeeInfo.fromMap(map['attendeeInfo'] as Map<String, dynamic>),
      SignalStrength.values.fromValue(map['signalStrength']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SignalUpdate.fromJson(String source) =>
      SignalUpdate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SignalUpdate(attendeeInfo: $attendeeInfo, signalStrength: $signalStrength)';

  @override
  bool operator ==(covariant SignalUpdate other) {
    if (identical(this, other)) return true;

    return other.attendeeInfo == attendeeInfo &&
        other.signalStrength == signalStrength;
  }

  @override
  int get hashCode => attendeeInfo.hashCode ^ signalStrength.hashCode;
}

@immutable
class Capabilities {
  final String audio;
  final String video;
  final String content;

  const Capabilities({
    this.audio = 'SendReceive',
    this.video = 'SendReceive',
    this.content = 'Receive',
  });

  Capabilities copyWith({
    String? audio,
    String? video,
    String? content,
  }) {
    return Capabilities(
      audio: audio ?? this.audio,
      video: video ?? this.video,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Audio': audio,
      'Video': video,
      'Content': content,
    };
  }

  factory Capabilities.fromMap(Map<String, dynamic> map) {
    return Capabilities(
      audio: map['Audio'] as String,
      video: map['Video'] as String,
      content: map['Content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Capabilities.fromJson(String source) =>
      Capabilities.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Capabilities(audio: $audio, video: $video, content: $content)';

  @override
  bool operator ==(covariant Capabilities other) {
    if (identical(this, other)) return true;

    return other.audio == audio &&
        other.video == video &&
        other.content == content;
  }

  @override
  int get hashCode => audio.hashCode ^ video.hashCode ^ content.hashCode;
}
