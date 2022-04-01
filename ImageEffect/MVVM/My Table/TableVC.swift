//
//  TableVC.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/29/22.
//

import UIKit

class TableVC: NavigationsViewController{
   
    

    weak var tableVM:TableVM?
    @IBOutlet weak var myTableView:UITableView!
  
    init(tableVM:TableVM){
        self.tableVM = tableVM
        super.init(nibName: "TableVC", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        isRighttNavButtonEnable = true
        isLeftNavButtonEnable = false
        navBarY = 0
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        
        let nibCell = UINib(nibName: "MyTableViewCell", bundle: nil)
        myTableView.register(nibCell, forCellReuseIdentifier: "cell")
        
     
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
}
extension TableVC:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        tableVM?.getFilterNameAt(index: index)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableVM?.numberOfFilters() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        MyTableViewCell
     
        cell.cellImageView.image = UIImage(systemName: "trash")
        return cell
    }
}
