//
//  EditorVM.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/24/22.
//

import Foundation
import UIKit

class EditorVM: SliderDelegate, FilterDelegate, TableDelegate, TimeStampDelegate{
    func timeStampDelegate(text: String) {
        bindLabel?(text)
    }
    
    func tableDelegate(text: String) {
        bindLabel?(text)
    }
    
    func filterDelegate(text: String) {
        bindLabel?(text)
    }
    
    
    func sliderValueChanged(_ text: String,value: Int) {
        bindLabel?(text)
        editorDM.currentValue = value
    }
    
    //MARK: - DM refrence
    let editorDM:EditorDM
    
    //MARK: - Variables
    var filtersVM:FiltersVM? = nil
    var sliderVM:SliderVM? = nil
    var tableVM:TableVM? = nil
    var timeStampVM:TimeStampVM? = nil
   
    //MARK: - Initializer
    init(editorDM:EditorDM){
        self.editorDM = editorDM
    }
    
    //MARK: - Binder
    var imageBinding : ((UIImage?) -> Void)?
    var filterImageBinder: ((UIImage?) -> Void)?
    var imageViewSizeBinder:((CGSize?) -> Void)?
    func loadImageBind(){
        imageBinding?(editorDM.image)
    }
    var bindLabel:((String)->Void)?
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
        filtersVM?.delegate = self
        return filtersVM
    }
    
    func createSliderVM()->SliderVM?{
     
       sliderVM = SliderVM(currentDM: editorDM, self)
       
        return sliderVM
    }
    func createMyTableVM()->TableVM?{
        tableVM = TableVM()
        tableVM?.delegate = self
        return tableVM
    }
    func createTimeStampVM()->TimeStampVM?{
        timeStampVM = TimeStampVM()
        timeStampVM?.delegate = self
        return timeStampVM
    }
}
