//
//  viewControllerExtension.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import Foundation
import UIKit

extension UIViewController {
    static func topViewController() -> UIViewController {
        let rootvc = (UIApplication.shared.delegate!).window??.rootViewController;
        return rootvc!
    }
    
    static func warningAlertViewController(title:String, message:String) -> UIAlertController {
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "ok".localization(bundle: Bundle.getBundle()), style: .default, handler: nil);
        
        alertVC.addAction(okAction)
        
        return alertVC;
    }
}
