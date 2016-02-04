//
//  FavCollectionCell.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 21/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

class FavCollectionCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!

    @IBOutlet weak var prize2: UILabel!
    @IBOutlet weak var prize1: UILabel!
    @IBOutlet weak var shopeName: UILabel!
    
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var shopButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

}
