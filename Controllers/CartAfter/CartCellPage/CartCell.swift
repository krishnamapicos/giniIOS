//
//  CartCell.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 25/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var cartImg: UIImageView!
    @IBOutlet weak var cartDelBtn: UIButton!
    @IBOutlet weak var cartlb4: UILabel!
    @IBOutlet weak var prize2: UILabel!
    @IBOutlet weak var prize1: UILabel!
    @IBOutlet weak var cartlb3: UILabel!
    @IBOutlet weak var cartlb2: UILabel!
    @IBOutlet weak var cartLb1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
