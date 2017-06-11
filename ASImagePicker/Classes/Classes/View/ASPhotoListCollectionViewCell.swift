//
//  ASPhotoListCollectionViewCell.swift
//  Pods
//
//  Created by zkhCreator on 11/06/2017.
//
//

import UIKit

class ASPhotoListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet public weak var contentImageView: UIImageView!
    @IBOutlet public weak var selectButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func prepareForReuse() {
        contentImageView.image = nil
        selectButton.isSelected = false
    }
}
