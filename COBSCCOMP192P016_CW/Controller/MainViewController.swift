//
//  MainViewController.swift
//  COBSCCOMP192P016_CW
//
//  Created by Ravindu Tharaka Ranathunga on 2021-04-26.
//

import UIKit

class MainViewController: UIViewController {
        
    @IBOutlet weak var Preview: UIView!
    @IBOutlet weak var Menu: UIView!
    @IBOutlet weak var Catergory: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickOnSegmentController(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
                case 0:
                    Preview.isHidden = false
                    Catergory.isHidden = true
                    Menu.isHidden = true
                case 1:
                    Preview.isHidden = true
                    Catergory.isHidden = true
                    Menu.isHidden = false
                case 2:
                    Preview.isHidden = true
                    Catergory.isHidden = false
                    Menu.isHidden = true
                default:
                    Preview.isHidden = false
    }
    
    
    
}

}
