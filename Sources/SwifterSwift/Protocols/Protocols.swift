//
//  Protocols.swift
//  Classtmiru
//
//  Created by Binh Tran on 2/8/18.
//

import UIKit

// MARK: Protocol for change UI
@objc protocol UserInterfaceProtocol {
    
    // Call this method to reload the localization strings in current view controller.
    @objc optional func reloadLocalizedStrings()
    
    // The method will be called when the night mode did change.
    func notificationDidChangeNightMode(_ notification: NSNotification?)
}

// MARK: Required protocol for tableview cell
protocol TableViewCellProtocol {
    static func identifier() -> String
}

// MARK: Required protocol for Realm
@objc protocol RealmActionProtocol {
    @objc func delete(completion: ((Bool) -> Void)? )
}  
