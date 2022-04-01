//
//  RootViewModel.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/22/22.
//

import Foundation
import UIKit
import Photos

class RootViewModel {
  
    //MARK: - VM refrence
    var rootModel = RootModel()
    
    
    //MARK: - Binders
    var saveImageBinding : ((String) -> Void)?
     
    
    //MARK: - Variables
    var editorVM:EditorVM? = nil
    
    
    //MARK: - Methods
    func saveImageAsset(image:UIImage,Handler: ((Bool,Error?)->Void)?){
        
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }, completionHandler: Handler)
       
        
    }
 
    
     func addHImage(){
         guard  let image2 = UIImage(named: "hImage") else {return}
         rootModel.image = image2
         saveImageBinding?("Image Added Successfully!")
     }
    
    func addVImage(){
        guard  let image = UIImage(named: "vImage") else {return}
        rootModel.image = image
        saveImageBinding?("Image Added Successfully!")
    }
    
    func printModel(){
        print(rootModel.image as Any)
    }
    
    func createEditorVM()->EditorVM?{
        guard let image = rootModel.image else {return nil}
        let dataModel = EditorDM(image: image, filterType: nil)
        editorVM = EditorVM(editorDM: dataModel)
        return editorVM
    }
    
  
    
}














//func saveToCameraRoll(image:UIImage) {
//
//    let imageSaver = ImageSaver()
//imageSaver.writeToPhotoAlbum(image: image)
//
//}




// Application Name folder
// MVVM
    // Root
        // RootVC
        // Root.xib
        // RootVM
        // RootDM
    // Second
        //
        //


//func doSomething(argument:Bool,completionHandler:(Bool)->()){
//
//    //do stuff you want to do
//    completionHandler(argument)
//
//}
//
//doSomething(argument: true) { result in
//    if result{
//        print("True")
//    }
//    else {
//        print("False")
//    }
//}

//                                                 if success {
//                                                     print(" Saved successfully!")
//                                                 }
//                                                 else if let error = error {
//                                                     // Save photo failed with error
//                                                 }
//                                                 else {
//                                                     // Save photo failed with no error
//                                                 }
//                                             }


//    func saveImage(){
//
//        guard let image = rootModel.image else {return}
//        saveImageAsset(image: image) { [self]suceess, error in
//            if suceess {
//             saveImageBinding?("Saved Succesfully!")
//            }
//            else if let error = error {
//               print("error",error)
//            }
//            else {
//               saveImageBinding?("Failed to save!")
//            }
//        }
//    }


//func showAlret(alertmsg:String)->UIAlertController{
//    let alert = UIAlertController(title: "Saved!", message: alertmsg, preferredStyle: .alert)
//    alert.addAction(UIAlertAction(title: "OK", style: .cancel))
//    return alert
//}
