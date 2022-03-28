//
//  FiltersCollectionViewCell.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/26/22.
//

import UIKit

class FiltersCollectionViewCell: UICollectionViewCell {

    var currentImage:UIImage?
    var currentFilter:[ImageFilter]?
    var currentIndexPath:IndexPath?
    @IBOutlet weak var filterNameLabel:UILabel!
    @IBOutlet weak var filterImageView:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      //  filterImageView.image = currentImage
//        filterNameLabel.text = ImageFilter.allValues[currentIndexPath!.row].rawValue
    }

    
    
    
}
