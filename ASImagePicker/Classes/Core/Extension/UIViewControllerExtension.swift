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
        return (UIApplication.shared.keyWindow?.rootViewController)!
    }
}
