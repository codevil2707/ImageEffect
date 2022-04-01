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
    @IBOutlet weak var filterTabBar:UITabBar!
    @IBOutlet weak var label:UILabel!
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
        filterTabBar.delegate = self
        configureTabItem()
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
        editorVM?.bindLabel = { text in
            self.label.text = text
            
        }
    }
    
  
  
   
    override func viewWillAppear(_ animated: Bool) {
        imageLoader.startAnimating()
        self.imageView.frame.size = imageView.image?.size ?? self.imageView.frame.size
        print("sliderVC willappear ")
    }
    override func viewDidAppear(_ animated: Bool) {
        editorVM?.loadImageBind()
        print("sliderVC did appear ")
    }
    override func viewWillLayoutSubviews() {
        editorVM?.calculateSize(width: imageView.frame.width, height: imageView.frame.height)
        self.imageView.center = self.Topview.center
        self.imageLoader.center = self.imageView.center
        print("sliderVC willlayout ")
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

    override func willMove(toParent: UIViewController?) {
        print(#function, #line , #file)
    }
    override func didMove(toParent: UIViewController?) {
        print(#function)
    }
    
    //MARK: - Actions
    
    @IBAction func blurButtonClicked(sender:UIButton){
        guard let filtersVM = editorVM?.createFilterVM() else {return}
            let child = FiltersVC(filtersVM: filtersVM)
            self.add(child, height: self.view.frame.height*0.4)
        
    }
    
    func configureTabItem(){
        let item1 = UITabBarItem(title: "My Slider", image: UIImage(systemName: "trash"), tag: 1)
        let item2 = UITabBarItem(title: "My Collection", image: UIImage(systemName: "pencil"), tag: 2)
        let item3 = UITabBarItem(title: "My Table", image: UIImage(systemName: "folder"), tag: 3)
        let item4 = UITabBarItem(title: "My Time", image: UIImage(systemName: "doc"), tag: 4)

        self.filterTabBar.items = [item1,item2,item3,item4]

    }
   
    // func
}
extension EditorVC :  UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 2{
            guard let filtersVM = editorVM?.createFilterVM() else {return}
                let child = FiltersVC(filtersVM: filtersVM)
                self.add(child, height: 0.3)
        }
        else if item.tag == 1{
            guard let sliderVM = editorVM?.createSliderVM() else {return}
                let child = SliderVC(sliderVM:sliderVM)
                self.add(child, height: 0.3)
            sliderVM.configureMinMaxValueForSlider()
        }
        else if item.tag == 3{
            guard let tableVM = editorVM?.createMyTableVM() else {return}
                let child = TableVC(tableVM: tableVM)
                self.add(child, height: 0.3)
        }
        
        else if item.tag == 4{
            guard let timeStampVM = editorVM?.createTimeStampVM() else {return}
                let child = TimeStampVC(timeStampVM: timeStampVM)
                self.add(child, height: 0.3)
        }
    }
    
    
  
}
