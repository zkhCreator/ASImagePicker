//
//  ASAlbumUtilsManager.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import UIKit
import Photos

public class ASAlbumUtilsManager: NSObject {
    public static let shared = ASAlbumUtilsManager()
    
    public let albumListVC:ASAlbumListViewController
    public let photoListVC:ASPhotoCollectionViewController
    
    override init() {
        self.albumListVC = ASAlbumListViewController();
        self.photoListVC = ASPhotoCollectionViewController()
        
        super.init()
    }

    // MARK: - Authorization
    // check access to album
    static public func checkAlbumAuth(completion:@escaping ()->()) {
        
        let status = PHPhotoLibrary.authorizationStatus()
        if status == .authorized {
            completion()
            return ;
        }
        
        if status == .notDetermined {
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == .authorized {
                    completion()
                }
            })
            
            return ;
        }
        
        if status == .denied || status == .restricted {
            let bundle = Bundle.getBundle()
            let alertVC = UIViewController.warningAlertViewController(title: "warning".localization(bundle: bundle), message: String.init(format: "please_open_album_access".localization(bundle: bundle), ASAppManager.shared.AppName))
            UIViewController.topViewController().present(alertVC, animated: true, completion: nil);
        }
    }
    
    // MARK: - Photo List
    static func loadAllCollection() -> Array<PHAssetCollection> {
        var resultArray:Array<PHAssetCollection> = []
        
        let myPhotoStreamAlbum = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumMyPhotoStream, options: nil);
        let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
        let topLevelUserCollections = PHCollectionList.fetchTopLevelUserCollections(with: nil);
        let syncedAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumSyncedAlbum, options: nil)
        let sharedAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumCloudShared, options: nil)
        
        let results = [myPhotoStreamAlbum,
                       smartAlbums,
                       topLevelUserCollections,
                       syncedAlbums,
                       sharedAlbums]
        
        
        
        for obj in results {
            if obj is PHFetchResult<AnyObject> {
                let result = obj as! PHFetchResult<AnyObject>
                result.enumerateObjects({ (item, count, stop) in
                    if item is PHAssetCollection {
                        resultArray.append(item as! PHAssetCollection)
                    } else {
                        stop.pointee = true
                    }
                })
            }
        }
        return resultArray
    }
    
    static public func loadAllASCollectionModels() -> Array<ASCollectionModel> {
        return convertCollections(collections: loadAllCollection())
    }
    
    static public func convertCollections(collections:Array<PHAssetCollection>) -> Array<ASCollectionModel> {
        
        var resultArray:Array<ASCollectionModel> = []
        for collection in collections {
            resultArray.append(ASCollectionModel.init(assetCollection: collection))
        }
        
        return resultArray
    }

    
}
