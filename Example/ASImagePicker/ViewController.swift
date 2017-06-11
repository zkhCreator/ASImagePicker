//
//  ViewController.swift
//  ASImagePicker
//
//  Created by zkh90644 on 06/04/2017.
//  Copyright (c) 2017 zkh90644. All rights reserved.
//

import UIKit
import ASImagePicker
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let openAlbumButton = UIButton.init()
        openAlbumButton.setTitle("open the Album", for: .normal)
        openAlbumButton.addTarget(self, action: #selector(openAlbumVC), for: .touchUpInside)
        self.view.addSubview(openAlbumButton)
        
        openAlbumButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(40)
        }
        
        let openCameraButton = UIButton.init()
        self.view.addSubview(openCameraButton)
        openCameraButton.setTitle("open the Camera", for: .normal)
        openCameraButton.addTarget(self, action: #selector(openCameraVC), for: .touchUpInside)
        openCameraButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(openAlbumButton.snp.bottom).offset(40)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        
        self.navigationController?.setNavigationBarHidden(false, animated: true);
    }
    
    func openAlbumVC() {
        self.navigationController?.pushViewController(ASAlbumUtilsManager.shared.albumListVC, animated: true)
    }
    
    func openCameraVC() {
        print("openCameraVC")
    }

}

