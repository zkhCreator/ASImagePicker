//
//  ASCameraUtilsManager.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import UIKit
import AVFoundation

class ASCameraUtilsManager: NSObject {
    static let shared = ASCameraUtilsManager()
//    var takePhotoCompletion = ()->()?
    
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
            let alertVC = UIViewController.warningAlertViewController(title: "warning".localization(bundle: bundle), message: String.init(format: "please_open_camera_access".localization(bundle: bundle), ASAppManager.shared.AppName))
            UIViewController.topViewController().present(alertVC, animated: true, completion: nil);
            return ;
        }
    }
    
    
    
    
}
