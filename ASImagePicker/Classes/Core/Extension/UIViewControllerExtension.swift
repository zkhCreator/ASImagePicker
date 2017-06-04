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
}
