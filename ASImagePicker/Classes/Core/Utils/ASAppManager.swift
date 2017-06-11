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
    
    public let currentDevice = UIDevice.current
}
