//
//  GiftCell.swift
//  Valentine
//
//  Created by Nick on 1/31/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class GiftCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var giftNameLbl: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(gift: Gift) {
        thumbImg.image = UIImage(named: gift.imagePath)
        giftNameLbl.text = gift.giftName
    }
}
