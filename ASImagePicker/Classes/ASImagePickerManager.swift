//
//  ASImagePickerManager.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//
//

import UIKit
import Photos

@objc public protocol ASImagePickerAssetListDelegate {
    // pram: get the model
    // return: add or delete success
    @objc optional func clickListItem(model:ASPhotoAssetModel) -> Bool
}

@objc public protocol ASImagePickerPreviewDelegate {
    @objc optional func clickPreviewItem(model:ASPhotoAssetModel) -> Bool
}

public class ASImagePickerManager: NSObject, ASImagePickerAssetListDelegate, ASImagePickerPreviewDelegate {
    
    static public let shared = ASImagePickerManager()
    
    public private(set) var selectedAssets:[ASPhotoAssetModel]
    public private(set) var maxCount:NSInteger
    
    init(maxCount:NSInteger = NSInteger.max) {
        self.selectedAssets = []
        self.maxCount = maxCount
    }
    
    // MARK: - Private
    private func clickItem(model: ASPhotoAssetModel) -> Bool {
        guard selectedAssets.count < maxCount else {
            // user just cancel the selected Image
            let offset = model <<<< selectedAssets
            if offset == NSNotFound {
                return false
            } else {
                selectedAssets.remove(at: offset)
                return true
            }
        }
        
        let offset = model <<<< selectedAssets
        if offset == NSNotFound {
            selectedAssets.append(model)
        } else {
            selectedAssets.remove(at: offset)
        }
        
        return true;
    }
    
    
    // MARK: - Public
    public func removeAllSelected() {
        selectedAssets.removeAll()
    }
    
    // MARK: - delegate
    public func clickListItem(model: ASPhotoAssetModel) -> Bool {
        return clickItem(model: model)
    }
    
    public func clickPreviewItem(model: ASPhotoAssetModel) -> Bool {
        return clickItem(model: model)
    }
}


