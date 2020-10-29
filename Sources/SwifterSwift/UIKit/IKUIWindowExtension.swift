//
//  IKUIWindowExtension.swift
//  SwifterSwift-iOS
//
//  Created by HarryTran on 10/4/20.
//  Copyright © 2020 SwifterSwift. All rights reserved.
//

#if canImport(UIKit) && os(iOS)
import UIKit

// MARK: - Properties
public extension UIWindow {
    
    class var current: UIWindow? {
        var window = UIApplication.shared.keyWindow
        if window == nil {
            window = UIApplication.shared.windows.first
        }
        return window
    }
    
    var visibleViewController: UIViewController? {
        return UIWindow.visibleViewController(from: self.rootViewController)
    }

    private class func visibleViewController(from controller: UIViewController?) -> UIViewController? {
        if controller is UINavigationController {
            return UIWindow.visibleViewController(from: (controller as? UINavigationController)?.visibleViewController)
        } else if controller is UITabBarController {
            return UIWindow.visibleViewController(from: (controller as? UITabBarController)?.selectedViewController)
        } else {
            if controller?.presentedViewController != nil {
                return UIWindow.visibleViewController(from: controller?.presentedViewController)
            } else {
                return controller
            }
        }
    }
}

#endif
