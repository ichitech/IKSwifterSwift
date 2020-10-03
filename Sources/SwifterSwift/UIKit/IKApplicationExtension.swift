//
//  IKApplicationExtension.swift
//  SwifterSwift
//
//  Created by HarryTran on 10/3/20.
//  Copyright © 2020 SwifterSwift
//

#if canImport(UIKit) && os(iOS)
import UIKit

// MARK: - Properties
public extension UIApplication {
    var hasTopNotch: Bool {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
}

#endif
