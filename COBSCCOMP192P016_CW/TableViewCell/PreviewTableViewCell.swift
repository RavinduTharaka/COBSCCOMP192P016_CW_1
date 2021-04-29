//
//  PreviewTableViewCell.swift
//  COBSCCOMP192P016_CW
//
//  Created by Ravindu Tharaka Ranathunga on 2021-04-29.
//

import UIKit
import Kingfisher

class PreviewTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDes: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(foodItem: FoodItems){
        lblName.text = foodItem.foodName
        lblDes.text = foodItem.foodDescription
        lblPrice.text = "LKR \(foodItem.foodPrice)"
        foodImg.kf.setImage(with: URL(string: foodItem.Image))
        
        if foodItem.discount > 0 {
            lblDes.isHidden = false
            lblDiscount.text = "\(foodItem.discount)%"
        }else {
            lblDes.isHidden = true
            lblDiscount.text = ""
        }
    }
    
}
