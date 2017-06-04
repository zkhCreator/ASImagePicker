//
//  StringExtension.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import Foundation

extension String {
    public func localization(bundle: Bundle) -> String {
        return NSLocalizedString(self, bundle: bundle, comment: self)
    }
    
    public func localization() -> String {
        return NSLocalizedString(self, comment: self)
    }
    
    static func localization(key: String, bundle: Bundle) -> String {
        return NSLocalizedString(key, tableName: nil, bundle: bundle, value: key, comment: key)
    }
    
    static func localization(key: String) -> String {
        return NSLocalizedString(key, comment: key)
    }
}
