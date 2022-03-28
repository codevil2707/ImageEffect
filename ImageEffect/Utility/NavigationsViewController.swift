//
//  ViewController.swift
//  ImageViewer
//
//  Created by SimplyEntertaining on 1/19/22.
//

import UIKit

class NavigationsViewController: UIViewController {
    var navBar:UINavigationBar? = nil
    var navBarY:CGFloat?  = nil
    var isLeftNavButtonEnable:Bool = true
    var isRighttNavButtonEnable:Bool = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
     configureItem()
    }
    
    override func viewDidLayoutSubviews(){
      //  configureItem()
        updateFrame()
    }
    
    //create a private function for define navigation bar
     func configureItem(){
        //let instance on navigation bar with property
         
         // self.navigationController?.navigationBar.items?.first?.leftBarButtonItem =
         
                  if navBarY == 0{
              navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 49))
                      view.addSubview(navBar!)
         }
         else {
             let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        navBar = UINavigationBar(frame: CGRect(x: 0, y: startingYPos, width: view.frame.size.width, height: 49))
             view.addSubview(navBar!)
         }
         
         //Add title
        let title = addTitle()
        let navItem = UINavigationItem(title: title)
         
         //Add left Button
         if isLeftNavButtonEnable{
            
             if let leftTitle = leftTitle(){
                 let leftItem = UIBarButtonItem(title: leftTitle, style: .plain, target: self, action: #selector(didClickedBackButton))
                 navItem.leftBarButtonItem = leftItem
             }
             else if let leftImage = leftImage(){
                let leftItem = UIBarButtonItem(image: leftImage, style: .plain, target: self, action: #selector(didClickedBackButton))
                 navItem.leftBarButtonItem = leftItem
             }
       
         
         }
         if isRighttNavButtonEnable{
            
             if let rightTitle = rightTitle(){
                 let rightItem = UIBarButtonItem(title: rightTitle, style: .plain, target: self, action: #selector(didClickednext))
                 navItem.rightBarButtonItem = rightItem
             }
             else if let rightImage = rightImage(){
                let rightItem = UIBarButtonItem(image: rightImage, style: .plain, target: self, action: #selector(didClickednext))
                 navItem.rightBarButtonItem = rightItem
             }
           
             
              
         
         }
          
         navItem.hidesBackButton = true
        navBar?.setItems([navItem], animated: false)
    }
    
    
    func updateFrame(){
        self.navBar?.frame.size = CGSize(width: self.view.frame.width, height: 49)
    }
    
    func addTitle()->String{
        let title = "Editor"
        return title
    }
    func leftTitle()->String?{
       return nil
    }
    
    func rightTitle()->String?{
       return nil
    }
    
    func leftImage()->UIImage?{
       return nil
    }
    
    func rightImage()->UIImage?{
       return nil
    }
    
    @objc func didClickedBackButton(){
       
        
    }
    @objc func didClickednext(){
       
    }
}
