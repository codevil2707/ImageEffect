//
//  SliderVC.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/28/22.
//

import UIKit

class SliderVC: NavigationsViewController{

    weak var sliderVM:SliderVM? = nil
 
    @IBOutlet weak var intensityValueLabel:UILabel!
    @IBOutlet weak var intensitySlider:UISlider!
    init(sliderVM:SliderVM){
        self.sliderVM = sliderVM
        super.init(nibName: "SliderVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        isRighttNavButtonEnable = true
        isLeftNavButtonEnable = false
        navBarY = 0
        super.viewDidLoad()
        
        sliderVM?.bindMin = {[weak self] min1 in
            if let value = min1{
                self?.intensitySlider.minimumValue = Float(value)
            }
        }
        sliderVM?.bindMax = { [weak self] max1 in
            if let value = max1{
                self?.intensitySlider.maximumValue = Float(value)
            }
        }
        sliderVM?.bindSlider = { [weak self] sliderVal in
            if let value = sliderVal{
            self?.intensityValueLabel.text = " - \(value) "
                self?.intensitySlider.value = Float(value)
            }
        }
       
        
        intensitySlider.addTarget(self, action: #selector(sliderValueChanged(slider:event:)), for: .valueChanged)
    }
    
    
    
        override func viewDidLayoutSubviews() {
        print("HEE HEE HAA HAA")
            super.viewDidLayoutSubviews()
        }
    
     override func leftTitle() -> String? {
         return "cancel"
     }
     override func addTitle() -> String {
         return " "
     }
     override func rightTitle() -> String? {
         return "Done"
     }
     
     override func didClickednext() {
         self.remove()
        
     }
    
    @IBAction func sliderChanged(sender:UISlider){
        self.sliderVM?.onSliderValueChanged(sliderValue: sender.value)
    }
    
    @objc func sliderValueChanged(slider: UISlider, event: UIEvent){
        if let touchEvent = event.allTouches?.first {
               switch touchEvent.phase {
               case .began:
                                print("began")
               case .moved:
                   self.sliderVM?.onSliderValueChanged(sliderValue: slider.value)
               case .ended:
                       self.sliderVM?.onEndOfSlide(sliderValue: slider.value)
                  
               default:
                   break
               }
           }
    }


       
}
  
//
//class parentVm {
//
//    var currentValue : CGFloat = 60
//    var sliderVM : SliderVM2!
//    func getVM()->SliderVM2{
//         sliderVM = SliderVM2(vale: currentValue)
//        return sliderVM
//    }
//}

//class parentVC : UIView{
//    var vm = parentVm()
//    func pushSLider(){
//        let sliderVM = vm.getVM()
//        let v = sliderView(vm: sliderVM)
//        self.addSubview(v)
//        sliderVM.updateSlider()
//    }
//}
//
//class SliderVM2 {
//
//    var bindSlider : ((CGFloat)->Void)?
//    var currtV : CGFloat = 0
//    init(vale:CGFloat) {
//        currtV = vale
//        bindSlider?(vale)
//
//    }
//    func updateSlider()->CGFloat {
//        bindSlider?(vale)
//
//    }
//}
//
//class sliderView : UIView {
//    weak var vm : SliderVM2!
//    init(vm:SliderVM2) {
//        self.vm = vm
//
//        vm.bindSlider = { val in
//
//        }
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}



