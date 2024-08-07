import Flutter
import UIKit
import GoogleMaps 

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyBKZT7yyay-HmytyxkR8FaFxW5uhm4MbZs")            
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
