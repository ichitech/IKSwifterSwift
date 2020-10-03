//
//  IKObject.swift
//  SwifterSwift-iOS
//
//  Created by HarryTran on 10/3/20.
//  Copyright © 2020 SwifterSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation

// MARK: - Methods
public extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}

// MARK: - Properties
public extension NSObject {
    var className: String {
        return NSStringFromClass(type(of: self))
    }
}

#endif
