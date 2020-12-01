//
//  IKUIImageExtension.swift
//  SwifterSwift-iOS
//
//  Created by HarryTran on 12/1/20.
//  Copyright © 2020 SwifterSwift. All rights reserved.
//

#if canImport(UIKit) && os(iOS)
import UIKit

// MARK: - Methods
public extension UIImage {
    
    func copy(_ tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(.normal)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        if let cgImage = cgImage {
            context?.clip(to: rect, mask: cgImage)
        }
        tintColor.setFill()
        context?.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }

    @available(iOS, introduced: 7.0, deprecated: 13.4, message: "Use copy(tintColor:) instead.")
    func copy(withTintColor: UIColor) -> UIImage {
        return copy(withTintColor)
    }
    
}

#endif
