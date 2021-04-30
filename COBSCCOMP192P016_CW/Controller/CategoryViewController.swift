//
//  CategoryViewController.swift
//  COBSCCOMP192P016_CW
//
//  Created by Ravindu Tharaka Ranathunga on 2021-04-29.
//

import UIKit
import Firebase
import Loaf

class CategoryViewController: UIViewController {

    @IBOutlet weak var lblCatName: UITextField!
    @IBOutlet weak var tblCategory: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    
    var ref: DatabaseReference!
       
       var Foodcategories : [FoodCategory] = []
       
       override func viewDidLoad() {
           super.viewDidLoad()
       
        btnAdd.layer.cornerRadius = 25.0
           
        tblCategory.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryCellIdentifier")
                   
           ref = Database.database().reference()
           
           getcategoryData()
           
           self.tblCategory.reloadData();
       }
    @IBAction func Btnclicked(_ sender: UIButton) {
        if let name = lblCatName.text {
                            
                            //let randomInt = Int.random(in: 1..<10000)
                            
                            ref.child("Category").childByAutoId().setValue(["name": name])
                            {
                                (error, ref) in
                                
                                if let err = error{
                                    print(err.localizedDescription)
                                    Loaf("Data save failed!", state: .error, sender: self).show()
                                    
                                }
                                
                                Loaf("Data save successfully!", state: .success, sender: self).show()
                                
                                self.lblCatName.text = "";
                                self.getcategoryData()
    
                                
                                
                            }
                            
                        } else {
                            
                            Loaf("Enter a category name", state: .error, sender: self).show()
                        }
    }
   // @IBAction func btnAddClicked(_ sender: UIButton) {
        
}


extension CategoryViewController {
    
    func getcategoryData() {
   
        self.Foodcategories.removeAll();
        
        ref.child("Category").observe(.value) { (snapshot) in
            
            if let data = snapshot.value as? [String : Any] {
                
                for Category in data {
                                        
                    if let catinfo = Category.value as? [String : Any]{
                        
                        self.Foodcategories.append(FoodCategory(id : Category.key,Name: catinfo["name"] as! String))
                        
                        //print(self.Foodcategories)
                        
                    }
                }
                
                
                self.tblCategory.reloadData()
                
    }
        }
        
        
        
}
        
}

extension CategoryViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Foodcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblCategory.dequeueReusableCell(withIdentifier: "CategoryCellIdentifier", for: indexPath) as! CategoryTableViewCell
        
        cell.selectionStyle = .none
        cell.setupView(foodCategory: self.Foodcategories[indexPath.row])
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
            self.deleteCategory(id: self.Foodcategories[indexPath.row])
            
        }
    }
    
    func deleteCategory(id: FoodCategory ){
        
        ref.child("Category")
            .child(id.id)
            .removeValue() {
                error, ref in
                if error != nil {
                    Loaf("Could not remove category", state: .error, sender: self).show()
                } else {
                    Loaf("Category Removed", state: .success, sender: self).show()

                    self.getcategoryData()
                }            }
        
            
    }

}
    

