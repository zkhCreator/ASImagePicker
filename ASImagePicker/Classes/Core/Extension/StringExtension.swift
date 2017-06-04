//
//  StringExtension.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import Foundation

extension String {
    public func localization(bundle: Bundle?) -> String {
        guard (bundle != nil) else {
            return NSLocalizedString(self, comment: self)
        }
        
        return NSLocalizedString(self, bundle: bundle!, comment: self)
    }
    
    public func localization() -> String {
        return self.localization(bundle: nil)
    }
    
    static func localization(key: String, bundle: Bundle?) -> String {
        
        guard (bundle != nil) else {
            return NSLocalizedString(key, comment: key);
        }
        
        return NSLocalizedString(key, tableName: nil, bundle: bundle!, comment: key)
    }
    
    static func localization(key: String) -> String {
        return self.localization(key: key, bundle: nil)
    }
}
