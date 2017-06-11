//
//  ASPhotoCollectionViewController.swift
//  Pods
//
//  Created by zkhCreator on 06/06/2017.
//
//

import UIKit

public class ASPhotoCollectionViewController: UICollectionViewController {
    
    var photoesArray:[ASPhotoAssetModel] = []
    let currentCollection:ASCollectionModel
    public let selectedPhotoes:[ASPhotoAssetModel] = []
    
    // mar
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
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.register(UINib.init(nibName: "ASPhotoListCollectionViewCell", bundle: Bundle.getBundle()), forCellWithReuseIdentifier: NSStringFromClass(ASPhotoListCollectionViewCell.self))
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ASAlbumUtilsManager.fetchAllAssetsPhotoes(collection: currentCollection) { (models) in
            photoesArray = models
            self.collectionView?.reloadData()
        }
    }
    
    // MARK: - private method
    func formatCellInfo(cell:ASPhotoListCollectionViewCell, info:ASPhotoAssetModel) {
        ASAlbumUtilsManager.convert(model: info) { (image) in
            cell.contentImageView.image = image;
        }
        cell.selectButton.isSelected = checkImageSelected(info: info);
    }
    
    func checkImageSelected(info:ASPhotoAssetModel) -> Bool {
        return selectedPhotoes.contains(info)
    }

    // MARK: - collectionDelegate && collectionDataSource
    override public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoesArray.count
    }

    override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ASPhotoListCollectionViewCell.self), for: indexPath)
        
        if cell is ASPhotoListCollectionViewCell {
            formatCellInfo(cell: cell as! ASPhotoListCollectionViewCell, info: photoesArray[indexPath.row])
        }
        
        return cell
    }

    

}
