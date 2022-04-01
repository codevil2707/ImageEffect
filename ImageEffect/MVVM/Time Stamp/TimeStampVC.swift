//
//  TimeStampVC.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/30/22.
//

import UIKit

class TimeStampVC: NavigationsViewController{
    
    

    weak var timeStampVM:TimeStampVM? = nil
    
    @IBOutlet weak var datePickerView:UIPickerView!
    @IBOutlet weak var timePickerView:UIDatePicker!
    init(timeStampVM:TimeStampVM){
        self.timeStampVM = timeStampVM
        super.init(nibName: "TimeStampVC", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        isRighttNavButtonEnable = true
        isLeftNavButtonEnable = false
        navBarY = 0
        super.viewDidLoad()
        datePickerView.dataSource = self
        datePickerView.delegate = self
     
       addValueInArray()
    }

    override func leftTitle() -> String? {
        return "cancel"
    }
    override func addTitle() -> String {
        return "Filters"
    }
    override func rightTitle() -> String? {
        return "Done"
    }
    
    override func didClickednext() {
        self.remove()
    }

    @IBAction func tampStampDidClicked(sender:UIButton){
        timeStampVM?.printCurrentDate() //as Any
        let date = Date()
        print(date.string(format: "yyyy-MM-dd hh:mm"))
        print(date.string(format: "MM-dd hh:mm"))
        print(date.string(format: "MM:ss"))
    }
    @IBAction func datePickerDidRolled(sender:UIDatePicker){
        print(sender.date)
        timeStampVM?.getTime(time: "\(sender.date)")
    }
}

extension TimeStampVC : UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            guard let count = timeStampVM?.arrayOfYear.count else {return 0}
            return count
        }
        else if component == 1{
            return 12
        }
        else {
            return 31
        }
    }
    
    func addValueInArray(){
    for i in 0...29{
        var year = 1992
        year += i
        timeStampVM?.arrayOfYear.append(year)
        
    }
        for i in 0...11{
            var month = 01
            month += i
            timeStampVM?.arrayOfMonth.append(month)
        }
        for i in 0...30{
            var day = 01
            day += i
            timeStampVM?.arrayOfDay.append(day)
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            guard let value = timeStampVM?.arrayOfYear[row] else {return nil}
            return "\(value)"
            }
        else if component == 1{
            guard let value = timeStampVM?.arrayOfMonth[row] else {return nil}
            return "\(value)"
        }
        else {
            guard let value = timeStampVM?.arrayOfDay[row] else {return nil}
            return "\(value)"
            }
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return pickerView.frame.size.width*0.4
        }
        else {return pickerView.frame.size.width*0.3}
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerView.frame.height*0.2
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        timeStampVM?.getDate(row, component)
    }
    
}
