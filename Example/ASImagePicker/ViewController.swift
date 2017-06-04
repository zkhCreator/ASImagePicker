//
//  ViewController.swift
//  ASImagePicker
//
//  Created by zkh90644 on 06/04/2017.
//  Copyright (c) 2017 zkh90644. All rights reserved.
//

import UIKit
import ASImagePicker

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let manager = ASImagePickerManager.init()
        manager.checkAlbumAuth {
            print("a");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

