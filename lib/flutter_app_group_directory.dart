import 'dart:io';

import './flutter_app_group_directory_method_channel.dart';

class FlutterAppGroupDirectory {
  /// Get the directory of the shared container for the app group.
  /// Returns null if the app group is not available.
  /// Only available on iOS and macOS.
  ///
  /// [appGroupId] The app group identifier.
  /// Returns a [Directory] object representing the shared container directory.
  static Future<Directory?> getAppGroupDirectory(String appGroupId) async {
    if (!FlutterAppGroupDirectory.isSupported) {
      return Future.value(null);
    }

    final appGroupPath =
        await MethodChannelFlutterAppGroupDirectory.getAppGroupDirectory(
            appGroupId);
    return appGroupPath != null ? Directory(appGroupPath) : null;
  }

  /// Check if the platform supports app group directories.
  /// Returns true if the platform is iOS or macOS.
  static bool get isSupported => (Platform.isIOS || Platform.isMacOS);
}
