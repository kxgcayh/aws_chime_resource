import 'dart:convert';

class MediaDevice {
  final String? id;
  final String label;
  final MediaDeviceType type;

  const MediaDevice({
    this.id,
    required this.label,
    required this.type,
  });

  int get order {
    switch (type) {
      case MediaDeviceType.audioBluetooth:
        return 0;
      case MediaDeviceType.audioWiredHeadset:
      case MediaDeviceType.audioUsbHeadset:
        return 1;
      case MediaDeviceType.audioBuiltinSpeaker:
        return 2;
      case MediaDeviceType.audioHandset:
        return 3;
      case MediaDeviceType.videoFrontCamera:
        return 4;
      case MediaDeviceType.videoBackCamera:
        return 5;
      case MediaDeviceType.videoExternalCamera:
        return 6;
      default:
        return 99;
    }
  }

  static MediaDeviceType fromShortString(String shortString) {
    switch (shortString) {
      case "Bluetooth":
        return MediaDeviceType.audioBluetooth;
      case "Wired Headset":
        return MediaDeviceType.audioWiredHeadset;
      case "USB Headset":
        return MediaDeviceType.audioUsbHeadset;
      case "Builtin Speaker":
        return MediaDeviceType.audioBuiltinSpeaker;
      case "Handset":
        return MediaDeviceType.audioHandset;
      case "Front Camera":
        return MediaDeviceType.videoFrontCamera;
      case "Back Camera":
        return MediaDeviceType.videoBackCamera;
      case "External Camera":
        return MediaDeviceType.videoExternalCamera;
      default:
        return MediaDeviceType.other;
    }
  }

  MediaDevice copyWith({
    String? id,
    String? label,
    MediaDeviceType? type,
  }) {
    return MediaDevice(
      id: id ?? this.id,
      label: label ?? this.label,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
      'type': type.index,
    };
  }

  factory MediaDevice.fromMap(Map<String, dynamic> map) {
    return MediaDevice(
      id: map['id'] != null ? map['id'] as String : null,
      label: map['label'] as String,
      type: map["type"] == null
          ? MediaDeviceType.other
          : fromShortString(map["type"]),
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaDevice.fromJson(String source) =>
      MediaDevice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MediaDevice(id: $id, label: $label, type: $type)';

  @override
  bool operator ==(covariant MediaDevice other) {
    if (identical(this, other)) return true;

    return other.id == id && other.label == label && other.type == type;
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode ^ type.hashCode;
}

enum MediaDeviceType {
  audioBluetooth,
  audioWiredHeadset,
  audioUsbHeadset,
  audioBuiltinSpeaker,
  audioHandset,
  videoFrontCamera,
  videoBackCamera,
  videoExternalCamera,
  other,
}

extension MediaDeviceTypeToString on MediaDeviceType {
  String toShortString() {
    switch (this) {
      case MediaDeviceType.audioBluetooth:
        return "Bluetooth";
      case MediaDeviceType.audioWiredHeadset:
        return "Wired Headset";
      case MediaDeviceType.audioUsbHeadset:
        return "USB Headset";
      case MediaDeviceType.audioBuiltinSpeaker:
        return "Builtin Speaker";
      case MediaDeviceType.audioHandset:
        return "Handset";
      case MediaDeviceType.videoFrontCamera:
        return "Front Camera";
      case MediaDeviceType.videoBackCamera:
        return "Back Camera";
      case MediaDeviceType.videoExternalCamera:
        return "External Camera";
      case MediaDeviceType.other:
        return "Other";
    }
  }
}
