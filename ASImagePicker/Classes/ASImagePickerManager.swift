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
    
    public init(appName:String) {
        self.AppName = appName
        super.init()
    }
    
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
            self.alertWarningView()
        }
    }
    
    // check access to camera
    public func checkCameraAuth() {
        
    }
    
    private func alertWarningView() {
        let bundle = Bundle.getBundle()
        
        let alertVC = UIAlertController.init(title: "warning".localization(bundle: bundle!), message:String.init(format: "please_open_camera_access".localization(bundle: bundle!), self.AppName), preferredStyle: .alert);
        
        let okAction = UIAlertAction.init(title: "ok".localization(bundle: bundle!), style: .default, handler: nil);
        alertVC.addAction(okAction);
        print(UIViewController.topViewController())
        UIViewController.topViewController().present(alertVC, animated: true, completion: nil);
    }
}
