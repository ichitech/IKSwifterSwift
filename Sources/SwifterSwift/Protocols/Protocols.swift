//
//  Protocols.swift
//  Classtmiru
//
//  Created by Binh Tran on 2/8/18.
//

import UIKit

// MARK: - Required protocol for tableview cell
public protocol TableViewCellProtocol {
    static func identifier() -> String
}

// MARK: - Required protocol for Realm
@objc public protocol RealmActionProtocol {
    @objc func delete(completion: ((Bool) -> Void)? )
}  
