//
//  IKSearchBarExtension.swift
//  SwifterSwift
//
//  Created by HarryTran on 10/3/20.
//  Copyright © 2020 SwifterSwift
//

#if canImport(UIKit) && os(iOS)
import UIKit

// MARK: - Properties
public extension UISearchBar {
    func setMagnifyingGlassColorTo(color: UIColor) {
        // Search Icon
        let glassIconView = searchField.leftView as? UIImageView
        glassIconView?.image = glassIconView?.image?.withRenderingMode(.alwaysTemplate)
        glassIconView?.tintColor = color
    }
    
    func setClearButtonColorTo(color: UIColor) {
        // Clear Button
        let crossIconView = searchField.value(forKey: "clearButton") as? UIButton
        crossIconView?.setImage(crossIconView?.currentImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        crossIconView?.tintColor = color
    }
    
    func setPlaceholderTextColorTo(color: UIColor) {
        if #available(iOS 13.0, *) {
            self.searchTextField.textColor = color
            self.searchTextField.placeholderColor = color
        } else {
            searchField.textColor = color
            let textFieldInsideSearchBarLabel = searchField.value(forKey: "placeholderLabel") as? UILabel
            textFieldInsideSearchBarLabel?.textColor = color
        }
    }
    
    var searchField: UITextField? {
        if #available(iOS 13.0, *) {
            return searchTextField
        }
        let subViews = subviews.flatMap { $0.subviews }
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
            return nil
        }
        return textField
    }
}

#endif
