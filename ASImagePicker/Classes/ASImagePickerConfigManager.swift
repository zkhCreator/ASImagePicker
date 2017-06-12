//
//  ASImagePickerConfigManager.swift
//  Pods
//
//  Created by zkhCreator on 12/06/2017.
//
//

import UIKit

public enum ASSelectImageModel {
    case both
    case onlyAlbum
    case onlyCamera
}

public class ASImagePickerConfigManager: NSObject {
    static public let shared = ASImagePickerConfigManager()
    let startLog:Bool
    let model:ASSelectImageModel
    
    public init(log:Bool = true, model:ASSelectImageModel = ASSelectImageModel.both) {
        self.startLog = log
        self.model = model
    }
    
}
