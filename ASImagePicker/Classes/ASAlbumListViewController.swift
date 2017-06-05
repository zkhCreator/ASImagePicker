//
//  ASAlbumLIstViewController.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import UIKit
import Photos

public class ASAlbumListViewController: UIViewController {

    var albumArray:Array<ASCollectionModel> = []
    
    init(collectionArray:Array<PHAssetCollection>) {
        for collection in collectionArray {
            albumArray.append(ASCollectionModel.init(assetColletion: collection))
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
