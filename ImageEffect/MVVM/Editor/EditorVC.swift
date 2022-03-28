//
//  EditorVC.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/24/22.
//

import UIKit

class EditorVC: NavigationsViewController {
    
    //MARK: - Variables
    weak var editorVM:EditorVM?
    
    //MARK: - Outlets
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var imageLoader:UIActivityIndicatorView!
    @IBOutlet weak var blurButton:UIButton!
    @IBOutlet weak var Topview:UIView!
    //MARK: - Initializer
    init(editorVM:EditorVM){
        self.editorVM = editorVM
        super.init(nibName: "EditorVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
         
        configureimageView()
        editorVM?.imageBinding = { [weak self] image in
            self?.imageLoader.stopAnimating()
            self?.imageView.image = image
            
        }
      
        editorVM?.filterImageBinder = {[weak self] image in
            DispatchQueue.main.async {
                self?.imageLoader.stopAnimating()
                self?.imageView.image = image
            }
        }
        
        editorVM?.imageViewSizeBinder = {[weak self] size in
            self?.imageView.frame.size = size ?? CGSize(width: 300, height: 300)
        }
      
    }
    override func viewWillAppear(_ animated: Bool) {
        imageLoader.startAnimating()
        self.imageView.frame.size = imageView.image?.size ?? self.imageView.frame.size
    }
    override func viewDidAppear(_ animated: Bool) {
        editorVM?.loadImageBind()
        
    }
    override func viewWillLayoutSubviews() {
        editorVM?.calculateSize(width: imageView.frame.width, height: imageView.frame.height)
        self.imageView.center = self.Topview.center
        self.imageLoader.center = self.imageView.center
    }
    
    //MARK: - Override Navigation
    override func leftTitle() -> String? {
        return "Back"
    }
    override func addTitle() -> String {
        return "Editor"
    }
   
    //MARK: - Methods
    func configureimageView(){
        imageView.frame = CGRect(x: 0, y: 0, width: self.Topview.frame.width*0.8, height: self.Topview.frame.height*0.8)
       
    }

  
    //MARK: - Actions
    
    @IBAction func blurButtonClicked(sender:UIButton){
        guard let filtersVM = editorVM?.createFilterVM() else {return}
            let child = FiltersVC(filtersVM: filtersVM)
            self.add(child, height: self.view.frame.height*0.4)
        
    }
}
