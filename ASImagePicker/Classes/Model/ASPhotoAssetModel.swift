//
//  ASPhotoAssetModel.swift
//  Pods
//
//  Created by zkhCreator on 11/06/2017.
//
//

import UIKit
import Photos

public class ASPhotoAssetModel: NSObject {
    let asset:PHAsset
    
    init(asset:PHAsset) {
        self.asset = asset
        super.init()
    }
    
    static func == (left: inout ASPhotoAssetModel, right: inout ASPhotoAssetModel) {
        left.asset == right.asset
    }
}
