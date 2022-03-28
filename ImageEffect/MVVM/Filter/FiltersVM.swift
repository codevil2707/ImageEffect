//
//  FiltersVM.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/26/22.
//

import Foundation
import UIKit

class FiltersVM{
    //MARK: - DM refrence
    
    
    //MARK: - Initializer
    init(){
       numberOfFilters()
      
    }
   
  
    func numberOfFilters()->Int{
        return 5
    }
    
    func getFilterNameAt(index:Int) -> String{
        return "Box Blurr"
    }
}
