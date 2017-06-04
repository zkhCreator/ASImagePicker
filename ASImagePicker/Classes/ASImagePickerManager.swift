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
//    case notDetermined // User has not yet made a choice with regards to this application
//    
//    case restricted // This application is not authorized to access photo data.
//    
//    // The user cannot change this application’s status, possibly due to active restrictions
//    //   such as parental controls being in place.
//    case denied // User has explicitly denied this application access to photos data.
//    
//    case authorized // User has authorized this application to access photos data.
    
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
                } else {
                    
                }
            })
            
            return ;
        }
        
        if status == .denied || status == .restricted {
            
        }
    }
    
    // check access to camera
    public func checkCameraAuth() {
        
    }
    
    private func alertWarningView() {
        
    }
}
