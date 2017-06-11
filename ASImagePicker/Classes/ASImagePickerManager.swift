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
    static let shared = ASImagePickerManager()
    
    let albumManager = ASAlbumUtilsManager()
    let cameraManager = ASCameraUtilsManager()

}
