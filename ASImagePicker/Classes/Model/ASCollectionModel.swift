//
//  ASCollectionModel.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import UIKit
import Photos

public class ASCollectionModel: NSObject {
    let name:String
    let count:Int
    let thumbnail:UIImage?
    let assetCollection:PHAssetCollection
    
    static let defaultCollection = ASCollectionModel.init(assetCollection: PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil).firstObject!);
    
    init(assetCollection:PHAssetCollection) {
        self.name = assetCollection.localizedTitle ?? "no name"
        self.count = assetCollection.estimatedAssetCount
// TODO: set the thumbnail value after load the tumbnail Image in collection
        self.thumbnail = nil
        self.assetCollection = assetCollection
    }
    
}
