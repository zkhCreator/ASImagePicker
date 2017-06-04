//
//  BundleExtension.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import Foundation

extension Bundle {
    public func getBundle(for aClass: Swift.AnyClass) -> Bundle? {
        let frameworkBundle = Bundle.init(for: aClass)
        guard let bundlePath = frameworkBundle.path(forResource: String.init(describing: aClass.self), ofType: "bundle") else {
            return nil
        }
        
        let bundle = Bundle.init(path: bundlePath)
        
        return bundle
    }
}
