import 'package:aws_chime_resource/models/meetings/audiovideo/attendee_update.dart';

/// [RealtimeObserver] lets one listen to real time events such a volume, signal strength, or
/// attendee changes.
///
/// Note: all callbacks will be called on main thread.
abstract class RealtimeObserver {
  /// Handles volume changes for attendees whose [VolumeLevel] has changed.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param volumeUpdates: VolumeUpdate - Attendee with updated volume levels.
  void attendeeVolumeChanged(VolumeUpdate volumeUpdate);

  /// Handles signal strength changes for attendees whose [SignalStrength] has changed.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param signalUpdates: SignalUpdate - Attendee with updated signal strengths.
  void attendeeSignalChanged(SignalUpdate signalUpdate);

  /// Handles attendee being added.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param attendeeInfo: AttendeeInfo - Attendee being added.
  void attendeeDidJoin(AttendeeInfo attendeeInfo);

  /// Handles attendee being removed.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param attendeeInfo: AttendeeInfo - Attendee being removed.
  void attendeeDidLeave(AttendeeInfo attendeeInfo);

  /// Handles attendee being dropped due to network.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param attendeeInfo: AttendeeInfo - Attendee being dropped.
  void attendeeDidDrop(AttendeeInfo attendeeInfo);

  /// Handles attendee whose [VolumeLevel] has changed to muted.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param attendeeInfo: AttendeeInfo - Attendee who are newly muted.
  void attendeeDidMute(AttendeeInfo attendee);

  /// Handles attendee whose [VolumeLevel] has changed to unmuted.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param attendeeInfo: AttendeeInfo - Attendee who are newly unmuted.
  void attendeeDidUnmute(AttendeeInfo attendee);
}
