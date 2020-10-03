//
//  IKViewExtension.swift
//  SwifterSwift
//
//  Created by HarryTran on 9/28/20.
//  Copyright © 2020 SwifterSwift
//

import Foundation
import UIKit

// MARK: - UIView extensions
public extension UIView {
        
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
    func find<T>(by type: T.Type, where tagLessThanOrEqual: Int? = nil) -> [T] {
        let array = self.allSubViews.filter { (view) -> Bool in
            if let tagLessThanOrEqual = tagLessThanOrEqual {
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
    
    func find<T>(by type: T.Type, whereTagGreaterThanOrEqual tag: Int) -> [T] {
        let array = self.allSubViews.filter { (view) -> Bool in
            return view.isKind(of: type as! AnyClass) == true && view.tag >= tag
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
