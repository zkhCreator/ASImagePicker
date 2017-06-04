//
//  BundleExtension.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import Foundation

public func currentBundle(className:AnyClass) -> Bundle? {
    let frameworkBundle = Bundle.init(for: className)
    guard let bundlePath = frameworkBundle.path(forResource: String.init(describing: className.self), ofType: "bundle") else {
        return nil
    }
    
    let bundle = Bundle.init(path: bundlePath)
    
    return bundle
}
