//
//  SignUpViewController.swift
//  COBSCCOMP192P016_CW
//
//  Created by Ravindu Tharaka Ranathunga on 2021-04-26.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConPass: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    @IBAction func ClickedSignin(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func registerUser(user: User){
        Auth.auth().createUser(withEmail: user.userEmail, password: user.userPassword) { authResult, error in
            if let err = error{
                print(err.localizedDescription)
                let alert = UIAlertController(title: "Error", message: "User sign up failed!", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                return
            }
            self.saveUserData(user: user)
        }
    }

    
    @IBAction func ClickedSignup(_ sender: UIButton) {
        if !InputValidator.isValidateName(name: txtName.text ?? ""){
            let alert = UIAlertController(title: "Error", message: "Invalid Name", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
            return
        }
        
        if !InputValidator.isValidateEmail(email: txtEmail.text ?? ""){
            let alert = UIAlertController(title: "Error", message: "Invalid Email", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
            return
        }
        
        if !InputValidator.isValidateMobileNo(txtMobile.text ?? ""){
            let alert = UIAlertController(title: "Error", message: "Invalid Phone No", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
            return
        }
        
        if !InputValidator.isValidatePassword(pass: txtPassword.text ?? "" , minLenght: 6, maxLenght: 50){
            let alert = UIAlertController(title: "Error", message: "Password Requirement not succeed", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
            
            return
        }
        let user = User(userName: txtName.text ?? "", userEmail: txtEmail.text ?? "", userMobile: txtPassword.text ?? "" , userPassword: txtMobile.text ?? "")
        
        registerUser(user: user)
        
    }
    
    func saveUserData(user: User){
        let randomInt = Int.random(in: 1..<10000)
        let userData = [
            "Username" : user.userName,
            "UserEmail" : user.userEmail,
            "UserPhone" : user.userMobile,
            "UserPassword" : user.userPassword]
        self.ref.child("users").child("\(randomInt)").setValue(userData)
       {
            (error, ref) in
            
            if let err = error{
                print(err.localizedDescription)
                let alert = UIAlertController(title: "Error", message: "User sign up failed!", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                
                return
            }
            let alert = UIAlertController(title: "Error", message: "User sign up successfully!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    


