//
//  ASAssetsModels.swift
//  Pods
//
//  Created by 章凯华 on 16/07/2017.
//
//

import UIKit
import Photos

class ASAssetModel: NSObject {
    let sourceAsset:PHAsset
    let type:PHAssetMediaType
    let createData:Date?
    let modificationDate:Date?
    
    init(assets:PHAsset) {
        self.sourceAsset = assets
        self.type = assets.mediaType;
        self.createData = assets.creationDate
        self.modificationDate = assets.modificationDate
        
        super.init()
    }
    
    static func == (left: ASAssetModel, right: ASAssetModel) -> Bool {
        return left.sourceAsset == right.sourceAsset
    }
    
    static func != (left: ASAssetModel, right: ASAssetModel) -> Bool {
        return left.sourceAsset != right.sourceAsset
    }
}
