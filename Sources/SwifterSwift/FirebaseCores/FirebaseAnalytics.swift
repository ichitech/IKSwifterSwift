//
//  FirebaseAnalytics.swift
//  Classtmiru
//
//  Created by Binh Tran on 3/23/18.
//

#if canImport(Firebase) && canImport(FirebaseAnalytics)
import Firebase
import FirebaseAnalytics
#if canImport(Foundation)
import Foundation
#endif
#if canImport(SwifterSwift)
import SwifterSwift
#endif

private extension UIDevice {
    var fbPlatform: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        if let value = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] {
            return value
        } else {
            return identifier
        }
    }
}

public enum AnalyticKey: String, CaseIterable {
    case storeRequestReview
    case reviewAppBad
    case reviewAppUseful
    case addPasscode
    case removePasscode
    case requestNewFeatures
    case shareApplication
    case rateReview
    case loadBrowser
    case viewBatteryInfo
    case viewSystemState
    case updatePasscode
    case sendFeedbackMail
    case aboutUs
    case facebookFollow

    public var key: String {
        var string = self.rawValue
        var chars = [String]()
        for char in string where char.isUppercase {
            chars.append(String(char))
        }
        let set = Set(chars)
        for item in set {
            string = string.replace(string: item, replacement: "_" + item.lowercased())
        }
        return string
    }
}

public class FirebaseAnalytics {
    
    public class func tracking(_ viewController: UIViewController) {
        if let title = viewController.title, !title.isEmpty {
            Analytics.setScreenName(title, screenClass: viewController.className)
        } else {
            Analytics.setScreenName(viewController.className, screenClass: viewController.className)
        }
    }
    
    public class func logEvent(name: String, parameters params: [String: Any]? = nil) {
        #if canImport(SwifterSwift)
        var events = [String: Any]()
        let device = UIDevice.current
        events["platformModel"] = device.model
        events["name"]          = device.name
        events["systemVersion"] = device.systemVersion
        if let appVersion = UIApplication.shared.version, let build = UIApplication.shared.buildNumber {
            events["appVersion"] = appVersion
            events["build"]      = build
            events["versionBuild"] = "v\(appVersion)(\(build)"
        }
        events["platform"]      = UIDevice.current.fbPlatform
        events["time"]          = Date().string(withFormat: "EEE, dd MMM yyyy HH:mm")
        events["time_zone"]     = Date().string(withFormat: "ZZZ")
        events["locale_identifier"] = Locale.current.identifier
        if let params = params {
            params.forEach { (key, value) in
                events[key] = value
            }
        }
        Analytics.logEvent(name, parameters: events)
        #else
        print("Couldn't add the event by using FirebaseAnalytics, please install the podfile 'SwifterSwift'")
        #endif
    }
    
    public class func logEvent(analyticKey: AnalyticKey, parameters params: [String: Any]? = nil) {
        self.logEvent(name: analyticKey.key, parameters: params)
    }

}

#endif
