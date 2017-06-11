//
//  ASAlbumListTableViewCell.swift
//  Pods
//
//  Created by zkhCreator on 11/06/2017.
//
//

import UIKit

class ASAlbumListTableViewCell: UITableViewCell {
    @IBOutlet public weak var thumbnail: UIImageView!
    @IBOutlet public weak var albumTitleLabel: UILabel!
    @IBOutlet public weak var albumCountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.thumbnail.layer.cornerRadius = 2
        self.thumbnail.layer.masksToBounds = true;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        albumTitleLabel.text = ""
        albumCountLabel.text = "0"
    
        thumbnail.image = UIImage.getImage(imageName: "album_placeHolderImage")
    }
}
