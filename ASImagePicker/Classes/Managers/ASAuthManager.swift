//
//  ASAuthManager.swift
//  Pods
//
//  Created by 章凯华 on 16/07/2017.
//
//

import UIKit
import Photos
import AVKit

public class ASAuthManager: NSObject {
    public var albumAuthStatus:PHAuthorizationStatus {
        get {
            return PHPhotoLibrary.authorizationStatus()
        }
    }
    
    public var cameraAuthStatus:AVAuthorizationStatus {
        get {
            return AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        }
    }
    
    // Album Auth
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
                } else {
                    self.alertCantAccessVC(contentMessage: "please_open_album_access")
                }
            })
            
            return ;
        }
        
        if status == .denied || status == .restricted {
            self.alertCantAccessVC(contentMessage: "please_open_album_access")
        }
    }
    
    // Camera Auth
    static public func checkCameraAuth(completion:@escaping ()->()) {
        let status = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        
        if status == .authorized {
            completion()
            return ;
        }
        
        if status == .notDetermined {
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: { (status) in
                if status {
                    completion()
                } else {
                    self.alertCantAccessVC(contentMessage: "please_open_camer_access")
                }
                
                return ;
            })
        }
        
        if status == .denied || status == .restricted {
            self.alertCantAccessVC(contentMessage: "please_open_camer_access")
            return ;
        }
        
    }
    
    // Alert ViewController
    static public func alertCantAccessVC(contentMessage:String) {
        let bundle = Bundle.getBundle()
        let alertVC = UIViewController.warningAlertViewController(title: "warning".localization(bundle: bundle), message: String.init(format: contentMessage.localization(bundle: bundle), ASAppManager.shared.AppName))
        UIViewController.topViewController().present(alertVC, animated: true, completion: nil);
    }
}
