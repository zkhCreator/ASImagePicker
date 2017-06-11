//
//  extensionSpec.swift
//  ASImagePicker
//
//  Created by zkhCreator on 11/06/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble

import ASImagePicker

class extensionSpec: QuickSpec {
    override func spec() {
        describe("bundle method") {
            context("bundle", {
                it("current bundle", closure: {
                    let bundlePath = Bundle.getBundle()?.bundlePath
                    let correctPath = Bundle.init(for: ASImagePickerManager.self).path(forResource: "ASImagePicker", ofType: "bundle")

                    expect(bundlePath ?? "").to(equal(correctPath))
                })
            })
        }
        
        describe("string Method") {
            context("localization", {
                it("test i18n", closure: {
                    expect("test".localization(bundle: Bundle.getBundle())).to(satisfyAnyOf(equal("test"),equal("测试"),equal("測試")))
                })
            })
        }
        
        describe("UIImage") {
            it("get bundle Image", closure: {
                let image = UIImage.getImage(imageName: "album_placeHolderImage")
                expect(image).to(beAKindOf(UIImage.self));
            })
        }
        
        describe("UIViewController") {
            it("get a alertVC", closure: {
                let alertVC = UIViewController.warningAlertViewController(title: "aaa", message: "bbb");
                expect(alertVC).to(beAKindOf(UIAlertController.self))
                expect(alertVC.title).to(equal("aaa"));
            })
        }
    }
    
}
