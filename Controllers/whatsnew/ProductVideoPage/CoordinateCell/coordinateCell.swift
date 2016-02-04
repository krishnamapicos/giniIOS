//
//  coordinateCell.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 19/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

class coordinateCell: UITableViewCell {
    @IBOutlet weak var vw: UIView!

    @IBOutlet weak var headlb: UILabel!
    @IBOutlet weak var fav: UIImageView!
    @IBOutlet weak var prize2: UILabel!
    @IBOutlet weak var prize1: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
