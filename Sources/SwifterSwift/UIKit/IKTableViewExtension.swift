//
//  IKTableViewExtension.swift
//  SwifterSwift-iOS
//
//  Created by HarryTran on 10/4/20.
//  Copyright © 2020 SwifterSwift. All rights reserved.
//

#if canImport(UIKit) && os(iOS) && canImport(Foundation)
import UIKit
import Foundation

// MARK: - Methods
public extension UITableView {

    func indexPathForRow(with event: UIEvent) -> IndexPath? {
        let touch = event.allTouches?.first
        let point = touch?.location(in: self)
        return indexPathForRow(at: point ?? CGPoint.zero)
    }

    func isLast(_ currentIndexPath: IndexPath) -> Bool {
        let lastSection = numberOfSections - 1
        let lastRow = numberOfRows(inSection: lastSection) - 1
        return (currentIndexPath.section == lastSection) && (currentIndexPath.row == lastRow) && lastRow > 0
    }
}

// MARK: - Methods
public extension UITableView {
    @available(iOS, introduced: 9.0, deprecated: 13.0, message: "Use NSCoder.indexPath(for:) instead.")
    class func NSIndexPathFromString(_ string: String) -> IndexPath {
        let point = NSCoder.cgPoint(for: string)
        return Foundation.IndexPath(row: Int(point.y), section: Int(point.x))
    }

    @available(iOS, introduced: 9.0, deprecated: 13.0, message: "Use NSCoder.string(for:) instead.")
    class func NSStringFromNSIndexPath(_ indexPath: IndexPath) -> String? {
        let point = CGPoint(x: CGFloat(Int(indexPath.section)), y: CGFloat(Int(indexPath.row)))
        return NSCoder.string(for: point)
    }
}


#endif
