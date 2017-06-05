//
//  ASImagePickerManager.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import UIKit
import Photos

public class ASImagePickerManager: NSObject {
    public let AppName:String;
//    public let albumListViewController:ASAlbumListViewController = {
//        let vc = AlbumListViewController.
//        return vc;
//    }()
    
    public init(appName:String) {
        self.AppName = appName
        super.init()
    }
    
    // MARK: - Authorization
    // check access to album
    public func checkAlbumAuth(completion:@escaping ()->()) {
        
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
            let alertVC = UIViewController.warningAlertViewController(title: "warning".localization(bundle: bundle), message: String.init(format: "please_open_album_access".localization(bundle: bundle), self.AppName))
            UIViewController.topViewController().present(alertVC, animated: true, completion: nil);
        }
    }
    
    // check access to camera
    public func checkCameraAuth(completion:@escaping()->()) {
        // check you device is available
        let deviceAvailable = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        if !deviceAvailable {
            let vc = UIViewController.warningAlertViewController(title: "warning".localization(bundle: Bundle.getBundle()), message: "device_cant_access".localization(bundle: Bundle.getBundle()))
            
            UIViewController.topViewController().present(vc, animated: true, completion: nil)
            return ;
        }
        
        // check camera is available 
        let status = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        
        if status == .authorized {
            completion()
            return ;
        }
        
        if status == .notDetermined {
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: { (isAccess) in
                if isAccess {
                    completion()
                }
            })
            return ;
        }
        
        if status == .denied || status == .restricted {
            let bundle = Bundle.getBundle()
            let alertVC = UIViewController.warningAlertViewController(title: "warning".localization(bundle: bundle), message: String.init(format: "please_open_camera_access".localization(bundle: bundle), self.AppName))
            UIViewController.topViewController().present(alertVC, animated: true, completion: nil);
            return ;
        }
    }
    
    // MARK: - Photo List
    private static func loadAllCollection() -> Array<PHAssetCollection> {
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
    
}
