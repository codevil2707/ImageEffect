//
//  Extensions.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/22/22.
//

import Foundation
import UIKit
import CoreImage.CIFilterBuiltins

extension UIImage{
    
    ///read type of filter and returns filtered image with given value
    func filteredImage(type: ImageFilter? , value:CGFloat?) -> UIImage?{
        var filterImage : UIImage?
         switch(type){
         case .Blur :   filterImage = boxBlurEffect(value ?? 80)
                     
         case .SepiaTone : let filterImage = sepiaToneEffect(value ?? 60)
                        
        case .SharpenLuminance : let filterImage = sharpenLuminance()
                                  return filterImage
        case .effectProcess : let filterImage = effectProcess()
                             return filterImage
        case .EffectTonal : let filterImage = effectTonal()
                            return filterImage
        case .GammaAjust  : let filterImage = gammaEffect()
                           return filterImage
        case .ExposureAdjust : let filterImage = exposureEffect()
                             return filterImage
        case .ColorClamp : let filterImage = colorClampEffect()
                          return filterImage
        case .ZoomBlur  : let filterImage = zoomBlurEffect(value ?? 40)
                         return filterImage
        case .MotionBlur : let filterImage = motionBlurEffect(value ?? 20)
                           return filterImage
        case .Thresold  : let filterImage = thresoldEffect(value ?? 30)
                      return filterImage
         case .none:
             return nil
         }
      return filterImage
     
    }
 
    func boxBlurEffect(_ value:CGFloat)->UIImage?{
       
         
             let inputImage = self
              let ciImage = CIImage(image: inputImage)

              let context = CIContext()
           
          
          
       
           let filters = CIFilter.boxBlur()
                         filters.inputImage = ciImage
        filters.radius = Float(value)
              
        guard  let outputImage = filters.outputImage else { return nil }

      
        guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
       let filteredImage = UIImage(cgImage: cgImg)
              return filteredImage
    }
        func motionBlurEffect(_ value:CGFloat)->UIImage?{
           
             
                 let inputImage = self
                  let ciImage = CIImage(image: inputImage)

                  let context = CIContext()
               
              
              
           
            let filters = CIFilter.motionBlur()
                              filters.inputImage = ciImage
            filters.radius = Float(value)
                  
            guard  let outputImage = filters.outputImage else { return nil }

          
guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
  let filteredImage = UIImage(cgImage: cgImg)
      return filteredImage
        }
            
            func sepiaToneEffect(_ value:CGFloat)->UIImage?{
                
                
                let inputImage = self
                 let ciImage = CIImage(image: inputImage)

                 let context = CIContext()
              
             
             
          
                let filters = CIFilter.sepiaTone()
                                   filters.inputImage = ciImage
                filters.intensity = Float(value)
                 
                guard  let outputImage = filters.outputImage else { return nil }
  
              
         guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
      let filteredImage = UIImage(cgImage: cgImg)
          return filteredImage
            }
                func thresoldEffect(_ value:CGFloat)->UIImage?{
               
               
               let inputImage = self
                let ciImage = CIImage(image: inputImage)

                let context = CIContext()
             
            
            
         
                    let filters = CIFilter.colorThreshold()
                                     filters.inputImage = ciImage
                    filters.threshold = Float(value)
                
                    guard  let outputImage = filters.outputImage else { return nil }
      
                  
      guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
          let filteredImage = UIImage(cgImage: cgImg)
              return filteredImage
                }
        
         func zoomBlurEffect(_ value:CGFloat)->UIImage?{
              
              
              let inputImage = self
               let ciImage = CIImage(image: inputImage)

               let context = CIContext()
            
           
           
        
             let filters = CIFilter.zoomBlur()
                            filters.inputImage = ciImage
             filters.amount = Float(value)
             guard  let outputImage = filters.outputImage else { return nil }

           
guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
   let filteredImage = UIImage(cgImage: cgImg)
       return filteredImage
         }
        
        func colorClampEffect()->UIImage?{
                  
                  
                  let inputImage = self
                   let ciImage = CIImage(image: inputImage)
                   let context = CIContext()
                
               
               
            
            let filters = CIFilter.colorClamp();                                                              filters.inputImage = ciImage
            guard  let outputImage = filters.outputImage else { return nil }

          
   guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
    let filteredImage = UIImage(cgImage: cgImg)
      return filteredImage
             }
        
        
       
            func exposureEffect()->UIImage?{
                 
                 
                 let inputImage = self
                  let ciImage = CIImage(image: inputImage)

                  let context = CIContext()
               
              
              
           
                let filters = CIFilter.exposureAdjust()
                filters.inputImage = ciImage

                guard  let outputImage = filters.outputImage else { return nil }
  
              
  guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
      let filteredImage = UIImage(cgImage: cgImg)
          return filteredImage
            }
        
                
          func gammaEffect()->UIImage?{
                          
                          
                          let inputImage = self
                           let ciImage = CIImage(image: inputImage)

                           let context = CIContext()
                        
                       
                       
                    
                            let filters = CIFilter.gammaAdjust()
                              filters.inputImage = ciImage
              guard  let outputImage = filters.outputImage else { return nil }

            
guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
    let filteredImage = UIImage(cgImage: cgImg)
        return filteredImage
              
              
          }
         
        func effectTonal()->UIImage?{
                              
                              
                              let inputImage = self
                               let ciImage = CIImage(image: inputImage)

                               let context = CIContext()
                            
                           
                           
                        
                                let filters = CIFilter.photoEffectTonal()
                                  filters.inputImage = ciImage
            guard  let outputImage = filters.outputImage else { return nil }

          
guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
  let filteredImage = UIImage(cgImage: cgImg)
      return filteredImage
            
            
        }
        
       func effectProcess()->UIImage?{
                                  
                                  
                                  let inputImage = self
                                   let ciImage = CIImage(image: inputImage)

                                   let context = CIContext()
                                
                               
                               
                            
                                  let filters = CIFilter.photoEffectProcess()
                                      filters.inputImage = ciImage
                             guard  let outputImage = filters.outputImage else { return nil }

         
            guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
                     let filteredImage = UIImage(cgImage: cgImg)
                      return filteredImage
                             
       }
              
        func sharpenLuminance()->UIImage? {
                                  //  convert self to CIImage
                                       let inputImage = self
                                       let ciImage = CIImage(image: inputImage)
                                       let context = CIContext()
                                    
                                   
                                   
                          //apply filters
                          let filters = CIFilter.sharpenLuminance()
                                          filters.inputImage = ciImage
                          guard  let outputImage = filters.outputImage else { return nil }
            
                        
            guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
                let filteredImage = UIImage(cgImage: cgImg)
                    return filteredImage
            
                        
           
                      }
        
    
}

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
    
}



extension UIImage{
    func resizeImage(targetSize:CGSize)->UIImage?{

          var newSize: CGSize
        
        let widthRatio  = targetSize.width  / size.width
         let heightRatio = targetSize.height / size.height
         
         // Figure out what our orientation is, and use that to form the rectangle
       
         if(widthRatio > heightRatio) {
             newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
         } else {
             newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
         }
       
        // This is the rect that we've calculated out and this is what is actually used below
            let rect = CGRect(x:0, y:0, width: newSize.width, height: newSize.height)
            
            // Actually do the resizing to the rect using the ImageContext stuff
            UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
            self.draw(in: rect)
           // image.draw()
            if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return newImage
           }
            return nil
    
}
}
@nonobjc extension UIViewController {
    func add(_ child: UIViewController,height:CGFloat) {
        
        self.addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        
        
       
        view.addConstraints([
                      NSLayoutConstraint(item: child.view!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
                      NSLayoutConstraint(item: child.view!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0),
                      NSLayoutConstraint(item: child.view!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
                      NSLayoutConstraint(item: child.view!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
                      NSLayoutConstraint(item: child.view as Any, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.3, constant: 0),
                      
                      
                      
                      
//                      NSLayoutConstraint(item: child.view as Any, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.8, constant: 0),
//                      NSLayoutConstraint(item: child.view as Any, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
//                      NSLayoutConstraint(item: child.view as Any, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
                  ])
       
       
    }

    func remove() {
    
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}


//
//
//var pointerToTextObjectSelected = UITextView()
//// above populated elsewhere
//
//let thisObject = pointerToTextObjectSelected.asImage()
//
//let imageData = thisObject.pngData()
//
//let imageToSave = UIImage(data: imageData!)
//
//UIImageWriteToSavedPhotosAlbum(imageToSave!, nil, nil, nil)
//
//// You will need this extension :
//
//extension UIView {
//
//// Using a function since `var image` might conflict with an existing variable
//// (like on `UIImageView`)
//func asImage() -> UIImage {
//if #available(iOS 10.0, *) {
//  let renderer = UIGraphicsImageRenderer(bounds: bounds)
//  return renderer.image { rendererContext in
//    layer.render(in: rendererContext.cgContext)
//  }
//} else {
//  UIGraphicsBeginImageContext(self.frame.size)
//  self.layer.render(in:UIGraphicsGetCurrentContext()!)
//  let image = UIGraphicsGetImageFromCurrentImageContext()
//  UIGraphicsEndImageContext()
//  return UIImage(cgImage: image!.cgImage!)
//}
//}
//}


func calculateNewWeidthAndHeight(_ avilableFrameWidth:CGFloat,_ avilableFrameHeight:CGFloat,_ avilableImageWidth:CGFloat,_ avilableImageHeight:CGFloat)->CGSize{
 //required height and breath of image
    var finalImageWidth:CGFloat = 0
    var finalImageHeight:CGFloat = 0
    //take width constant as avilable frame width
    let newImageWidth1 = avilableFrameWidth
    let newImageHeight1 = (avilableImageHeight/avilableImageWidth)*newImageWidth1

    //case2 take height will constant as frame height
    let newImageHeight2 = avilableFrameHeight
    let newImageWidth2 = (avilableImageWidth/avilableImageHeight)*newImageHeight2

    if (newImageWidth1<=avilableFrameWidth && newImageHeight1<=avilableFrameHeight){
        finalImageWidth = newImageWidth1
        finalImageHeight = newImageHeight1

    }
    else if(newImageWidth2<=avilableFrameWidth && newImageHeight2<=avilableFrameHeight){
         finalImageWidth = newImageWidth2
        finalImageHeight = newImageHeight2

    }

    return CGSize(width: finalImageWidth, height: finalImageHeight)
}

