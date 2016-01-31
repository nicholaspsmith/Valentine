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
    }
    
    func configureCell(image: String, label: String) {
        thumbImg.image = UIImage(named: image)
        giftNameLbl.text = label
    }
}
