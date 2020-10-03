//
//  IKSearchBarExtension.swift
//  SwifterSwift
//
//  Created by HarryTran on 10/3/20.
//  Copyright © 2020 SwifterSwift
//

#if canImport(UIKit) && os(iOS)
import UIKit
#if canImport(SwifterSwift)
import SwifterSwift
#endif

// MARK: - Properties
public extension UISearchBar {
    func setMagnifyingGlassColor(_ color: UIColor) {
        if let glassIconView = searchField?.leftView as? UIImageView {
            glassIconView.image     = glassIconView.image?.withRenderingMode(.alwaysTemplate)
            glassIconView.tintColor = color
        }
    }
    
    func setClearButtonColor(_ color: UIColor) {
        if let crossIconView = searchField?.value(forKey: "clearButton") as? UIButton {
            crossIconView.setImage(crossIconView.currentImage?.withRenderingMode(.alwaysTemplate), for: .normal)
            crossIconView.tintColor = color
        }
    }
    
    func setPlaceholderTextColor(_ color: UIColor) {
        #if canImport(SwifterSwift)
        if #available(iOS 13.0, *) {
            self.searchTextField.setPlaceHolderTextColor(color)
        } else {
            if let textFieldInsideSearchBarLabel = searchField?.value(forKey: "placeholderLabel") as? UILabel {
                textFieldInsideSearchBarLabel.textColor = color
            }
        }
        #else
        print("Couldn't set the place holder text color, please install the podfile 'SwifterSwift'")
        #endif
    }
}

// MARK: - Methods
public extension UISearchBar {
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
