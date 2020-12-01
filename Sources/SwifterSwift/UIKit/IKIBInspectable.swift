//
//  IKIBInspectable.swift
//  SwifterSwift-iOS
//
//  Created by HarryTran on 12/1/20.
//  Copyright © 2020 SwifterSwift. All rights reserved.
//

#if canImport(UIKit) && os(iOS) && canImport(Foundation)
import UIKit
import ObjectiveC
import Foundation

private var kImageTintColor     = "kImageTintColor"
private var kLocalizableString  = "kLocalizableString"

public extension UIImageView {

    @IBInspectable var imageTintColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &kImageTintColor) as? UIColor
        }
        set(color) {
            if let color = color {
                image = self.image?.copy(color)
                objc_setAssociatedObject(self, &kImageTintColor, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

    func setITintColor(_ iTintColor: UIColor?) {
        imageTintColor = iTintColor
    }

    func iTintColor() -> UIColor? {
        return imageTintColor
    }
}

public extension UIButton {
    
    /// Set the tintColor of current image for state UIControlStateNormal.
    @IBInspectable var imageTintColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &kImageTintColor) as? UIColor
        }
        set(color) {
            if let color = color {
                setImage(currentImage?.copy(color), for: .normal)
            }
        }
    }
    
    /// Set the tintColor of current background image for state UIControlStateNormal.
    @IBInspectable var backgroundImageTintColor: UIColor? {
        get {
            return nil
        }
        set(color) {
            if let color = color {
                setBackgroundImage(currentBackgroundImage?.copy(color), for: .normal)
            }
        }
    }
    
    /// Set localizable string of button title for state UIControlStateNormal.
    @IBInspectable var localizableString: String? {
        get {
            return objc_getAssociatedObject(self, &kLocalizableString) as? String
        }
        set(lzString) {
            if let lzString = lzString {
                setTitle(NSLocalizedString(lzString, comment: ""), for: .normal)
                objc_setAssociatedObject(self, &kLocalizableString, lzString, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

    func reloadLocalizable() {
        reloadlocalizableString()
    }

    func reloadlocalizableString() {
        if let localizableString = localizableString {
            setTitle(NSLocalizedString(localizableString, comment: ""), for: .normal)
        }
    }

    func setLocalizable(_ localizable: String?) {
        localizableString = localizable
    }

    func localizable() -> String? {
        return localizableString
    }
}

public extension UILabel {
    
    /// Set localizable string of text title.
    @IBInspectable var localizableString: String? {
        get {
            return objc_getAssociatedObject(self, &kLocalizableString) as? String
        }
        set(lzString) {
            if let lzString = lzString {
                text = NSLocalizedString(lzString, comment: "")
                objc_setAssociatedObject(self, &kLocalizableString, lzString, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

    func reloadLocalizable() {
        reloadlocalizableString()
    }

    func reloadlocalizableString() {
        if let localizableString = localizableString {
            text = NSLocalizedString(localizableString, comment: "")
        }
    }

    func setLocalizable(_ localizable: String?) {
        localizableString = localizable
    }

    func localizable() -> String? {
        return localizableString
    }
}

public extension UIBarButtonItem {
    /// Set localizable string of bar button title.
    @IBInspectable var localizableString: String? {
        get {
            return objc_getAssociatedObject(self, &kLocalizableString) as? String
        }
        set(lzString) {
            if let lzString = lzString {
                title = NSLocalizedString(lzString, comment: "")
                objc_setAssociatedObject(self, &kLocalizableString, lzString, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

    func reloadLocalizable() {
        reloadlocalizableString()
    }

    func reloadlocalizableString() {
        if let localizableString = localizableString {
            title = NSLocalizedString(localizableString, comment: "")
        }
    }

    func setLocalizable(_ localizable: String?) {
        localizableString = localizable
    }

    func localizable() -> String? {
        return localizableString
    }
}

#endif
