//
//  ViewController.swift
//  ImageEffect
//
//  Created by SimplyEntertaining on 3/22/22.
//

import UIKit

class RootVC: UIViewController {

    //MARK: - VM refrence
   var rootViewModel = RootViewModel()
    //MARK: - Outlets
    @IBOutlet weak var hImageButton:UIButton!
    @IBOutlet weak var vImageButton:UIButton!
    @IBOutlet weak var saveButton:UIButton!
    @IBOutlet weak var activityIndicator:UIActivityIndicatorView!
    
    @IBOutlet weak var demoLabel:UILabel!
    //MARK: - Variables
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
  
      
        
         activateBinding()
    
        let quote = "Haters gonna hate"

        let firstAttributes: [NSAttributedString.Key: Any] = [.backgroundColor: UIColor.green, NSAttributedString.Key.kern: 10]
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]

        let firstString = NSMutableAttributedString(string: "Haters ", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "gonna ", attributes: secondAttributes)
        let thirdString = NSAttributedString(string: "hate")

        firstString.append(secondString)
        firstString.append(thirdString)
        demoLabel.attributedText = firstString
        
    }
    //MARK: - Private Methods
    func activateBinding(){
        rootViewModel.saveImageBinding = {[ weak self] messag in
            DispatchQueue.main.async{
                self?.activityIndicator.stopAnimating()
                self?.alertViewController(messag)
                self?.saveButton.isHidden = false
            }
           
        }
    }
    //MARK: - AddViewController

    func alertViewController(_ alertmsg:String){
        let alert = UIAlertController(title: "Added!", message: alertmsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
   
     
    //MARK: - Action
    @IBAction func hImageDidClicked(sender:UIButton){
        activityIndicator.startAnimating()
        DispatchQueue.global().async {
            self.rootViewModel.addHImage()
        }
    }
    
    @IBAction func vImageDidClicked(sender:UIButton){
        activityIndicator.startAnimating()
        DispatchQueue.global().async {
            self.rootViewModel.addVImage()
        }
       
    }
    
    @IBAction func saveDidClicked(sender:UIButton){
        guard let viewModel = rootViewModel.createEditorVM() else {return}
        let editorVC = EditorVC(editorVM: viewModel)
        self.navigationController?.pushViewController(editorVC, animated: false)
    }
}

