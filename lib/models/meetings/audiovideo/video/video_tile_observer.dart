import 'package:aws_chime_resource/models/meetings/audiovideo/video/video_tile_state.dart';

abstract class VideoTileObserver {
  /// Called whenever an attendee starts sharing the video.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param tileState: [VideoTileState] - Video tile state associated with new attendee.
  void videoTileDidAdd(VideoTileState tileState);

  /// Called whenever any attendee stops sharing the video.
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param tileState: [VideoTileState] - Video tile state associated with attendee who is removed.
  void videoTileDidRemove(VideoTileState tileState);

  /// Called whenever an attendee tile pauseState changes from [VideoPauseState.unpaused].
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param tileState: [VideoTileState] - Video tile state associated with attendee who is paused.
  void videoTileDidPaused(VideoTileState tileState);

  /// Called whenever an attendee tile pauseState changes to [VideoPauseState.unpaused].
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param tileState: [VideoTileState] - Video tile state associated with attendee who is resumed.
  void videoTileDidResumed(VideoTileState tileState);

  /// Called whenever a video steam content size is changed
  ///
  /// Note: this callback will be called on main thread.
  ///
  /// @param tileState: [VideoTileState] - Video tile state associated with attendee who is resumed.
  void videoTileDidSizeChange(VideoTileState tileState);
}
