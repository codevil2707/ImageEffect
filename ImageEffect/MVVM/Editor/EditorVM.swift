//
//  EditorVM.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/24/22.
//

import Foundation
import UIKit

class EditorVM{
    //MARK: - DM refrence
    let editorDM:EditorDM
    
    //MARK: - Variables
    var filtersVM:FiltersVM? = nil
    
    //MARK: - Initializer
    init(editorDM:EditorDM){
        self.editorDM = editorDM
    }
    
    //MARK: - Binder
    var imageBinding : ((UIImage?) -> Void)?
    var filterImageBinder: ((UIImage?) -> Void)?
    var imageViewSizeBinder:((CGSize?) -> Void)?
    var bindFilterImage:  ((UIImage?) -> Void)?
    func loadImageBind(){
        imageBinding?(editorDM.image)
    }
    
    //MARK: - Methods
    
    func addBlurFilter(){
        guard let image = editorDM.image?.filteredImage(type: .Blur, value: 100) else{return}
        filterImageBinder?(image)
    }
    
    func calculateSize(width:CGFloat,height:CGFloat){
      let size = calculateNewWeidthAndHeight(width, height, editorDM.image?.size.width ?? 300, editorDM.image?.size.height ?? 300)
        imageViewSizeBinder?(size)
    }
   
    func createFilterVM()->FiltersVM?{
       filtersVM = FiltersVM()
        return filtersVM
    }
    
    func addFilter(){
        let image = editorDM.image?.filteredImage(type: editorDM.filterType.filterType ?? nil, value: CGFloat(editorDM.filterType.filtervalue ?? 00))
        bindFilterImage?(image)
    }
}

