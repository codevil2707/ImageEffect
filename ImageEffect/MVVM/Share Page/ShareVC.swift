//
//  ShareVC.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 4/4/22.
//

import UIKit

class ShareVC: NavigationsViewController {
    @IBOutlet weak var shareImageView:UIImageView!

    weak var shareVM:ShareVM? = nil
    init(viewModel:ShareVM){
        self.shareVM = viewModel
        super.init(nibName: "ShareVC", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        print("view did load")
        super.viewDidLoad()
        
        shareVM?.bindImage = { [weak self] image in
          
            self?.shareImageView.image = image
            
        }
        shareVM?.setImage()
      
    }
   

    override func leftTitle() -> String? {
        return "Back"
    }
    override func addTitle() -> String {
        return "Share"
    }
    override func didClickedBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
   
    

}
