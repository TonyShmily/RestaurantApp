//
//  DetailTableViewCell.swift
//  RestaurantApp
//
//  Created by 姚鸿 on 16/4/11.
//  Copyright © 2016年 TonyShmily. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldLable: UILabel!
    @IBOutlet weak var valueLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
