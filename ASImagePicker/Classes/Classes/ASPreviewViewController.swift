//
//  ASPreviewViewController.swift
//  Pods
//
//  Created by zkhCreator on 12/06/2017.
//
//

import UIKit

public class ASPreviewViewController: UIViewController {
    
    let photoArray:[ASPhotoAssetModel]
    let selectedPhotos:[ASPhotoAssetModel]
    
    let maxSelectedCount:NSInteger
    
    init?(photoArray:[ASPhotoAssetModel], selectedPhotos:[ASPhotoAssetModel], maxCount:NSInteger) {
        if photoArray.count < 1 {
            return nil;
        }
        
        if maxCount < 1 {
            return nil;
        }
        
        self.photoArray = photoArray
        self.selectedPhotos = selectedPhotos
        self.maxSelectedCount = maxCount
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    

}
