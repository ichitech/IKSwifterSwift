//
//  IKCoderExtension.swift
//  SwifterSwift-iOS
//
//  Created by HarryTran on 10/4/20.
//  Copyright © 2020 SwifterSwift. All rights reserved.
//

#if canImport(Foundation) && canImport(UIKit)
import Foundation
import UIKit

public extension NSCoder {
    class func indexPath(for string: String) -> IndexPath {
        let point = NSCoder.cgPoint(for: string)
        return Foundation.IndexPath(row: Int(point.y), section: Int(point.x))
    }
    
    class func string(for indexPath: IndexPath) -> String {
        let point = CGPoint(x: CGFloat(Int(indexPath.section)), y: CGFloat(Int(indexPath.row)))
        return NSCoder.string(for: point)
    }
    
//    class func color(for hexCode: String) -> String {
//        let point = CGPoint(x: CGFloat(Int(indexPath.section)), y: CGFloat(Int(indexPath.row)))
//        return NSCoder.string(for: point)
//    }
}

#endif
