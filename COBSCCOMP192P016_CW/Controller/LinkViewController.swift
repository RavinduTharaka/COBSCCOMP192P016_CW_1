//
//  LinkViewController.swift
//  COBSCCOMP192P016_CW
//
//  Created by Ravindu Tharaka Ranathunga on 2021-04-30.
//

import UIKit

class LinkViewController: UIViewController {
    
    let objSession = SessionManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
           
            if objSession.getLoggedState() {
                
                self.performSegue(withIdentifier: "LinkToHome", sender: nil)
            }
            else{
                
                self.performSegue(withIdentifier: "LinkToSign", sender: nil)
                
            }
        }
    

   

}
