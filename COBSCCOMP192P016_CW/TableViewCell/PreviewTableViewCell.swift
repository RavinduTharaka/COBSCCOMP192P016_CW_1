//
//  PreviewTableViewCell.swift
//  COBSCCOMP192P016_CW
//
//  Created by Ravindu Tharaka Ranathunga on 2021-04-29.
//

import UIKit

class PreviewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var lblImage: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
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
    
}
