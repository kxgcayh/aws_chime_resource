import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:aws_chime_resource/models/meetings/session/create_meeting_response.dart';
import 'package:aws_chime_resource/models/roster/roster_attendee.dart';

class JoinMeetingResponse {
  final MeetingInfo data;
  final List<RosterAttendee> rosters;

  const JoinMeetingResponse({
    required this.data,
    this.rosters = const <RosterAttendee>[],
  });

  JoinMeetingResponse copyWith({
    MeetingInfo? data,
    List<RosterAttendee>? rosters,
  }) {
    return JoinMeetingResponse(
      data: data ?? this.data,
      rosters: rosters ?? this.rosters,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
      'rosters': rosters.map((x) => x.toMap()).toList(),
    };
  }

  factory JoinMeetingResponse.fromMap(Map<String, dynamic> map) {
    return JoinMeetingResponse(
      data: MeetingInfo.fromMap(map['data'] as Map<String, dynamic>),
      rosters: List<RosterAttendee>.from(
        (map['rosters'] as List<int>).map<RosterAttendee>(
          (x) => RosterAttendee.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory JoinMeetingResponse.fromJson(String source) =>
      JoinMeetingResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'JoinMeetingResponse(data: $data, rosters: $rosters)';

  @override
  bool operator ==(covariant JoinMeetingResponse other) {
    if (identical(this, other)) return true;

    return other.data == data && listEquals(other.rosters, rosters);
  }

  @override
  int get hashCode => data.hashCode ^ rosters.hashCode;
}
