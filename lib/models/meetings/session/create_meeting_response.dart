import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:aws_chime_resource/models/meetings/audiovideo/attendee_update.dart';

class MeetingInfo {
  final Meeting meeting;
  final AttendeeInfo attendee;

  const MeetingInfo({
    required this.meeting,
    required this.attendee,
  });

  MeetingInfo copyWith({
    Meeting? meeting,
    AttendeeInfo? attendee,
  }) {
    return MeetingInfo(
      meeting: meeting ?? this.meeting,
      attendee: attendee ?? this.attendee,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Meeting': meeting.toMap(),
      'Attendee': attendee.toMap(),
    };
  }

  factory MeetingInfo.fromMap(Map<String, dynamic> map) {
    return MeetingInfo(
      meeting: Meeting.fromMap(map['Meeting'] as Map<String, dynamic>),
      attendee: AttendeeInfo.fromMap(map['Attendee'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory MeetingInfo.fromJson(String source) =>
      MeetingInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MeetingInfo(meeting: $meeting, attendee: $attendee)';

  @override
  bool operator ==(covariant MeetingInfo other) {
    if (identical(this, other)) return true;

    return other.meeting == meeting && other.attendee == attendee;
  }

  @override
  int get hashCode => meeting.hashCode ^ attendee.hashCode;
}

class Meeting {
  final String meetingId;
  final String externalMeetingId;
  final String mediaRegion;
  final MediaPlacement mediaPlacement;
  final String? meetingHostId;
  final MeetingFeatures? meetingFeatures;
  final List<dynamic>? tenantIds;
  final String? meetingArn;

  const Meeting({
    required this.meetingId,
    required this.externalMeetingId,
    required this.mediaRegion,
    required this.mediaPlacement,
    this.meetingHostId,
    this.meetingFeatures,
    this.tenantIds,
    this.meetingArn,
  });

  Meeting copyWith({
    String? meetingId,
    String? externalMeetingId,
    String? mediaRegion,
    MediaPlacement? mediaPlacement,
    String? meetingHostId,
    MeetingFeatures? meetingFeatures,
    List<dynamic>? tenantIds,
    String? meetingArn,
  }) {
    return Meeting(
      meetingId: meetingId ?? this.meetingId,
      externalMeetingId: externalMeetingId ?? this.externalMeetingId,
      mediaRegion: mediaRegion ?? this.mediaRegion,
      mediaPlacement: mediaPlacement ?? this.mediaPlacement,
      meetingHostId: meetingHostId ?? this.meetingHostId,
      meetingFeatures: meetingFeatures ?? this.meetingFeatures,
      tenantIds: tenantIds ?? this.tenantIds,
      meetingArn: meetingArn ?? this.meetingArn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'MeetingId': meetingId,
      'ExternalMeetingId': externalMeetingId,
      'MediaRegion': mediaRegion,
      'MediaPlacement': mediaPlacement.toMap(),
      'MeetingHostId': meetingHostId,
      'MeetingFeatures': meetingFeatures?.toMap(),
      'TenantIds': tenantIds,
      'MeetingArn': meetingArn,
    };
  }

  factory Meeting.fromMap(Map<String, dynamic> map) {
    return Meeting(
      meetingId: map['MeetingId'] as String,
      externalMeetingId: map['ExternalMeetingId'] as String,
      mediaRegion: map['MediaRegion'] as String,
      mediaPlacement: MediaPlacement.fromMap(
        map['MediaPlacement'] as Map<String, dynamic>,
      ),
      meetingHostId:
          map['MeetingHostId'] != null ? map['MeetingHostId'] as String : null,
      meetingFeatures: map['MeetingFeatures'] != null
          ? MeetingFeatures.fromMap(
              map['MeetingFeatures'] as Map<String, dynamic>,
            )
          : null,
      tenantIds: map['TenantIds'] != null
          ? List<dynamic>.from((map['TenantIds'] as List<dynamic>))
          : null,
      meetingArn:
          map['MeetingArn'] != null ? map['MeetingArn'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meeting.fromJson(String source) =>
      Meeting.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Meeting(meetingId: $meetingId, externalMeetingId: $externalMeetingId, mediaRegion: $mediaRegion, mediaPlacement: $mediaPlacement, meetingHostId: $meetingHostId, meetingFeatures: $meetingFeatures, tenantIds: $tenantIds, meetingArn: $meetingArn)';
  }

  @override
  bool operator ==(covariant Meeting other) {
    if (identical(this, other)) return true;

    return other.meetingId == meetingId &&
        other.externalMeetingId == externalMeetingId &&
        other.mediaRegion == mediaRegion &&
        other.mediaPlacement == mediaPlacement &&
        other.meetingHostId == meetingHostId &&
        other.meetingFeatures == meetingFeatures &&
        listEquals(other.tenantIds, tenantIds) &&
        other.meetingArn == meetingArn;
  }

  @override
  int get hashCode {
    return meetingId.hashCode ^
        externalMeetingId.hashCode ^
        mediaRegion.hashCode ^
        mediaPlacement.hashCode ^
        meetingHostId.hashCode ^
        meetingFeatures.hashCode ^
        tenantIds.hashCode ^
        meetingArn.hashCode;
  }
}

class MediaPlacement {
  final String audioHostUrl;
  final String audioFallbackUrl;
  final String signalingUrl;
  final String turnControlUrl;
  final String? screenDataUrl;
  final String? screenViewingUrl;
  final String? screenSharingUrl;
  final String? eventIngestionUrl;

  const MediaPlacement({
    required this.audioHostUrl,
    required this.audioFallbackUrl,
    required this.signalingUrl,
    required this.turnControlUrl,
    this.screenDataUrl,
    this.screenViewingUrl,
    this.screenSharingUrl,
    this.eventIngestionUrl,
  });

  MediaPlacement copyWith({
    String? audioHostUrl,
    String? audioFallbackUrl,
    String? signalingUrl,
    String? turnControlUrl,
    String? screenDataUrl,
    String? screenViewingUrl,
    String? screenSharingUrl,
    String? eventIngestionUrl,
  }) {
    return MediaPlacement(
      audioHostUrl: audioHostUrl ?? this.audioHostUrl,
      audioFallbackUrl: audioFallbackUrl ?? this.audioFallbackUrl,
      signalingUrl: signalingUrl ?? this.signalingUrl,
      turnControlUrl: turnControlUrl ?? this.turnControlUrl,
      screenDataUrl: screenDataUrl ?? this.screenDataUrl,
      screenViewingUrl: screenViewingUrl ?? this.screenViewingUrl,
      screenSharingUrl: screenSharingUrl ?? this.screenSharingUrl,
      eventIngestionUrl: eventIngestionUrl ?? this.eventIngestionUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'AudioHostUrl': audioHostUrl,
      'AudioFallbackUrl': audioFallbackUrl,
      'SignalingUrl': signalingUrl,
      'TurnControlUrl': turnControlUrl,
      'ScreenDataUrl': screenDataUrl,
      'ScreenViewingUrl': screenViewingUrl,
      'ScreenSharingUrl': screenSharingUrl,
      'EventIngestionUrl': eventIngestionUrl,
    };
  }

  factory MediaPlacement.fromMap(Map<String, dynamic> map) {
    return MediaPlacement(
      audioHostUrl: map['AudioHostUrl'] as String,
      audioFallbackUrl: map['AudioFallbackUrl'] as String,
      signalingUrl: map['SignalingUrl'] as String,
      turnControlUrl: map['TurnControlUrl'] as String,
      screenDataUrl:
          map['ScreenDataUrl'] != null ? map['ScreenDataUrl'] as String : null,
      screenViewingUrl: map['ScreenViewingUrl'] != null
          ? map['ScreenViewingUrl'] as String
          : null,
      screenSharingUrl: map['ScreenSharingUrl'] != null
          ? map['ScreenSharingUrl'] as String
          : null,
      eventIngestionUrl: map['EventIngestionUrl'] != null
          ? map['EventIngestionUrl'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaPlacement.fromJson(String source) =>
      MediaPlacement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MediaPlacement(audioHostUrl: $audioHostUrl, audioFallbackUrl: $audioFallbackUrl, signalingUrl: $signalingUrl, turnControlUrl: $turnControlUrl, screenDataUrl: $screenDataUrl, screenViewingUrl: $screenViewingUrl, screenSharingUrl: $screenSharingUrl, eventIngestionUrl: $eventIngestionUrl)';
  }

  @override
  bool operator ==(covariant MediaPlacement other) {
    if (identical(this, other)) return true;

    return other.audioHostUrl == audioHostUrl &&
        other.audioFallbackUrl == audioFallbackUrl &&
        other.signalingUrl == signalingUrl &&
        other.turnControlUrl == turnControlUrl &&
        other.screenDataUrl == screenDataUrl &&
        other.screenViewingUrl == screenViewingUrl &&
        other.screenSharingUrl == screenSharingUrl &&
        other.eventIngestionUrl == eventIngestionUrl;
  }

  @override
  int get hashCode {
    return audioHostUrl.hashCode ^
        audioFallbackUrl.hashCode ^
        signalingUrl.hashCode ^
        turnControlUrl.hashCode ^
        screenDataUrl.hashCode ^
        screenViewingUrl.hashCode ^
        screenSharingUrl.hashCode ^
        eventIngestionUrl.hashCode;
  }
}

class MeetingFeatures {
  final AudioFeature? audio;

  const MeetingFeatures([this.audio]);

  MeetingFeatures copyWith({
    AudioFeature? audio,
  }) {
    return MeetingFeatures(audio ?? this.audio);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'Audio': audio?.toMap()};
  }

  factory MeetingFeatures.fromMap(Map<String, dynamic> map) {
    return MeetingFeatures(
      map['Audio'] != null
          ? AudioFeature.fromMap(map['Audio'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MeetingFeatures.fromJson(String source) =>
      MeetingFeatures.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MeetingFeatures(audio: $audio)';

  @override
  bool operator ==(covariant MeetingFeatures other) {
    if (identical(this, other)) return true;

    return other.audio == audio;
  }

  @override
  int get hashCode => audio.hashCode;
}

class AudioFeature {
  final String? echoReduction;

  const AudioFeature([
    this.echoReduction,
  ]);

  AudioFeature copyWith({
    String? echoReduction,
  }) {
    return AudioFeature(echoReduction ?? this.echoReduction);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'EchoReduction': echoReduction,
    };
  }

  factory AudioFeature.fromMap(Map<String, dynamic> map) {
    return AudioFeature(
      map['EchoReduction'] != null ? map['EchoReduction'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AudioFeature.fromJson(String source) =>
      AudioFeature.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AudioFeature(echoReduction: $echoReduction)';

  @override
  bool operator ==(covariant AudioFeature other) {
    if (identical(this, other)) return true;

    return other.echoReduction == echoReduction;
  }

  @override
  int get hashCode => echoReduction.hashCode;
}
