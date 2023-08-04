import 'package:aws_chime_resource/models/meetings/realtime/datamessage/data_message.dart';

/// [DataMessageObserver] lets one listen to data message receiving event.
/// One can subscribe this observer to multiple data message topic in order
/// to receive and process the message that sent to the topics.
///
///  Note: callback will be called on main thread.
abstract class DataMessageObserver {
  /// Handles data message being received.
  ///
  /// Note: Data messages sent from local participant will not trigger this callback unless it's throttled.
  ///
  /// @param dataMessage: [DataMessage] - data message being received
  void dataMessageReceived(DataMessage dataMessage);
}
