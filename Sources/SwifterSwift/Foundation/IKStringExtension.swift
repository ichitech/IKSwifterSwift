//
//  IKStringExtension.swift
//  SwifterSwift
//
//  Created by HarryTran on 9/28/20.
//  Copyright © 2020 SwifterSwift
//

#if canImport(Foundation)
import Foundation
#endif

#if canImport(UIKit)
import UIKit
#endif

// MARK: - Methods
public extension String {
   
    /// Remove all the whitespace from the beginning and end of a String
    func trimString() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    }
    
    /// Replaces all occurances from string with replacement
    func replace(string: String, replacement: String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: String.CompareOptions.literal, range: nil)
    }
    
    func sub(toIndex index: Int = 4) -> String {
        if self.count <= index {
            return self
        }
        let range = startIndex..<self.index(startIndex, offsetBy: index)
        return String(self[range])
    }
}

// MARK: - Properties
public extension String {
    
    /// Validate URL
    var isUrl: Bool {
        if let url = URL(string: self) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
}
