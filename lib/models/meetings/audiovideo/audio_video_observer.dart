import 'package:aws_chime_resource/models/meetings/audiovideo/video/remote_video_source.dart';
import 'package:aws_chime_resource/models/meetings/session/meeting_session_status.dart';

abstract class AudioVideoObserver {
  /// Called when the audio session is connecting or reconnecting.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param reconnecting: [bool] - Whether the session is reconnecting or not.
  void audioSessionStartedConnecting(bool reconnecting);

  /// Called when the audio session has started.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param reconnecting: [bool] - Whether the session is reconnecting or not.
  void audioSessionStarted(bool reconnecting);

  /// Called when audio session got dropped due to poor network conditions.
  /// There will be an automatic attempt of reconnecting it.
  /// If the reconnection is successful, [audioSessionStarted] will be called with value of reconnecting as true
  ///
  /// Note: this callback will be called on main thread.
  void audioSessionDropped();

  /// Called when the audio session has stopped with the reason
  /// provided in the status. This callback implies that audio client has stopped permanently for this session and there will be
  /// no attempt of reconnecting it.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param sessionStatus: [MeetingSessionStatus] - The reason why the session has stopped.
  void audioSessionDidStop();

  /// Called when audio session cancelled reconnecting.
  ///
  /// Note: this callback will be called on main thread.
  void audioSessionCancelledReconnect();

  /// Called when the connection health is recovered.
  ///
  /// Note: this callback will be called on main thread.
  void connectionRecovered();

  /// Called when connection became poor.
  ///
  /// Note: this callback will be called on main thread.
  void connectionBecamePoor();

  /// Called when the video session is connecting or reconnecting.
  ///
  /// Note: this callback will be called on main thread.
  void videoSessionStartedConnecting();

  /// Called when the video session has started. Sometimes there is a non fatal error such as
  /// trying to send local video when the capacity was already reached. However, user can still
  /// receive remote video in the existing video session.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param sessionStatus: [MeetingSessionStatus] - Additional details on how the video session started.
  void videoSessionStarted(MeetingSessionStatus sessionStatus);

  /// Called when the video session has stopped from a started state with the reason
  /// provided in the status.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param sessionStatus: [MeetingSessionStatus] - The reason why the session has stopped.
  void videoSessionStopped(MeetingSessionStatus sessionStatus);

  /// Called when remote video source is/are no longer available.
  ///
  /// Note that these sources do not need to be removed via `updateVideoSourceSubscriptions`,
  /// as they will be automatically unsubscribed from.
  ///
  /// @param source: [RemoteVideoSource]
  void remoteVideoSourceUnavailable(RemoteVideoSource source);

  /// Called when remote video source is/are now available.
  ///
  /// Video sources can be explicitly subscribed to through `updateVideoSourceSubscriptions`.
  /// These should be stored and used when `updateVideoSourceSubscriptions` is called (i.e. you cannot use `RemoteVideoSource` objects created manually).
  /// See `updateVideoSourceSubscriptions` for more information.
  /// See note in `updateVideoSourceSubscriptions` documentation for information on
  /// subscription behavior if `updateVideoSourceSubscriptions` is never called.
  ///
  /// @param source: [RemoteVideoSource]
  void remoteVideoSourceAvailable(RemoteVideoSource source);

  /// Called when video capacity status is updated.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param available: [bool] - True if camera send is available (video capacity status is false).
  void cameraSendAvailabilityUpdated(bool available);
}
