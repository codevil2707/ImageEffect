//
//  EditorDM.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/24/22.
//

import Foundation
import UIKit

class EditorDM{
    var image:UIImage?
    var filterType:FilterInfo
    
    init(image:UIImage,filterType:FilterInfo?){
        self.image = image
        self.filterType = FilterInfo(filterType: .Blur, currentValue: 80, minValue: 0, maxValue: 100)
    }
}
