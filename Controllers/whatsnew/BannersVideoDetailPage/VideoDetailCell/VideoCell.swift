//
//  VideoCell.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 08/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
    @IBOutlet weak var favBtn: NSLayoutConstraint!

    @IBOutlet weak var shopBtn: UIButton!
    @IBOutlet weak var prizelb1: UILabel!
    @IBOutlet weak var nameLb: UILabel!
    
    @IBOutlet weak var prizelb2: UILabel!
    @IBOutlet weak var im: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
