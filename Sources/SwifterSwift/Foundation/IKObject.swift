//
//  IKObject.swift
//  SwifterSwift-iOS
//
//  Created by HarryTran on 10/3/20.
//  Copyright © 2020 SwifterSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation

var kNSObjectSenderDataKey = "kNSObjectSenderDataKey"

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
    
    var isNull: Bool {
        return self.isEqual(NSNull())
    }
    
    var sender: Any? {
        get {
            return objc_getAssociatedObject(self, &kNSObjectSenderDataKey)
        }
        set(senderObject) {
            objc_setAssociatedObject(self, &kNSObjectSenderDataKey, senderObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

#endif
