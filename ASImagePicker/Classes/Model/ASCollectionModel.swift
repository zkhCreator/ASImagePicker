//
//  ASCollectionModel.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import UIKit
import Photos

class ASCollectionModel: NSObject {
    let name:String
    let count:Int
    let thumbnails:UIImage
    
    init(assetColletion:PHAssetCollection) {
        self.name = assetColletion.localizedLocationNames.first!
        self.count = assetColletion.estimatedAssetCount
        self.thumbnails = UIImage()
    }
}
