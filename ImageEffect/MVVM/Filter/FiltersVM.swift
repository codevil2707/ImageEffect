//
//  FiltersVM.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/26/22.
//

import Foundation
import UIKit

protocol FilterDelegate{
    func filterDelegate(text:String)
}
class FiltersVM{
    //MARK: - DM refrence
    var delegate:FilterDelegate?
    
    //MARK: - Initializer
    init(){
      
      
    }
   
  
    func numberOfFilters()->Int{
        return 5
    }
    
    func getFilterNameAt(index:Int) -> String{
        return "Box Blurr"
    }
    func getIndex(index:Int){
        self.delegate?.filterDelegate(text: ("Index Of collection view cell: \(index)"))
    }
}
