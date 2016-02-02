//
//  GiftDetailVC.swift
//  Valentine
//
//  Created by Nick on 2/1/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class GiftDetailVC: UIViewController {

    var gift: [String:String]!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var giftName: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        giftName.text = gift["name"]
        detail.text = gift["detail"]
        imageView.image = UIImage(named: gift["image"]!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func redeemPushed(sender: AnyObject) {
        // @TODO remove this item from list
    }
}
