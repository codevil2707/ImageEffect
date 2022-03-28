//
//  FiltersVC.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/25/22.
//

import UIKit

class FiltersVC: NavigationsViewController {
   
    weak var filtersVM:FiltersVM?
    
    @IBOutlet weak var filterCV:UICollectionView!
    
    init(filtersVM:FiltersVM){
        self.filtersVM = filtersVM
        super.init(nibName: "FiltersVC", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        configureCV()
        isRighttNavButtonEnable = true
        navBarY = 0
        super.viewDidLoad()
    }
    
    func configureCV(){
           filterCV.delegate = self
             filterCV.dataSource = self
            let customCellWidth = (self.view.frame.size.width*0.9)/3
            let cellSize = CGSize(width: customCellWidth, height: customCellWidth)
            let spacingOfCell = customCellWidth*0.09
        
            let layout  = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            layout.sectionInset = UIEdgeInsets(top: spacingOfCell, left: spacingOfCell, bottom: spacingOfCell, right: spacingOfCell)
            layout.itemSize = cellSize
            filterCV.setCollectionViewLayout(layout, animated: true)
        
        let nibCell = UINib(nibName: "FiltersCollectionViewCell", bundle: nil)
        filterCV.register(nibCell, forCellWithReuseIdentifier: "cell")
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
    
    override func didClickedBackButton() {
        self.remove()
    }
    
}
extension FiltersVC :  UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count =  filtersVM?.numberOfFilters()
        return count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FiltersCollectionViewCell
        cell.filterNameLabel.text = filtersVM?.getFilterNameAt(index:indexPath.item)
//        cell.currentImage = filtersVM?.addImage()
//        cell.currentFilter = filtersVM?.imageFilters()
//        cell.currentIndexPath = indexPath
        return cell
    }
    
}


