import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// An implementation of [FlutterAppGroupDirectoryPlatform] that uses method channels.
class MethodChannelFlutterAppGroupDirectory {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  static const methodChannel = MethodChannel('flutter_app_group_directory');

  static Future<String?> getAppGroupDirectory(String appGroupId) {
    return methodChannel.invokeMethod<String?>('getAppGroupDirectory', {
      'appGroupId': appGroupId,
    });
  }
}
