//
//  TimeStampVM.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/30/22.
//

import Foundation

protocol TimeStampDelegate{
    func timeStampDelegate(text:String)
}
class TimeStampVM{
    
    var delegate:TimeStampDelegate?
    var arrayOfYear:[Int] = []
    var arrayOfMonth:[Int] = []
    var arrayOfDay:[Int] = []
    func printCurrentDate(){
       
        
        
        // get the current date and time
        let currentDateTime = Date()
     
        // get the user's calendar
        let userCalendar = Calendar.current

        // choose which date and time components are needed
        let requestedComponents: Set<Calendar.Component> = [
            .year,
            .month,
            .day,
            .hour,
            .minute,
            .second
        ]

        // get the components
        let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime)

        // now the components are available
        
        guard let year = dateTimeComponents.year else {return}
        guard let month = dateTimeComponents.month else {return}
        guard let day = dateTimeComponents.day else {return}
        
        
        guard let hour = dateTimeComponents.hour else {return}
        guard let min = dateTimeComponents.minute else {return}
        guard let sec = dateTimeComponents.second else {return}
        print("\(year)-\(month)-\(day)");
        print("\(hour):\(min):\(sec)")
        
    }
    
    func getDate(_ row:Int,_ component:Int){
        self.delegate?.timeStampDelegate(text: "row: \(row), component: \(component)")
    }
    func getTime(time:String){
        self.delegate?.timeStampDelegate(text: time)
    }
    
}

extension Date {
    func string(format: String) -> String {
        
           let formatter = DateFormatter()
           formatter.timeZone = TimeZone.current
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
