//
//  ASPhotoCollectionViewController.swift
//  Pods
//
//  Created by zkhCreator on 06/06/2017.
//
//

import UIKit

public class ASPhotoCollectionViewController: UICollectionViewController {

    var photoArray:[ASPhotoAssetModel] = []
    let currentCollection:ASCollectionModel
    public private(set) var selectedPhotos:[ASPhotoAssetModel] = []
    
    // MARK: - init
    init(model:ASCollectionModel = ASCollectionModel.defaultCollection) {
        self.currentCollection = model
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize.init(width: ASPhotoCellItemWH, height: ASPhotoCellItemWH)
        flowLayout.minimumLineSpacing = ASPhotoCellSpace
        flowLayout.sectionInset = UIEdgeInsets.init(top: 10, left: 0, bottom: 0, right: 0)
        
        super.init(collectionViewLayout: flowLayout)
        
        self.title = model.name
        self.collectionView?.contentInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10);
        let rightButton = UIBarButtonItem.init(title: "cancel".localization(bundle: Bundle.getBundle()), style: .plain, target: self, action: #selector(cancelAllSelect))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.register(UINib.init(nibName: "ASPhotoListCollectionViewCell", bundle: Bundle.getBundle()), forCellWithReuseIdentifier: NSStringFromClass(ASPhotoListCollectionViewCell.self))
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ASAlbumUtilsManager.fetchAllAssetsphotos(collection: currentCollection) { (models) in
            photoArray = models
            self.collectionView?.reloadData()
        }
    }
    
    // MARK: - public method
    public func clearAllSelectedImage() {
        self.selectedPhotos.removeAll()
    }
    
    // MARK: - private method
    // put info to Cell
    func formatCellInfo(cell:ASPhotoListCollectionViewCell, info:ASPhotoAssetModel) {
        ASAlbumUtilsManager.convert(model: info) { (image) in
            cell.contentImageView.image = image;
        }
        cell.selectButton.isSelected = checkImageSelected(info: info);
        cell.selectButton.tag = photoArray.index(of: info) ?? -1
        cell.selectButton.addTarget(self, action: #selector(selectPhotoAsset(button:)), for: .touchUpInside)
    }
    
    func checkImageSelected(info:ASPhotoAssetModel) -> Bool {
        return selectedPhotos.contains(info)
    }
    
    func cancelAllSelect() {
        clearAllSelectedImage()
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // select Image method
    func selectPhotoAsset(button:UIButton) {
        if button.tag < 0 || button.tag >= photoArray.count {
            return ;
        }
        
        let asset = photoArray[button.tag]
        var flag = false
        for e in selectedPhotos.enumerated() {
            if e.element == asset {
                selectedPhotos.remove(at: e.offset)
                flag = true
                break;
            }
        }
        
        if !flag {
            selectedPhotos.append(asset)
        }
        
        button.isSelected = !button.isSelected
        
        print(selectedPhotos)
    }

    // MARK: - collectionDelegate && collectionDataSource
    override public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }

    override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ASPhotoListCollectionViewCell.self), for: indexPath)
        
        if cell is ASPhotoListCollectionViewCell {
            formatCellInfo(cell: cell as! ASPhotoListCollectionViewCell, info: photoArray[indexPath.row])
        }
        
        return cell
    }
    
    

}
