import Cocoa
import FlutterMacOS

public class FlutterAppGroupDirectoryPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_app_group_directory", binaryMessenger: registrar.messenger)
    let instance = FlutterAppGroupDirectoryPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getAppGroupDirectory":
      guard let args = call.arguments as? [String: Any] else {
        result(FlutterError(code: "WRONG_ARGS", message: "Unknown data type in argument", details: nil))
        return
      }
      
      if let appGroupId = args["appGroupId"] as? String {
        result(getAppGroupDirectory(appGroupId: appGroupId))
      } else {
        result(FlutterError(code: "WRONG_ARGS", message: "appGroupId seems to be missing", details: nil))
      }
      break
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func getAppGroupDirectory(appGroupId: String) -> String? {
    let fileManager = FileManager.default
    
    if let groupURL = fileManager.containerURL(forSecurityApplicationGroupIdentifier: appGroupId) {
      return groupURL.path
    }
    
    return nil
  }
}
