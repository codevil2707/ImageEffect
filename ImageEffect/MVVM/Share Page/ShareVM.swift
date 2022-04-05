//
//  ShareVM.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 4/4/22.
//

import Foundation
import UIKit

class ShareVM{
    
    var shareDS:ShareDS
    
    var bindImage : ((UIImage?) -> Void)?
    init(currentDS:ShareDS){
        self.shareDS = currentDS
    }
    func setImage(){
        bindImage?(shareDS.filteredImage)
    }
}
