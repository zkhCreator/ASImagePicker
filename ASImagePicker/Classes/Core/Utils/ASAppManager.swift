//
//  ASAppManager.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import UIKit

public class ASAppManager: NSObject {
    public static let shared = ASAppManager()
    
    // MARK: - usage info
    public var AppName:String = "App"
    
    // MARK: - UI
    public var tintColor:UIColor = UIColor.red
    public var titleFont:UIFont = UIFont.systemFont(ofSize: 14)
    public var titleColor:UIColor = UIColor.yellow
    public var contentMessageFont:UIFont = UIFont.systemFont(ofSize: 12)
    public var contentMessageColor:UIColor = UIColor.blue
    
    public let currentDevice = UIDevice.current
}
