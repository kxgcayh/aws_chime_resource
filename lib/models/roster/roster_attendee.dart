// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aws_chime_resource/models/meetings/audiovideo/signal_strength.dart';
import 'package:aws_chime_resource/models/meetings/audiovideo/volume_level.dart';

class RosterAttendee {
  final String attendeeId;
  final String name;
  final VolumeLevel volumeLevel;
  final SignalStrength signalStrength;
  final bool isActiveSpeaker;
  final String? profile; // avatar

  const RosterAttendee({
    required this.attendeeId,
    required this.name,
    this.volumeLevel = VolumeLevel.notSpeaking,
    this.signalStrength = SignalStrength.high,
    this.isActiveSpeaker = false,
    this.profile,
  });

  RosterAttendee copyWith({
    String? attendeeId,
    String? name,
    VolumeLevel? volumeLevel,
    SignalStrength? signalStrength,
    bool? isActiveSpeaker,
    String? profile,
  }) {
    return RosterAttendee(
      attendeeId: attendeeId ?? this.attendeeId,
      name: name ?? this.name,
      volumeLevel: volumeLevel ?? this.volumeLevel,
      signalStrength: signalStrength ?? this.signalStrength,
      isActiveSpeaker: isActiveSpeaker ?? this.isActiveSpeaker,
      profile: profile ?? this.profile,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attendeeId': attendeeId,
      'name': name,
      'volumeLevel': volumeLevel.value,
      'signalStrength': signalStrength.value,
      'isActiveSpeaker': isActiveSpeaker,
      'profile': profile,
    };
  }

  factory RosterAttendee.fromMap(Map<String, dynamic> map) {
    return RosterAttendee(
      attendeeId: map['attendeeId'] != null
          ? map['attendeeId'] as String
          : map['atendeeId'] as String,
      name: map['name'] as String,
      volumeLevel: map['volumeLevel'] != null
          ? VolumeLevel.values.fromValue(map['volumeLevel'])
          : VolumeLevel.notSpeaking,
      signalStrength: map['signalStrength'] != null
          ? SignalStrength.values.fromValue(map['signalStrength'])
          : SignalStrength.high,
      isActiveSpeaker: map['isActiveSpeaker'] != null
          ? map['isActiveSpeaker'] as bool
          : false,
      profile: map['profile'] != null ? map['profile'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RosterAttendee.fromJson(String source) =>
      RosterAttendee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RosterAttendee(attendeeId: $attendeeId, name: $name, volumeLevel: $volumeLevel, signalStrength: $signalStrength, isActiveSpeaker: $isActiveSpeaker, profile: $profile)';
  }

  @override
  bool operator ==(covariant RosterAttendee other) {
    if (identical(this, other)) return true;

    return other.attendeeId == attendeeId &&
        other.name == name &&
        other.volumeLevel == volumeLevel &&
        other.signalStrength == signalStrength &&
        other.isActiveSpeaker == isActiveSpeaker &&
        other.profile == profile;
  }

  @override
  int get hashCode {
    return attendeeId.hashCode ^
        name.hashCode ^
        volumeLevel.hashCode ^
        signalStrength.hashCode ^
        isActiveSpeaker.hashCode ^
        profile.hashCode;
  }
}
