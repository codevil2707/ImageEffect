//
//  MyTableViewCell.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/29/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView:UIImageView!
    @IBOutlet weak var cellLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
