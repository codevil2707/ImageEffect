//
//  Enums.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/22/22.
//

import Foundation

enum ImageFilter:String{
    case Blur = "Blur"
    case MotionBlur = "Motion Blur"
    case Thresold = "Thresold"
    case SepiaTone = "SepiaTone"
    case ZoomBlur = "Zoom Blur"
    case ColorClamp = "Color Clamp"
    case ExposureAdjust = "Exposure Adjust"
    case GammaAjust = "Gamma Adjust"
    case EffectTonal = "Effect Tonal"
    case effectProcess = "Effect Process"
    case SharpenLuminance = "Sharpen LumineCe"
    static let allValues = [Blur,MotionBlur,Thresold,SepiaTone,ZoomBlur,ColorClamp,ExposureAdjust,GammaAjust,EffectTonal,EffectTonal,effectProcess,SharpenLuminance]
    
}
