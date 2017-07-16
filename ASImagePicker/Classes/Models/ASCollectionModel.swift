//
//  ASCollectionModel.swift
//  Pods
//
//  Created by 章凯华 on 16/07/2017.
//
//

import UIKit
import Photos

class ASCollectionModel: NSObject {
    
    let sourceColletion:PHAssetCollection
    let name:String
    var count:Int
    let thumbnail:UIImage?
    
    static let defaultCollection = ASCollectionModel.init(assetCollection: PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil).firstObject!);
    
    init(assetCollection:PHAssetCollection) {
        self.sourceColletion = assetCollection
        self.name = assetCollection.localizedTitle ?? "no name"
        self.count = assetCollection.estimatedAssetCount
        // TODO: set the thumbnail value after load the tumbnail Image in collection
        self.thumbnail = nil
        
        super.init()
    }
}
