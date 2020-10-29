//
//  IKColorExtension.swift
//  SwifterSwift-iOS
//
//  Created by HarryTran on 10/4/20.
//  Copyright © 2020 SwifterSwift. All rights reserved.
//

#if canImport(UIKit) && canImport(Foundation)
import UIKit
import Foundation

@available(iOS, introduced: 9.0, deprecated: 13.4, message: "Use NSCoder.color(for:alpha:) instead.")
public func UIColorFromString(_ string: String, alpha: CGFloat = 1) -> UIColor {
    return UIColor(hexCode: string, alpha: alpha)
}

@available(iOS, introduced: 9.0, deprecated: 13.4, message: "Use NSCoder.string(for:) instead.")
public func NSStringFromUIColor(_ color: UIColor) -> String {
    return color.rgbString
}

// MARK: - Initializers
// swiftlint:disable superfluous_disable_command identifier_name large_tuple
public extension UIColor {
    
    convenience init(hexCode: String, alpha: CGFloat = 1) {
        var r = CGFloat(255)
        var g = CGFloat(255)
        var b = CGFloat(255)
        var a = (alpha <= 1 && alpha >= 0) ? alpha : CGFloat(1)
        var hexColor = hexCode.replacingOccurrences(of: "#", with: "", options: String.CompareOptions.literal, range: nil)
        if hexColor.count == 6 {
            hexColor = hexColor.appending("ff")
        }
        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
            }
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    convenience init(hex: Int) {
        let hexCode = String(hex, radix: 16, uppercase: false)
        self.init(hexCode: hexCode)
    }
    
}

// MARK: - Properties
public extension UIColor {
    var rgbComponents:(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            return (r, g, b, a)
        }
        return (0, 0, 0, 0)
    }
    
    // hue, saturation, brightness and alpha components from UIColor**
    var hsbComponents:(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var hue:CGFloat = 0
        var saturation:CGFloat = 0
        var brightness:CGFloat = 0
        var alpha:CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return (hue, saturation, brightness, alpha)
        }
        return (0, 0, 0, 0)
    }
    
    var rgbString: String {
        return String(format: "#%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255), Int(rgbComponents.blue * 255))
    }
    
    var rgbaString: String {
        return String(format: "#%02x%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255), Int(rgbComponents.blue * 255), Int(rgbComponents.alpha * 255) )
    }
}

// MARK: - Methods
public extension NSCoder {
    class func color(for string: String, alpha: CGFloat = 1) -> UIColor {
        return UIColor(hexCode: string, alpha: alpha)
    }
    
    class func string(for color: UIColor) -> String {
        return color.rgbString
    }
}

#endif
