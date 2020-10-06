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

    var key: String {
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

class FirebaseAnalytics {
    
    class func tracking(_ viewController: UIViewController) {
        if let title = viewController.title, !title.isEmpty {
            Analytics.setScreenName(title, screenClass: viewController.className)
        } else {
            Analytics.setScreenName(viewController.className, screenClass: viewController.className)
        }
    }
    
    class func logEvent(name: String, parameters params: [String: Any]? = nil) {
        var events = [String: Any]()
        let device = UIDevice.current
        events["platformModel"] = device.platformModelName()
        events["name"]          = device.name
        events["systemVersion"] = device.systemVersion
        events["appVersion"]    = UIApplication.shared.appVersion
        events["build"]         = UIApplication.shared.build
        events["versionBuild"]  = UIApplication.shared.versionBuild
        events["platform"]      = device.platform()
        events["time"]          = NSDate().string(withFormatter: "EEE, dd MMM yyyy HH:mm", with: Locale(identifier: "en-US"))
        events["time_zone"]     = NSDate().string(withFormatter: "ZZZ", with: Locale(identifier: "en-US"))
        events["locale_identifier"] = Locale.current.identifier
        if let params = params {
            params.forEach { (key, value) in
                events[key] = value
            }
        }
        Analytics.logEvent(name, parameters: events)
    }
    
    class func logEvent(analyticKey: AnalyticKey, parameters params: [String: Any]? = nil, sender: Any? = nil) {
        self.logEvent(name: analyticKey.key, parameters: params)
    }

}

#endif
