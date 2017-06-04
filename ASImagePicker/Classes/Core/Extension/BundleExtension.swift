//
//  BundleExtension.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import Foundation

extension Bundle {
    static public func getBundle() -> Bundle? {
        let frameworkBundle = Bundle.init(for: ASImagePickerManager.self)
        guard let bundlePath = frameworkBundle.path(forResource: "ASImagePicker", ofType: "bundle") else {
            return nil
        }
        
        let bundle = Bundle.init(path: bundlePath)
        
        return bundle;
    }
}
