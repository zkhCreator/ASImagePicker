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
    
    static public let shared = ASImagePickerManager()
    public var configManager = ASImagePickerConfigManager.init()
    
    var selectedAssetsArray:[ASPhotoAssetModel] = [] // all photos include camera photo
    let maxCount:NSInteger     // max selected Image
    
    let albumViewController:UINavigationController
    let cameraManager:ASCameraUtilsManager
    
    init(maxCount:NSInteger = NSInteger.max) {
        
        self.maxCount = maxCount
        self.albumViewController = UINavigationController.init()
        self.cameraManager = ASCameraUtilsManager.init()
        super.init()
    }
    
    public func cleanAllSelectedImage() {
        selectedAssetsArray.removeAll()
    }
    
    // show listView for
    public func showListView() {
        let alertSheetVC = UIAlertController.init(title: "warning".localization(bundle: Bundle.getBundle()), message: "please_selectModel".localization(bundle: Bundle.getBundle()), preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction.init(title: "camera".currentLocalization(), style: .default) { (action) in
            
        }
    }
    
    func showCameraViewController() {
        
    }

}
