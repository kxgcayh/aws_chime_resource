import 'dart:convert';

class RemoteVideoSource {
  final String attendeeId;

  const RemoteVideoSource(this.attendeeId);

  RemoteVideoSource copyWith({
    String? attendeeId,
  }) {
    return RemoteVideoSource(
      attendeeId ?? this.attendeeId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attendeeId': attendeeId,
    };
  }

  factory RemoteVideoSource.fromMap(Map<String, dynamic> map) {
    return RemoteVideoSource(
      map['attendeeId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteVideoSource.fromJson(String source) =>
      RemoteVideoSource.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RemoteVideoSource(attendeeId: $attendeeId)';

  @override
  bool operator ==(covariant RemoteVideoSource other) {
    if (identical(this, other)) return true;

    return other.attendeeId == attendeeId;
  }

  @override
  int get hashCode => attendeeId.hashCode;
}
