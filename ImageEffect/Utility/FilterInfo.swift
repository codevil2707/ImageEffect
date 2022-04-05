//
//  FilterInfo.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/26/22.
//

import Foundation
import UIKit

struct FilterInfo{
    var filterType:ImageFilter?
    var filtervalue:Int?
    var filterMinVaalue:Int?
    var filterMaxValue:Int?
    init(filterType:ImageFilter,currentValue:Int,minValue:Int,maxValue:Int){
        self.filterType = filterType
        self.filtervalue = currentValue
        self.filterMinVaalue = minValue
        self.filterMaxValue = maxValue
    }
}
