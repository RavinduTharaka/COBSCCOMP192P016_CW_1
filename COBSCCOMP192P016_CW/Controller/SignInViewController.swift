//
//  SignInViewController.swift
//  COBSCCOMP192P016_CW
//
//  Created by Ravindu Tharaka Ranathunga on 2021-04-26.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func onSignInPressed(_ sender: UIButton) {
        
        if validate(){
            AuthenticateUser(email: txtEmail.text!, password: txtPassword.text!)
        }
        else
        {
            print("Input errors found")
        }
    }
    
    func validate() -> Bool{
//        if txtEmail.text?.isEmpty == true{
//            let alert = UIAlertController(title: "Error", message: "Email and Password required", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//            return false
//        }
        guard let email = txtEmail.text else {
            let alert = UIAlertController(title: "Error", message: "Email is required", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        if txtPassword.text?.isEmpty == true{
            let alert = UIAlertController(title: "Error", message: "Password required", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        if(email.count < 5){
            let alert = UIAlertController(title: "Error", message: "Invalid Email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    @IBAction func clickedForgetPassword(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(identifier: "FogotPassword" )
               vc.modalPresentationStyle = .overFullScreen
               present(vc, animated: true)
    }
    
    @IBAction func clickedSignUp(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(identifier: "Signup" )
               vc.modalPresentationStyle = .overFullScreen
               present(vc, animated: true)
    }
    
    func AuthenticateUser(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
         
            if let err = error{
//                print (err.localizedDescription)
                let alert = UIAlertController(title: "Error", message: "Invalid Username or Password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let sessionmanager = SessionManager()
            sessionmanager.SaveUserLogin()
            self.performSegue(withIdentifier: "tabController", sender: nil)
        }
    }
    
    
}
