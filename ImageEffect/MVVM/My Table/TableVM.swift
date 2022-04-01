//
//  TableVM.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/29/22.
//

import Foundation

protocol TableDelegate{
    func tableDelegate(text:String)
}
class TableVM{
    var delegate:TableDelegate?
    func numberOfFilters()->Int{
        return 5
    }
    
    func getFilterNameAt(index:Int) -> String{
        self.delegate?.tableDelegate(text: "index path of Tableview \(index)")
        return "Box Blurr"
    }
}
