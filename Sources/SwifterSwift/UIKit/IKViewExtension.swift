//
//  IKViewExtension.swift
//  SwifterSwift
//
//  Created by HarryTran on 9/28/20.
//  Copyright © 2020 SwifterSwift
//

#if canImport(UIKit) && os(iOS)
import UIKit

// MARK: - Protocol for change UI
@objc public protocol UserInterfaceProtocol {
    
    // Call this method to reload the localization strings in current view controller.
    @objc optional func reloadLocalizedStrings()
    
    // The method will be called when the night mode did change.
    func notificationDidChangeNightMode(_ notification: NSNotification?)
}

// MARK: - Methods
public extension UIView {
    
    static var changeNightMode = Notification.Name("com.ik.changeNightMode")
    
    // swiftlint:disable superfluous_disable_command line_length
    func registerForNigthModeNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(IKSwifterSwift.UserInterfaceProtocol.notificationDidChangeNightMode(_:)), name: UIView.changeNightMode, object: nil)
        self.perform(#selector(IKSwifterSwift.UserInterfaceProtocol.notificationDidChangeNightMode(_:)), with: nil)
    }

    func unregisterForNigthModeNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIView.changeNightMode, object: nil)
    }
    // swiftlint:enable superfluous_disable_command line_length

    private var allSubViews: [UIView] {
        var array = [self.subviews].flatMap {$0}
        array.forEach {
            array.append(contentsOf: $0.allSubViews)
        }
        return array
    }
    
    private func allSubViews(typeOf `class`: AnyClass) -> [UIView] {
        let array = self.allSubViews.filter { (view) -> Bool in
            return (view.isKind(of: `class`)) == true
        }
        return array
    }

    // swiftlint:disable superfluous_disable_command force_cast
    func find<T>(by type: T.Type, whereTagLessThanOrEqual tag: Int? = nil) -> [T] {
        let array = self.allSubViews.filter { (view) -> Bool in
            if let tagLessThanOrEqual = tag {
                return view.isKind(of: type as! AnyClass) == true && view.tag <= tagLessThanOrEqual
            } else {
                return view.isKind(of: type as! AnyClass) == true
            }
        }
        if !array.isEmpty {
            return array as! [T]
        }
        return []
    }
    
    func find<T>(by type: T.Type, whereTagGreaterThanOrEqual tag: Int? = nil) -> [T] {
        let array = self.allSubViews.filter { (view) -> Bool in
            if let tagGreaterThanOrEqual = tag {
                return view.isKind(of: type as! AnyClass) == true && view.tag >= tagGreaterThanOrEqual
            } else {
                return view.isKind(of: type as! AnyClass) == true
            }
        }
        if !array.isEmpty {
            return array as! [T]
        }
        return []
    }

    func copyView<T: UIView>() -> T {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
    }
    // swiftlint:disable superfluous_disable_command force_cast
    
    func setDisabled(_ disabled: Bool = true) {
        isUserInteractionEnabled = !disabled
        alpha = disabled ? 0.65 : 1
    }
}

#endif
