//
//  IKViewControllerExtension.swift
//  SwifterSwift
//
//  Created by HarryTran on 10/3/20.
//  Copyright © 2020 SwifterSwift
//

#if canImport(UIKit) && os(iOS)
import UIKit
#if canImport(MBProgressHUD)
import MBProgressHUD
#endif
#if canImport(SwiftSpinner)
import SwiftSpinner
#endif

// MARK: - Methods
extension UIViewController {
    
    static var changeNightMode = Notification.Name("com.ik.changeNightMode")
        
    // Register the night mode notification for the current viewcontroller.
    // swiftlint:disable superfluous_disable_command line_length
    func registerForNigthModeNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(UserInterfaceProtocol.notificationDidChangeNightMode(_:)), name: UIViewController.changeNightMode, object: nil)
        self.perform(#selector(UserInterfaceProtocol.notificationDidChangeNightMode(_:)), with: nil)
    }

    // Deregister the night mode notification for the current viewcontroller.
    func unregisterForNigthModeNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIViewController.changeNightMode, object: nil)
    }
    // swiftlint:enable superfluous_disable_command line_length

    #if canImport(MBProgressHUD)
    private func hanldeIndicator(setHidden isHidden: Bool) {
        DispatchQueue.main.async {
            var sView = self.navigationController?.view
            if sView  == nil {
                sView = self.view
            }
            if let sView = sView {
                if isHidden {
                    MBProgressHUD.hide(for: sView, animated: true)
                } else {
                    MBProgressHUD.showAdded(to: sView, animated: true)
                }
            }
        }
    }
    
    func showIndicator() {
        self.hanldeIndicator(setHidden: false)
    }
    
    func hideIndicator() {
        self.hanldeIndicator(setHidden: true)
    }
    #endif
    
    #if canImport(SwiftSpinner)
    func showSpinnerIndicator(_ text: String = "Loading...") {
        SwiftSpinner.show(text)
    }
    
    func hideSpinnerIndicator() {
        SwiftSpinner.hide()
    }
    #endif
        
    func presentController(_ viewControllerToPresent: UIViewController, animated flag: Bool = true, style: UIModalPresentationStyle = .fullScreen, _ completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = style
        self.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}


// MARK: - Properties
public extension UIViewController {
    
    var isModal: Bool {
        return presentingViewController?.presentedViewController == self ||
            (navigationController != nil && navigationController?.presentingViewController?.presentedViewController == navigationController) ||
            (tabBarController?.presentingViewController is UITabBarController)
    }
    
    var isAlertController: Bool {
        return UIWindow.current?.visibleViewController is UIAlertController
    }
    
}

#endif
