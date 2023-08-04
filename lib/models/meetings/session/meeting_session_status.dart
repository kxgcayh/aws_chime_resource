import 'dart:convert';
import 'package:aws_chime_resource/models/meetings/session/meeting_session_status_code.dart';

class MeetingSessionStatus {
  final MeetingSessionStatusCode statusCode;

  const MeetingSessionStatus(this.statusCode);

  MeetingSessionStatus copyWith({
    MeetingSessionStatusCode? statusCode,
  }) {
    return MeetingSessionStatus(
      statusCode ?? this.statusCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'statusCode': statusCode.value};
  }

  factory MeetingSessionStatus.fromMap(Map<String, dynamic> map) {
    return MeetingSessionStatus(
      MeetingSessionStatusCode.values.fromValue(map['statusCode']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MeetingSessionStatus.fromJson(String source) {
    return MeetingSessionStatus.fromMap(
      json.decode(source) as Map<String, dynamic>,
    );
  }

  @override
  String toString() => 'MeetingSessionStatus(statusCode: $statusCode)';

  @override
  bool operator ==(covariant MeetingSessionStatus other) {
    if (identical(this, other)) return true;

    return other.statusCode == statusCode;
  }

  @override
  int get hashCode => statusCode.hashCode;
}
