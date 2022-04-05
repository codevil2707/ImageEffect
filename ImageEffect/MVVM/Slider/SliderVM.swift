//
//  SliderVM.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/28/22.
//

import Foundation
protocol SliderDelegate:AnyObject{
    func sliderValueChanged(_ text:String,value:Int)
}

class SliderVM{
    
    var currentDM:EditorDM? = nil
    var sliderDS = SliderDS()
    weak var delegate:SliderDelegate?
    var bindSlider : ((Int?) -> Void)?
    var bindMin : ((Int?) -> Void)?
    var bindMax : ((Int?) -> Void)?
    init(currentDM:EditorDM?,_ delegate:SliderDelegate?=nil){
        self.currentDM = currentDM
        self.delegate = delegate
    }
    
    func configureMinMaxValueForSlider(){
        bindMin?(sliderDS.sliderMinValue)
        bindMax?(sliderDS.sliderMaxValue)
        bindSlider?(currentDM?.filterType.filtervalue)
    }
    func onSliderValueChanged(sliderValue:Float){
        bindSlider?(Int(sliderValue))
       
    }
    func onEndOfSlide(sliderValue:Float){
        bindSlider?(Int(sliderValue))
        self.delegate?.sliderValueChanged("slider: \(sliderValue)", value: Int(sliderValue))
    }
  
}
