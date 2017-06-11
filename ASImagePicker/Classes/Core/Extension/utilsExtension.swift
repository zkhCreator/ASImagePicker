//
//  utilsExtension.swift
//  Pods
//
//  Created by zkhCreator on 11/06/2017.
//
//

import Foundation
import UIKit

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

extension UIImage {
    // get Image From current bundle
    static public func getImage(imageName:String) -> UIImage? {
        guard let image = UIImage.init(named: imageName, in: Bundle.getBundle(), compatibleWith: nil) else {
            return nil
        }
        
        return image
    }
}

extension UIViewController {
    static public func topViewController() -> UIViewController {
        let rootvc = (UIApplication.shared.delegate!).window??.rootViewController;
        return rootvc!
    }
    
    static public func warningAlertViewController(title:String, message:String) -> UIAlertController {
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "ok".localization(bundle: Bundle.getBundle()), style: .default, handler: nil);
        
        alertVC.addAction(okAction)
        
        return alertVC;
    }
}


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
}
